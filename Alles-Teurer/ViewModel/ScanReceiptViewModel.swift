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
    var selectedRechnungszeilen: Set<UUID> = []
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
        selectedRechnungszeilen = []
        scanState = .idle
        errorMessage = nil
    }
    
    // MARK: - Foundation Models Integration
    
    private func processReceiptWithFoundationModels(_ image: UIImage) async {
        logger.info("Processing receipt with Foundation Models")
        scanState = .processing
        errorMessage = nil
        
        do {
            // Convert UIImage to CGImage
            guard let cgImage = image.cgImage else {
                throw RechnungserkennungError.invalidImage
            }
            
            // Extract all receipt line items using Foundation Models
            let rechnungszeilen = try await rechnungserkennung.extractRechnungszeilen(from: cgImage)
            
            // Also extract raw text for display purposes
            extractedText = try await extractTextForDisplay(image)
            
            // Store the results
            extractedRechnungszeilen = rechnungszeilen
            
            // Auto-select all items by default
            selectedRechnungszeilen = Set(rechnungszeilen.map { $0.id })
            
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
            Datum: Date.now,
            NormalizedName: "Keines",
 
        )
    }
    
    // MARK: - Selection Methods
    
    func toggleSelection(for rechnungszeile: Rechnungszeile) {
        if selectedRechnungszeilen.contains(rechnungszeile.id) {
            selectedRechnungszeilen.remove(rechnungszeile.id)
        } else {
            selectedRechnungszeilen.insert(rechnungszeile.id)
        }
    }
    
    func selectAll() {
        selectedRechnungszeilen = Set(extractedRechnungszeilen.map { $0.id })
    }
    
    func deselectAll() {
        selectedRechnungszeilen.removeAll()
    }
    
    func isSelected(_ rechnungszeile: Rechnungszeile) -> Bool {
        selectedRechnungszeilen.contains(rechnungszeile.id)
    }
    
    var selectedCount: Int {
        selectedRechnungszeilen.count
    }
    
    var hasSelectedItems: Bool {
        !selectedRechnungszeilen.isEmpty
    }
    
    // MARK: - Import Methods
    
    func importSelectedRechnungszeilen(to modelContext: ModelContext) {
        let itemsToImport = extractedRechnungszeilen.filter { selectedRechnungszeilen.contains($0.id) }
        logger.info("Importing \(itemsToImport.count) selected Rechnungszeilen to database")
        
        guard !itemsToImport.isEmpty else {
            handleError("Keine Rechnungszeilen zum Importieren ausgewählt")
            return
        }
        
        for rechnungszeile in itemsToImport {
            modelContext.insert(rechnungszeile)
        }
        
        do {
            try modelContext.save()
            logger.info("Successfully imported \(itemsToImport.count) selected Rechnungszeilen")
        } catch {
            logger.error("Failed to save Rechnungszeilen: \(error)")
            self.handleError("Fehler beim Speichern: \(error.localizedDescription)")
        }
    }
    
    func importExtractedRechnungszeilen(to modelContext: ModelContext) {
        // Legacy method - import all items
        selectAll()
        importSelectedRechnungszeilen(to: modelContext)
    }
    
    // MARK: - Private Methods
    
    private func handleError(_ message: String) {
        errorMessage = message
        scanState = .error
        logger.error("\(message)")
    }
}
