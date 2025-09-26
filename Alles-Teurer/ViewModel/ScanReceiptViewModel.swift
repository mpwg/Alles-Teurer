import SwiftUI
import PhotosUI
import Vision
import SwiftData
import OSLog

@MainActor
@Observable
final class ScanReceiptViewModel {
    // MARK: - Published Properties
    var selectedImage: UIImage?
    var extractedText: String = ""
    var scanState: ScanState = .idle
    var errorMessage: String?
    
    // MARK: - Private Properties
    private let logger = Logger(subsystem: "com.alles-teurer.app", category: "ScanReceiptViewModel")
    
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
        extractTextFromImage(image)
    }
    
    func reset() {
        selectedImage = nil
        extractedText = ""
        scanState = .idle
        errorMessage = nil
    }
    
    func createRechnungszeile(from text: String) -> Rechnungszeile {
        // Basic parsing - can be enhanced later
        let lines = text.components(separatedBy: .newlines).filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
        
        // Simple heuristic to extract information
        let name = lines.first?.trimmingCharacters(in: .whitespaces) ?? "Unbekanntes Produkt"
        let price = extractPrice(from: text) ?? 0.00
        let shop = extractShop(from: text) ?? "Unbekannter Shop"
        
        logger.info("Erstelle Rechnungszeile: \(name) - \(price)€ - \(shop)")
        
        return Rechnungszeile(
            Name: name,
            Price: price,
            Category: "Gescannt",
            Shop: shop,
            Datum: Date.now
        )
    }
    
    // MARK: - Private Methods
    private func extractTextFromImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else {
            handleError("Fehler beim Verarbeiten des Bildes")
            return
        }
        
        scanState = .processing
        errorMessage = nil
        
        let request = VNRecognizeTextRequest { [weak self] request, error in
            Task { @MainActor in
                guard let self = self else { return }
                
                if let error = error {
                    self.handleError("Fehler bei der Texterkennung: \(error.localizedDescription)")
                    return
                }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    self.handleError("Keine Texterkennung möglich")
                    return
                }
                
                let recognizedStrings = observations.compactMap { observation in
                    return observation.topCandidates(1).first?.string
                }
                
                self.extractedText = recognizedStrings.joined(separator: "\n")
                self.scanState = .success
                self.logger.info("Text erfolgreich erkannt: \(self.extractedText.count) Zeichen")
            }
        }
        
        // Konfiguration für bessere Rechnungserkennung
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        request.recognitionLanguages = ["de-DE", "en-US"] // Deutsch und Englisch
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        Task {
            do {
                try handler.perform([request])
            } catch {
                await MainActor.run {
                    self.handleError("Fehler bei der Bildverarbeitung: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func handleError(_ message: String) {
        errorMessage = message
        scanState = .error
        logger.error("\(message)")
    }
    
    private func extractPrice(from text: String) -> Decimal? {
        // Regex für Preiserkennung (€, EUR, Komma/Punkt als Dezimaltrennzeichen)
        let pricePattern = #"(\d{1,3}(?:[.,]\d{3})*[.,]\d{2})\s*(?:€|EUR)|(\d+[.,]\d{2})\s*(?:€|EUR)"#
        
        do {
            let regex = try NSRegularExpression(pattern: pricePattern, options: .caseInsensitive)
            let range = NSRange(location: 0, length: text.utf16.count)
            
            if let match = regex.firstMatch(in: text, options: [], range: range) {
                let matchRange = Range(match.range, in: text)
                if let matchRange = matchRange {
                    let priceString = String(text[matchRange])
                        .replacingOccurrences(of: "€", with: "")
                        .replacingOccurrences(of: "EUR", with: "")
                        .replacingOccurrences(of: ",", with: ".")
                        .trimmingCharacters(in: .whitespaces)
                    
                    return Decimal(string: priceString)
                }
            }
        } catch {
            logger.error("Fehler beim Parsen des Preises: \(error)")
        }
        
        return nil
    }
    
    private func extractShop(from text: String) -> String? {
        let lines = text.components(separatedBy: .newlines)
        
        // Häufige Supermarkt-/Shop-Namen
        let knownShops = ["REWE", "EDEKA", "ALDI", "LIDL", "PENNY", "NETTO", "KAUFLAND", "REAL", "METRO"]
        
        for line in lines {
            for shop in knownShops {
                if line.uppercased().contains(shop) {
                    return shop
                }
            }
        }
        
        // Falls kein bekannter Shop gefunden, nimm die erste Zeile als Shop-Name
        return lines.first?.trimmingCharacters(in: .whitespaces)
    }
}