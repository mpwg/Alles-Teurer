//
//  ReceiptRecognitionService.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 12.10.25.
//

import Foundation
import Vision
import OSLog
import FoundationModels
import SwiftData

/// Service for recognizing receipt data from images using Vision + Foundation Models
@MainActor
final class ReceiptRecognitionService {
    
    // MARK: - Properties
    
    private let logger = Logger(subsystem: "eu.mpwg.alles-teurer", category: "ReceiptRecognition")
    private let systemModel = SystemLanguageModel.default
    private let modelContext: ModelContext?
    
    // MARK: - Initialization
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
    }
    
    // MARK: - Public Methods
    
    /// Extracts purchase items from a receipt image
    /// - Parameter cgImage: The receipt image to process
    /// - Returns: Array of detected purchase items
    /// - Throws: ReceiptRecognitionError for various failure cases
    func extractPurchases(from cgImage: CGImage) async throws -> [DetectedPurchaseItem] {
        logger.info("Starting receipt recognition process")
        
        // Check if Foundation Models are available
        guard systemModel.availability == .available else {
            throw ReceiptRecognitionError.modelUnavailable(systemModel.availability)
        }
        
        // Step 1: Extract text from image using Vision Framework
        let extractedText = try await extractTextFromImage(cgImage)
        logger.info("Extracted text length: \(extractedText.count) characters")
        
        // Step 2: Load existing normalized names for consistency
        let existingNormalizedNames = await getExistingNormalizedNames()
        
        // Step 3: Use Foundation Models to parse structured data
        let receiptData = try await parseReceiptWithFoundationModels(
            extractedText,
            existingNormalizedNames: existingNormalizedNames
        )
        logger.info("Successfully parsed receipt with \(receiptData.lineItems.count) items")
        
        // Step 4: Convert to DetectedPurchaseItem objects
        var items: [DetectedPurchaseItem] = []
        
        for item in receiptData.lineItems {
            let detectedItem = DetectedPurchaseItem(
                productName: item.productName,
                normalizedName: item.normalizedName,
                quantity: item.quantityDouble ?? 1.0,
                unit: item.unit ?? "Stk",
                totalPrice: item.priceDouble,
                shopName: receiptData.shopName,
                date: receiptData.date
            )
            items.append(detectedItem)
        }
        
        logger.info("Created \(items.count) DetectedPurchaseItem objects")
        return items
    }
    
    // MARK: - Private Methods - Vision Framework
    
    private func extractTextFromImage(_ cgImage: CGImage) async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            let request = VNRecognizeTextRequest { request, error in
                if let error = error {
                    continuation.resume(throwing: ReceiptRecognitionError.visionError(error))
                    return
                }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    continuation.resume(throwing: ReceiptRecognitionError.noTextFound)
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
            request.recognitionLanguages = ["de-AT", "de-DE", "en-US"]
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            do {
                try handler.perform([request])
            } catch {
                continuation.resume(throwing: ReceiptRecognitionError.visionError(error))
            }
        }
    }
    
    // MARK: - Private Methods - Foundation Models
    
    private func parseReceiptWithFoundationModels(
        _ text: String,
        existingNormalizedNames: Set<String>
    ) async throws -> ParsedReceiptData {
        logger.info("Using Foundation Models to parse receipt data")
        
        // Combine common product types with existing names for context
        let commonTypes = getCommonAustrianProducts()
        let existingNames = Array(existingNormalizedNames).sorted()
        let allExamples = (commonTypes + existingNames).prefix(50) // Limit to avoid token overflow
        let examplesList = allExamples.joined(separator: ", ")
        
        // Create comprehensive instructions for parsing AND normalization
        let instructions = """
        Du bist ein Experte für die Analyse von österreichischen Kassenbons und Rechnungen.
        
        Deine Aufgabe ist es, strukturierte Daten aus Rechnungstexten zu extrahieren UND gleichzeitig die Produktnamen zu normalisieren.
        
        EXTRAKTION - Befolge diese Regeln:
        - Extrahiere ALLE Produkte/Artikel aus der Rechnung
        - Ignoriere Rabatte, Pfand, MwSt. und Gesamtsummen
        - Verwende deutsche/österreichische Produktnamen wie sie auf der Rechnung stehen
        - Extrahiere Einzelpreise, nicht Gesamtsummen
        - Erkenne Mengenangaben (kg, g, l, ml, Stk) und extrahiere sie separat
        - Standard-Einheit ist "Stk" wenn keine angegeben ist
        - Standard-Menge ist 1.0 wenn keine angegeben ist
        
        NORMALISIERUNG - Für jeden Produktnamen:
        - Entferne ALLE Markennamen (Ja natürlich, Clever, SPAR, BILLA, Hofer, Lidl, etc.)
        - Entferne ALLE Mengenangaben (diese werden separat extrahiert)
        - Entferne Packungsarten (Dose, Flasche, Becher, Tüte, Packung, etc.)
        - Entferne Qualitäts-/Herkunftsangaben (Bio, Premium, Österreichisch, Regional, etc.)
        - Behalte nur den essentiellen Produkttyp
        - Verwende österreichische Begriffe: "Topfen" (nicht Quark), "Paradeiser" (nicht Tomaten), "Erdäpfel" (nicht Kartoffeln)
        - Verwende einheitliche Schreibweise: erste Buchstabe groß, Rest klein
        - Bevorzuge bereits verwendete Begriffe für Konsistenz
        
        BEREITS VERWENDETE NORMALISIERTE NAMEN (verwende diese wenn möglich):
        \(examplesList)
        
        BEISPIELE für Normalisierung:
        "Ja natürlich Bio Joghurt Natur 500g" → normalizedName: "Joghurt", quantity: 0.5, unit: "kg"
        "Clever Erdäpfel mehlig 2kg" → normalizedName: "Erdäpfel", quantity: 2.0, unit: "kg"
        "SPAR Premium Grana Padano gerieben" → normalizedName: "Grana Padano", quantity: 1.0, unit: "Stk"
        "Bio Faschiertes gemischt 500g" → normalizedName: "Faschiertes", quantity: 0.5, unit: "kg"
        "Paprika rot 3 Stk." → normalizedName: "Paprika", quantity: 3.0, unit: "Stk"
        """
        
        let session = LanguageModelSession(instructions: instructions)
        
        // Create the parsing prompt
        let prompt = """
        Analysiere diese österreichische Rechnung und extrahiere alle Informationen.
        Für jedes Produkt gib den Original-Namen, normalisierten Namen, Menge, Einheit und Preis an:

        \(text)
        """
        
        do {
            // Use guided generation to get structured data directly
            let response = try await session.respond(to: prompt, generating: ParsedReceiptData.self)
            return response.content
        } catch {
            logger.error("Foundation Models parsing failed: \(error)")
            throw ReceiptRecognitionError.foundationModelsError(error)
        }
    }
    
    // MARK: - Helper Methods
    
    /// Retrieves existing normalized product names from the database for LLM context
    private func getExistingNormalizedNames() async -> Set<String> {
        guard let modelContext = modelContext else {
            logger.warning("No ModelContext available, using default product types only")
            return Set()
        }
        
        do {
            let descriptor = FetchDescriptor<Product>()
            let allProducts = try modelContext.fetch(descriptor)
            
            let normalizedNames = Set(allProducts.map { $0.normalizedName })
            
            logger.info("Loaded \(normalizedNames.count) existing normalized names from database")
            return normalizedNames
        } catch {
            logger.error("Failed to load existing normalized names: \(error)")
            return Set()
        }
    }
    
    /// Returns common food product types in Austrian supermarkets
    private func getCommonAustrianProducts() -> [String] {
        return [
            "Milch", "Brot", "Joghurt", "Käse", "Butter", "Eier", 
            "Äpfel", "Bananen", "Erdäpfel", "Paradeiser", "Gurken", "Paprika",
            "Fleisch", "Wurst", "Faschiertes", "Hähnchen", 
            "Nudeln", "Reis", "Zucker", "Mehl", "Salz", "Öl"
        ]
    }
}

// MARK: - Data Models

@Generable(description: "Structured receipt data with shop information and line items")
struct ParsedReceiptData {
    @Guide(description: "Name des Geschäfts/Supermarkts (Hofer, Billa, Lidl, Spar, etc.)")
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
    
    @Guide(description: "Menge des Produkts als Dezimalzahl (Standard: 1.0)")
    let quantityDouble: Double?
    
    @Guide(description: "Einheit der Menge (kg, g, l, ml, Stk) - Standard: Stk")
    let unit: String?
}

// MARK: - Error Types

enum ReceiptRecognitionError: LocalizedError {
    case modelUnavailable(SystemLanguageModel.Availability)
    case invalidImage
    case visionError(Error)
    case noTextFound
    case foundationModelsError(Error)
    
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
        }
    }
}
