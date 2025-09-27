//
//  Rechnungserkennung.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 27.09.25.
//

import Foundation
import Vision
import UIKit
import OSLog
import FoundationModels

/// Service for recognizing receipt data from images using Apple's Foundation Models
@MainActor
final class Rechnungserkennung {
    
    // MARK: - Properties
    private let logger = Logger(subsystem: "com.alles-teurer.app", category: "Rechnungserkennung")
    private let systemModel = SystemLanguageModel.default
    
    // MARK: - Public Methods
    
    /// Extracts receipt line items from an image using Foundation Models
    /// - Parameter image: The receipt image to process
    /// - Returns: Array of extracted Rechnungszeile objects
    /// - Throws: RechnungserkennungError for various failure cases
    func extractRechnungszeilen(from image: UIImage) async throws -> [Rechnungszeile] {
        logger.info("Starting receipt recognition process")
        
        // Check if Foundation Models are available
        guard systemModel.availability == .available else {
            throw RechnungserkennungError.modelUnavailable(systemModel.availability)
        }
        
        // Step 1: Extract text from image using Vision Framework
        let extractedText = try await extractTextFromImage(image)
        logger.info("Extracted text length: \(extractedText.count) characters")
        
        // Step 2: Use Foundation Models to parse structured data
        let receiptData = try await parseReceiptWithFoundationModels(extractedText)
        logger.info("Successfully parsed receipt with \(receiptData.lineItems.count) line items")
        
        // Step 3: Convert to Rechnungszeile objects
        let rechnungszeilen = receiptData.lineItems.map { item in
            Rechnungszeile(
                Name: item.productName,
                Price: item.price,
                Category: item.category,
                Shop: receiptData.shopName,
                Datum: receiptData.date,
                NormalizedName: normalizeProductName(item.productName),
                PricePerUnit: item.pricePerUnit ?? item.price
            )
        }
        
        logger.info("Created \(rechnungszeilen.count) Rechnungszeile objects")
        return rechnungszeilen
    }
    
    // MARK: - Private Methods - Vision Framework
    
    private func extractTextFromImage(_ image: UIImage) async throws -> String {
        guard let cgImage = image.cgImage else {
            throw RechnungserkennungError.invalidImage
        }
        
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
    
    private func parseReceiptWithFoundationModels(_ text: String) async throws -> ParsedReceiptData {
        logger.info("Using Foundation Models to parse receipt data")
        
        // Create structured instructions for the model
        let instructions = """
        Du bist ein Experte für die Analyse von deutschen Kassenbons und Rechnungen. 
        Deine Aufgabe ist es, strukturierte Daten aus Rechnungstexten zu extrahieren.
        
        Befolge diese Regeln:
        - Extrahiere ALLE Produkte/Artikel aus der Rechnung
        - Ignoriere Rabatte, Pfand und Gesamtsummen
        - Verwende deutsche Produktnamen wie sie auf der Rechnung stehen
        - Kategorisiere Produkte nach österreichischen/deutschen Standards
        - Extrahiere Einzelpreise, nicht Gesamtsummen
        - Behandle Mengenangaben (kg, Stk, etc.) korrekt
        
        Antworte ausschließlich mit gültigem JSON ohne zusätzlichen Text.
        """
        
        let session = LanguageModelSession(instructions: instructions)
        
        // Create the parsing prompt
        let prompt = """
        Analysiere diese deutsche Rechnung und extrahiere alle Informationen als JSON:

        \(text)

        Erstelle JSON mit folgender Struktur:
        {
          "shopName": "Name des Geschäfts",
          "date": "YYYY-MM-DD",
          "lineItems": [
            {
              "productName": "Exakter Produktname",
              "price": 1.23,
              "category": "Kategorie (Lebensmittel/Drogerie/etc.)",
              "quantity": "Menge falls angegeben",
              "pricePerUnit": 1.23
            }
          ]
        }
        """
        
        do {
            let response = try await session.respond(to: prompt)
            return try parseJSONResponse(response.content)
        } catch {
            logger.error("Foundation Models parsing failed: \(error)")
            throw RechnungserkennungError.foundationModelsError(error)
        }
    }
    
    private func parseJSONResponse(_ response: String) throws -> ParsedReceiptData {
        // Clean the response to extract JSON
        let cleanedResponse = extractJSONFromResponse(response)
        
        guard let data = cleanedResponse.data(using: .utf8) else {
            throw RechnungserkennungError.invalidJSONResponse
        }
        
        do {
            return try JSONDecoder().decode(ParsedReceiptData.self, from: data)
        } catch {
            logger.error("JSON parsing failed: \(error)")
            logger.error("Response was: \(cleanedResponse)")
            throw RechnungserkennungError.jsonDecodingFailed(error)
        }
    }
    
    private func extractJSONFromResponse(_ response: String) -> String {
        // Look for JSON content between { and }
        if let startIndex = response.firstIndex(of: "{"),
           let endIndex = response.lastIndex(of: "}") {
            return String(response[startIndex...endIndex])
        }
        
        // If no braces found, return the original response
        return response
    }
    
    // MARK: - Helper Methods
    
    private func normalizeProductName(_ name: String) -> String {
        // Normalize product names for better matching
        return name
            .lowercased()
            .replacingOccurrences(of: "ä", with: "ae")
            .replacingOccurrences(of: "ö", with: "oe")
            .replacingOccurrences(of: "ü", with: "ue")
            .replacingOccurrences(of: "ß", with: "ss")
            .components(separatedBy: .punctuationCharacters)
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespaces)
    }
}

// MARK: - Data Models

struct ParsedReceiptData: Codable {
    let shopName: String
    let date: Date
    let lineItems: [ReceiptLineItem]
    
    enum CodingKeys: String, CodingKey {
        case shopName, date, lineItems
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        shopName = try container.decode(String.self, forKey: .shopName)
        lineItems = try container.decode([ReceiptLineItem].self, forKey: .lineItems)
        
        // Handle date parsing from string
        let dateString = try container.decode(String.self, forKey: .date)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let parsedDate = formatter.date(from: dateString) {
            date = parsedDate
        } else {
            // Fallback to current date if parsing fails
            date = Date()
        }
    }
}

struct ReceiptLineItem: Codable {
    let productName: String
    let price: Decimal
    let category: String
    let quantity: String?
    let pricePerUnit: Decimal?
    
    enum CodingKeys: String, CodingKey {
        case productName, price, category, quantity, pricePerUnit
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        productName = try container.decode(String.self, forKey: .productName)
        category = try container.decode(String.self, forKey: .category)
        quantity = try container.decodeIfPresent(String.self, forKey: .quantity)
        
        // Handle price parsing from Double
        let priceDouble = try container.decode(Double.self, forKey: .price)
        price = Decimal(priceDouble)
        
        // Handle optional pricePerUnit
        if let pricePerUnitDouble = try container.decodeIfPresent(Double.self, forKey: .pricePerUnit) {
            pricePerUnit = Decimal(pricePerUnitDouble)
        } else {
            pricePerUnit = nil
        }
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
