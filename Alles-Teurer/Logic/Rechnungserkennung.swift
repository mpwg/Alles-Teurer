//
//  Rechnungserkennung.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 27.09.25.
//

import Foundation
import Vision
import UIKit
import FoundationModels
import SwiftData
import OSLog

private let logger = Logger(subsystem: "com.alles-teurer.app", category: "Rechnungserkennung")

/// Service für die Erkennung und Extraktion von Rechnungszeilen aus Bildern
/// Uses Vision framework for OCR and Foundation Models for intelligent parsing
@MainActor
final class Rechnungserkennung: @unchecked Sendable {
    
    // MARK: - Types
    
    enum RechnungserkennungError: LocalizedError {
        case modelUnavailable
        case imageProcessingFailed
        case textExtractionFailed
        case parsingFailed(String)
        case noItemsFound
        
        var errorDescription: String? {
            switch self {
            case .modelUnavailable:
                return "Foundation Models sind nicht verfügbar. Bitte aktivieren Sie Apple Intelligence in den Einstellungen."
            case .imageProcessingFailed:
                return "Bildverarbeitung fehlgeschlagen"
            case .textExtractionFailed:
                return "Texterkennung aus dem Bild fehlgeschlagen"
            case .parsingFailed(let reason):
                return "Rechnungsanalyse fehlgeschlagen: \(reason)"
            case .noItemsFound:
                return "Keine Rechnungszeilen im Bild gefunden"
            }
        }
    }
    
    struct RecognitionResult {
        let rechnungszeilen: [Rechnungszeile]
        let confidence: Double
        let rawText: String
        let processingDate: Date
        
        init(rechnungszeilen: [Rechnungszeile], confidence: Double, rawText: String) {
            self.rechnungszeilen = rechnungszeilen
            self.confidence = confidence
            self.rawText = rawText
            self.processingDate = Date.now
        }
    }
    
    // MARK: - Generable Types for Foundation Models
    
    @Generable(description: "Eine einzelne Rechnungszeile mit Produktinformationen")
    struct ParsedRechnungszeile {
        @Guide(description: "Name des Produkts oder Artikels")
        var name: String
        
        @Guide(description: "Preis als Dezimalzahl (z.B. 4.99 für 4,99 EUR)")
        var preis: Decimal
        
        @Guide(description: "Kategorie des Produkts (z.B. Lebensmittel, Getränke, Haushalt)")
        var kategorie: String
        
        @Guide(description: "Menge oder Anzahl falls erkennbar, sonst 1")
        var menge: Decimal
        
        @Guide(description: "Einheit der Menge (z.B. kg, Stück, Liter) falls erkennbar")
        var einheit: String
    }
    
    @Generable(description: "Analyseergebnis einer Rechnung mit Shop-Informationen und erkannten Produkten")
    struct RechnungsAnalyse {
        @Guide(description: "Name des Geschäfts oder Supermarkts")
        var shopName: String
        
        @Guide(description: "Datum der Rechnung im Format DD.MM.YYYY falls erkennbar")
        var datum: String?
        
        @Guide(description: "Liste aller erkannten Rechnungszeilen", .maximumCount(50))
        var items: [ParsedRechnungszeile]
        
        @Guide(description: "Gesamtsumme der Rechnung falls erkennbar")
        var gesamtsumme: Decimal?
    }
    
    // MARK: - Properties
    
    private let languageModel: SystemLanguageModel
    private let session: LanguageModelSession
    
    // MARK: - Initialization
    
    init() throws {
        // Check if Foundation Models are available
        guard SystemLanguageModel.default.isAvailable else {
            logger.error("Foundation Models nicht verfügbar")
            throw RechnungserkennungError.modelUnavailable
        }
        
        self.languageModel = SystemLanguageModel.default
        
        // Create session with German instructions for Austrian market
        let instructions = Instructions("""
        Du bist ein Experte für die Analyse von Kassenbelegen und Rechnungen.
        
        WICHTIGE ANWEISUNGEN:
        - Erkenne alle Produktzeilen aus dem Rechnungstext
        - Verwende deutsche Produktnamen und Kategorien
        - Preise sind in Euro (EUR) und verwenden deutschen Dezimalstil (Komma)
        - Kategorien sollen auf Deutsch sein (z.B. "Lebensmittel", "Getränke", "Haushalt", "Kosmetik")
        - Ignoriere Rabatte, Pfand, Gesamtsummen und Zahlungszeilen
        - Fokussiere nur auf tatsächliche Produktkäufe
        - Bei unklaren Preisen verwende 0.00
        - Shopname soll der erkannte Geschäftsname sein
        """)
        
        self.session = LanguageModelSession(
            model: languageModel,
            instructions: instructions
        )
        
        logger.info("Rechnungserkennung Service initialisiert")
    }
    
    // MARK: - Public Interface
    
    /// Extrahiert Rechnungszeilen aus einem UIImage
    /// - Parameter image: Das Bild der Rechnung
    /// - Returns: RecognitionResult mit erkannten Rechnungszeilen
    /// - Throws: RechnungserkennungError bei Fehlern
    func extractRechnungszeilen(from image: UIImage) async throws -> RecognitionResult {
        logger.info("Starte Extraktion von Rechnungszeilen aus Bild")
        
        // Step 1: Extract text using Vision framework
        let extractedText = try await extractTextFromImage(image)
        logger.debug("Text extrahiert: \(extractedText.prefix(200))...")
        
        // Step 2: Parse text using Foundation Models
        let analyse = try await parseReceiptText(extractedText)
        logger.info("Rechnung analysiert: \(analyse.items.count) Items gefunden")
        
        // Step 3: Convert to Rechnungszeile objects
        let rechnungszeilen = convertToRechnungszeilen(analyse, shopName: analyse.shopName)
        
        guard !rechnungszeilen.isEmpty else {
            logger.warning("Keine Rechnungszeilen gefunden")
            throw RechnungserkennungError.noItemsFound
        }
        
        let confidence = calculateConfidence(for: analyse)
        let result = RecognitionResult(
            rechnungszeilen: rechnungszeilen,
            confidence: confidence,
            rawText: extractedText
        )
        
        logger.info("Extraktion erfolgreich: \(rechnungszeilen.count) Rechnungszeilen mit Confidence: \(confidence)")
        return result
    }
    
    // MARK: - Vision OCR
    
    private func extractTextFromImage(_ image: UIImage) async throws -> String {
        guard let cgImage = image.cgImage else {
            logger.error("Konnte CGImage nicht erstellen")
            throw RechnungserkennungError.imageProcessingFailed
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            let request = VNRecognizeTextRequest { request, error in
                if let error = error {
                    logger.error("Vision Text Recognition Fehler: \(error.localizedDescription)")
                    continuation.resume(throwing: RechnungserkennungError.textExtractionFailed)
                    return
                }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    logger.error("Keine Text-Observations erhalten")
                    continuation.resume(throwing: RechnungserkennungError.textExtractionFailed)
                    return
                }
                
                let recognizedText = observations.compactMap { observation in
                    observation.topCandidates(1).first?.string
                }.joined(separator: "\n")
                
                continuation.resume(returning: recognizedText)
            }
            
            // Configure for best receipt recognition
            request.recognitionLevel = .accurate
            request.recognitionLanguages = ["de", "en"] // German and English for receipts
            request.usesLanguageCorrection = true
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            do {
                try handler.perform([request])
            } catch {
                logger.error("Vision Handler Fehler: \(error.localizedDescription)")
                continuation.resume(throwing: RechnungserkennungError.textExtractionFailed)
            }
        }
    }
    
    // MARK: - Foundation Models Parsing
    
    private func parseReceiptText(_ text: String) async throws -> RechnungsAnalyse {
        do {
            let prompt = Prompt("""
            Analysiere den folgenden Kassenbeleg-Text und extrahiere alle Rechnungszeilen:
            
            \(text)
            
            Erkenne dabei:
            - Produktnamen
            - Preise (konvertiere zu Dezimalzahlen, z.B. "4,99" → 4.99)
            - Kategorien (deutsche Bezeichnungen)
            - Shop-Name
            - Datum falls vorhanden
            
            Ignoriere: Summenzeilen, Pfand, Rabatte, Zahlungsarten, Treuepunkte
            """)
            
            let response = try await session.respond(
                to: prompt,
                generating: RechnungsAnalyse.self
            )
            
            logger.debug("Foundation Models Response erhalten: \(response.items.count) Items")
            return response
            
        } catch let error as LanguageModelSession.GenerationError {
            let errorMessage = handleFoundationModelsError(error)
            logger.error("Foundation Models Fehler: \(errorMessage)")
            throw RechnungserkennungError.parsingFailed(errorMessage)
        } catch {
            logger.error("Unbekannter Parsing-Fehler: \(error.localizedDescription)")
            throw RechnungserkennungError.parsingFailed(error.localizedDescription)
        }
    }
    
    private func handleFoundationModelsError(_ error: LanguageModelSession.GenerationError) -> String {
        switch error {
        case .guardrailViolation:
            return "Sicherheitsfilter ausgelöst - Text könnte problematische Inhalte enthalten"
        case .refusal(let refusal, _):
            return "Modell verweigert Anfrage: \(refusal)"
        case .exceededContextWindowSize:
            return "Text zu lang für Verarbeitung"
        case .unsupportedLanguageOrLocale:
            return "Sprache wird nicht unterstützt"
        case .rateLimited:
            return "Zu viele Anfragen - bitte versuchen Sie es später erneut"
        default:
            return "Foundation Models Verarbeitungsfehler"
        }
    }
    
    // MARK: - Data Conversion
    
    private func convertToRechnungszeilen(_ analyse: RechnungsAnalyse, shopName: String) -> [Rechnungszeile] {
        let datum = parseDatum(analyse.datum) ?? Date.now
        
        return analyse.items.compactMap { item in
            // Validate that we have essential data
            guard !item.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                  item.preis > 0 else {
                logger.debug("Überspringe invalides Item: \(item.name) - Preis: \(item.preis)")
                return nil
            }
            
            return Rechnungszeile(
                Name: item.name.trimmingCharacters(in: .whitespacesAndNewlines),
                Price: item.preis,
                Category: item.kategorie.trimmingCharacters(in: .whitespacesAndNewlines),
                Shop: shopName.trimmingCharacters(in: .whitespacesAndNewlines),
                Datum: datum
            )
        }
    }
    
    private func parseDatum(_ datumString: String?) -> Date? {
        guard let datumString = datumString?.trimmingCharacters(in: .whitespacesAndNewlines),
              !datumString.isEmpty else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_AT") // Austrian locale
        
        // Try different date formats common on receipts
        let formats = ["dd.MM.yyyy", "dd/MM/yyyy", "dd-MM-yyyy", "d.M.yyyy", "d/M/yyyy"]
        
        for format in formats {
            formatter.dateFormat = format
            if let date = formatter.date(from: datumString) {
                return date
            }
        }
        
        logger.debug("Konnte Datum nicht parsen: '\(datumString)'")
        return nil
    }
    
    private func calculateConfidence(for analyse: RechnungsAnalyse) -> Double {
        var confidence: Double = 0.0
        let itemCount = Double(analyse.items.count)
        
        // Base confidence from number of items found
        if itemCount > 0 {
            confidence += 0.3
        }
        
        // Confidence boost for valid prices
        let validPrices = analyse.items.filter { $0.preis > 0 }.count
        if itemCount > 0 {
            confidence += 0.4 * (Double(validPrices) / itemCount)
        }
        
        // Confidence boost for non-empty names
        let validNames = analyse.items.filter { !$0.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }.count
        if itemCount > 0 {
            confidence += 0.2 * (Double(validNames) / itemCount)
        }
        
        // Confidence boost for shop name
        if !analyse.shopName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            confidence += 0.1
        }
        
        return min(confidence, 1.0)
    }
}

// MARK: - Accessibility Support

extension Rechnungserkennung {
    
    /// Provides accessible description of recognition results
    func accessibleDescription(for result: RecognitionResult) -> String {
        let itemCount = result.rechnungszeilen.count
        let totalValue = result.rechnungszeilen.reduce(Decimal.zero) { $0 + $1.Price }
        let confidencePercent = Int(result.confidence * 100)
        
        return """
        Rechnung erkannt mit \(confidencePercent) Prozent Sicherheit. \
        \(itemCount) Artikel gefunden mit einem Gesamtwert von \(totalValue) Euro. \
        Verarbeitet am \(DateFormatter.localizedString(from: result.processingDate, dateStyle: .medium, timeStyle: .short)).
        """
    }
}
