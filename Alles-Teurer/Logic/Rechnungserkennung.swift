//
//  Rechnungserkennung.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 27.09.25.
//

import Foundation
import Vision
import OSLog
import FoundationModels
import SwiftData

/// Service for recognizing receipt data from images using Apple's Foundation Models
@MainActor
final class Rechnungserkennung {
    
    // MARK: - Properties
    private let logger = Logger(subsystem: "com.alles-teurer.app", category: "Rechnungserkennung")
    private let systemModel = SystemLanguageModel.default
    private let modelContext: ModelContext?
    
    // MARK: - Initialization
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
    }
    
    // MARK: - Public Methods
    
    /// Extracts receipt line items from an image using Foundation Models
    /// - Parameter cgImage: The receipt CGImage to process
    /// - Returns: Array of extracted Rechnungszeile objects
    /// - Throws: RechnungserkennungError for various failure cases
    func extractRechnungszeilen(from cgImage: CGImage) async throws -> [Rechnungszeile] {
        logger.info("Starting receipt recognition process")
        
        // Check if Foundation Models are available
        guard systemModel.availability == .available else {
            throw RechnungserkennungError.modelUnavailable(systemModel.availability)
        }
        
        // Step 1: Extract text from image using Vision Framework
        let extractedText = try await extractTextFromImage(cgImage)
        logger.info("Extracted text length: \(extractedText.count) characters")
        
        // Step 2: Load existing normalized names for LLM context
        let existingNormalizedNames = await getExistingNormalizedNames()
        
        // Step 3: Use Foundation Models to parse structured data AND normalize names in one step
        let receiptData = try await parseReceiptWithFoundationModels(extractedText, existingNormalizedNames: existingNormalizedNames)
        logger.info("Successfully parsed receipt with \(receiptData.lineItems.count) line items")
        
        // Step 4: Convert to Rechnungszeile objects (normalization already done)
        var rechnungszeilen: [Rechnungszeile] = []
        
        for item in receiptData.lineItems {
            let rechnungszeile = Rechnungszeile(
                Name: item.productName,
                Price: item.price,
                Category: item.category,
                Shop: receiptData.shopName,
                Datum: receiptData.date,
                NormalizedName: item.normalizedName,
                PricePerUnit: item.pricePerUnit ?? item.price
            )
            
            rechnungszeilen.append(rechnungszeile)
        }
        
        logger.info("Created \(rechnungszeilen.count) Rechnungszeile objects")
        return rechnungszeilen
    }
    
    // MARK: - Private Methods - Vision Framework
    
    private func extractTextFromImage(_ cgImage: CGImage) async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            let request = VNRecognizeTextRequest { request, error in
                if let error = error {
                    continuation.resume(throwing: RechnungserkennungError.visionError(error))
                    return
                }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    continuation.resume(throwing: RechnungserkennungError.noTextFound)
                    return
                }
                
                let recognizedStrings = observations.compactMap { observation in
                    observation.topCandidates(1).first?.string
                }
                
                let extractedText = recognizedStrings.joined(separator: "\n")
                continuation.resume(returning: extractedText)
            }
            
            // Configure request for optimal receipt recognition
            request.recognitionLevel = .accurate
            request.usesLanguageCorrection = true
            request.recognitionLanguages = ["de-DE", "en-US"]
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            do {
                try handler.perform([request])
            } catch {
                continuation.resume(throwing: RechnungserkennungError.visionError(error))
            }
        }
    }
    
    // MARK: - Private Methods - Foundation Models
    
    private func parseReceiptWithFoundationModels(_ text: String, existingNormalizedNames: Set<String>) async throws -> ParsedReceiptData {
        logger.info("Using Foundation Models to parse receipt data with integrated normalization")
        
        // Combine common product types with existing normalized names for context
        let commonTypes = getCommonProductTypes()
        let existingNames = Array(existingNormalizedNames).sorted()
        let allExamples = (commonTypes + existingNames).prefix(50) // Limit to avoid token overflow
        let examplesList = allExamples.joined(separator: ", ")
        
        // Create comprehensive instructions for parsing AND normalization
        let instructions = """
        Du bist ein Experte für die Analyse von deutschen Kassenbons und Rechnungen mit Spezialisierung auf Produktnormalisierung.
        
        Deine Aufgabe ist es, strukturierte Daten aus Rechnungstexten zu extrahieren UND gleichzeitig die Produktnamen zu normalisieren.
        
        EXTRAKTION - Befolge diese Regeln:
        - Extrahiere ALLE Produkte/Artikel aus der Rechnung
        - Ignoriere Rabatte, Pfand und Gesamtsummen
        - Verwende deutsche Produktnamen wie sie auf der Rechnung stehen
        - Kategorisiere Produkte nach österreichischen/deutschen Standards
        - Extrahiere Einzelpreise, nicht Gesamtsummen
        - Behandle Mengenangaben (kg, Stk, etc.) korrekt
        
        NORMALISIERUNG - Für jeden Produktnamen:
        - Entferne ALLE Markennamen (Ja natürlich, Clever, SPAR, BILLA, Hofer, etc.)
        - Entferne ALLE Mengenangaben (kg, g, ml, l, Stück, Pack, etc.)
        - Entferne Packungsarten (Dose, Flasche, Becher, Tüte, etc.)
        - Entferne Qualitäts-/Herkunftsangaben (Bio, Premium, Österreichisch, etc.)
        - Behalte nur den essentiellen Produkttyp
        - Verwende österreichische Begriffe: "Topfen" (nicht Quark), "Paradeiser" (nicht Tomaten), "Erdäpfel" (nicht Kartoffeln)
        - Verwende einheitliche Schreibweise: erste Buchstabe groß, Rest klein
        - Bevorzuge bereits verwendete Begriffe für Konsistenz
        
        BEREITS VERWENDETE NORMALISIERTE NAMEN (verwende diese wenn möglich):
        \(examplesList)
        
        BEISPIELE für Normalisierung:
        "Ja natürlich Bio Joghurt Natur 500g" → "Joghurt"
        "Clever Erdäpfel mehlig 2kg" → "Erdäpfel"
        "SPAR Premium Grana Padano gerieben" → "Grana Padano"
        "Bio Faschiertes gemischt 500g" → "Faschiertes"
        "DKIH Paprika rot 1 Stk." → "Paprika"
        """
        
        let session = LanguageModelSession(instructions: instructions)
        
        // Create the parsing prompt
        let prompt = """
        Analysiere diese deutsche Rechnung und extrahiere alle Informationen.
        Für jedes Produkt gib sowohl den Original-Namen als auch den normalisierten Namen an:

        \(text)
        """
        
        do {
            // Use guided generation to get structured data directly
            let response = try await session.respond(to: prompt, generating: ParsedReceiptData.self)
            return response.content
        } catch {
            logger.error("Foundation Models parsing with normalization failed: \(error)")
            throw RechnungserkennungError.foundationModelsError(error)
        }
    }
    
    // MARK: - Helper Methods
    
    /// Retrieves existing normalized product names from the database for LLM context
    internal func getExistingNormalizedNames() async -> Set<String> {
        guard let modelContext = modelContext else {
            logger.warning("No ModelContext available, using default product types only")
            return Set()
        }
        
        do {
            let descriptor = FetchDescriptor<Rechnungszeile>()
            let allItems = try modelContext.fetch(descriptor)
            
            let normalizedNames = Set(allItems.compactMap { item in
                let normalized = item.NormalizedName.trimmingCharacters(in: .whitespacesAndNewlines)
                return normalized.isEmpty ? nil : normalized
            })
            
            logger.info("Loaded \(normalizedNames.count) existing normalized names from database")
            return normalizedNames
        } catch {
            logger.error("Failed to load existing normalized names: \(error)")
            return Set()
        }
    }
    
    /// Returns the 20 most common food product types in Austrian/German supermarkets
    internal func getCommonProductTypes() -> [String] {
        return [
            "Milch", "Brot", "Joghurt", "Käse", "Butter", "Eier", 
            "Äpfel", "Bananen", "Erdäpfel", "Paradeiser", "Gurken", "Paprika",
            "Fleisch", "Wurst", "Faschiertes", "Hähnchen", 
            "Nudeln", "Reis", "Zucker", "Mehl"
        ]
    }
}

/// MARK: - Data Models

@Generable(description: "Structured receipt data with shop information and line items")
struct ParsedReceiptData {
    @Guide(description: "Name des Geschäfts/Supermarkts")
    let shopName: String
    
    @Guide(description: "Datum der Rechnung im Format YYYY-MM-DD")
    let dateString: String
    
    @Guide(description: "Liste aller Produkte auf der Rechnung", .maximumCount(50))
    let lineItems: [ReceiptLineItem]
    
    // Computed property to convert dateString to Date
    var date: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: dateString) ?? Date()
    }
}

@Generable(description: "Individual product line item from receipt with normalized name")
struct ReceiptLineItem {
    @Guide(description: "Exakter Produktname wie auf der Rechnung")
    let productName: String
    
    @Guide(description: "Normalisierter Produktname ohne Marke, Menge und Packung")
    let normalizedName: String
    
    @Guide(description: "Preis des Produkts als Dezimalzahl")
    let priceDouble: Double
    
    @Guide(description: "Produktkategorie (Lebensmittel, Drogerie, etc.)")
    let category: String
    
    @Guide(description: "Menge falls angegeben (optional)")
    let quantity: String?
    
    @Guide(description: "Preis pro Einheit falls anders als Gesamtpreis (optional)")
    let pricePerUnitDouble: Double?
    
    // Computed properties to convert Double to Decimal
    var price: Decimal {
        return Decimal(priceDouble)
    }
    
    var pricePerUnit: Decimal? {
        guard let pricePerUnitDouble = pricePerUnitDouble else { return nil }
        return Decimal(pricePerUnitDouble)
    }
}

// MARK: - Error Types

enum RechnungserkennungError: LocalizedError {
    case modelUnavailable(SystemLanguageModel.Availability)
    case invalidImage
    case visionError(Error)
    case noTextFound
    case foundationModelsError(Error)
    case invalidJSONResponse
    case jsonDecodingFailed(Error)
    
    var errorDescription: String? {
        switch self {
        case .modelUnavailable(let availability):
            switch availability {
            case .unavailable(.deviceNotEligible):
                return "Dieses Gerät unterstützt Apple Intelligence nicht."
            case .unavailable(.appleIntelligenceNotEnabled):
                return "Bitte aktivieren Sie Apple Intelligence in den Einstellungen."
            case .unavailable(.modelNotReady):
                return "Das Sprachmodell wird noch geladen. Bitte versuchen Sie es später erneut."
            case .unavailable(let other):
                return "Sprachmodell nicht verfügbar: \(other)"
            case .available:
                return "Unerwarteter Fehler bei verfügbarem Modell."
            }
        case .invalidImage:
            return "Das Bild konnte nicht verarbeitet werden."
        case .visionError(let error):
            return "Fehler bei der Texterkennung: \(error.localizedDescription)"
        case .noTextFound:
            return "Kein Text auf dem Bild gefunden."
        case .foundationModelsError(let error):
            return "Fehler bei der KI-Analyse: \(error.localizedDescription)"
        case .invalidJSONResponse:
            return "Ungültige Antwort vom Sprachmodell."
        case .jsonDecodingFailed(let error):
            return "Fehler beim Parsen der KI-Antwort: \(error.localizedDescription)"
        }
    }
}
