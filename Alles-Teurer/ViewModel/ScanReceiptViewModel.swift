import SwiftUI
import PhotosUI
import Vision
import SwiftData
import OSLog
import NaturalLanguage

@MainActor
@Observable
final class ScanReceiptViewModel {
    // MARK: - Published Properties
    var selectedImage: UIImage?
    var extractedText: String = ""
    var extractedRechnungszeilen: [Rechnungszeile] = []
    var scanState: ScanState = .idle
    var errorMessage: String?
    
    // MARK: - Private Properties
    private let logger = Logger(subsystem: "com.alles-teurer.app", category: "ScanReceiptViewModel")
    private let rechnungserkennung = Rechnungserkennung()
    
    // MARK: - Enums
    enum ScanState {
        case idle
        case processing
        case success
        case error
    }
    
    // MARK: - Public Methods
    func processImage(_ image: UIImage) {
        selectedImage = image
        Task {
            await processReceiptWithFoundationModels(image)
        }
    }
    
    func reset() {
        selectedImage = nil
        extractedText = ""
        extractedRechnungszeilen = []
        scanState = .idle
        errorMessage = nil
    }
    
    // MARK: - Foundation Models Integration
    
    private func processReceiptWithFoundationModels(_ image: UIImage) async {
        logger.info("Processing receipt with Foundation Models")
        scanState = .processing
        errorMessage = nil
        
        do {
            // Extract all receipt line items using Foundation Models
            let rechnungszeilen = try await rechnungserkennung.extractRechnungszeilen(from: image)
            
            // Also extract raw text for display purposes
            extractedText = try await extractTextForDisplay(image)
            
            // Store the results
            extractedRechnungszeilen = rechnungszeilen
            
            logger.info("Successfully extracted \(rechnungszeilen.count) line items from receipt")
            scanState = .success
            
        } catch let error as RechnungserkennungError {
            logger.error("Receipt recognition failed: \(error.localizedDescription)")
            handleError(error.localizedDescription)
        } catch {
            logger.error("Unexpected error during receipt processing: \(error)")
            handleError("Unerwarteter Fehler: \(error.localizedDescription)")
        }
    }
    
    private func extractTextForDisplay(_ image: UIImage) async throws -> String {
        guard let cgImage = image.cgImage else {
            throw RechnungserkennungError.invalidImage
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            let request = VNRecognizeTextRequest { request, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    continuation.resume(returning: "")
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
                continuation.resume(throwing: error)
            }
        }
    }
    
    // MARK: - Legacy Methods (for backward compatibility)
    
    func createRechnungszeile(from text: String) async -> Rechnungszeile {
        logger.info("Creating single Rechnungszeile from text - consider using processImage for better results")
        
        // If we have extracted multiple items, return the first one
        if let firstItem = extractedRechnungszeilen.first {
            return firstItem
        }
        
        // Fallback: create a basic Rechnungszeile from text
        return Rechnungszeile(
            Name: "Gescanntes Produkt",
            Price: 0.00,
            Category: "Gescannt", 
            Shop: "Unbekannter Shop",
            Datum: Date.now
        )
    }
    
    // MARK: - Private Methods
    
    private func handleError(_ message: String) {
        errorMessage = message
        scanState = .error
        logger.error("\(message)")
    }
}