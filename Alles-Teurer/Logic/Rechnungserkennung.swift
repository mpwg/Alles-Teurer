//
//  Rechnungserkennung.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 27.09.25.
//

import Foundation
import SwiftUI
import Vision
import VisionKit
import CoreImage
import OSLog

private let logger = Logger(subsystem: "at.allesteurer", category: "Rechnungserkennung")

/// Service for receipt recognition using Apple Intelligence and Vision frameworks
@available(iOS 26.0, *)
@MainActor
public struct Rechnungserkennung {
    
    /// Configuration for receipt recognition
    public struct Configuration {
        let useCloudFallback: Bool
        let preferredLanguages: [String]
        let confidenceThreshold: Double
        
        public init(
            useCloudFallback: Bool = true,
            preferredLanguages: [String] = ["de-AT", "de-DE"],
            confidenceThreshold: Double = 0.7
        ) {
            self.useCloudFallback = useCloudFallback
            self.preferredLanguages = preferredLanguages
            self.confidenceThreshold = confidenceThreshold
        }
    }
    
    private let configuration: Configuration
    private let imageAnalyzer: ImageAnalyzer
    
    public init(configuration: Configuration = Configuration()) {
        self.configuration = configuration
        self.imageAnalyzer = ImageAnalyzer()
    }
    
    /// Recognizes receipt line items from an image using Apple Intelligence
    /// - Parameter image: SwiftUI Image containing the receipt
    /// - Returns: Array of recognized receipt line items
    /// - Throws: RecognitionError if processing fails
     func erkenneRechnung(image: Image) async throws -> [Rechnungszeile] {
        logger.info("Starting receipt recognition")
        
        // Convert SwiftUI Image to UIImage
        guard let uiImage = await extractUIImage(from: image) else {
            logger.error("Failed to extract UIImage from SwiftUI Image")
            throw RecognitionError.imageConversionFailed
        }
        
        // Try on-device processing first
        do {
            let result = try await processOnDevice(uiImage)
            logger.info("Successfully processed receipt on-device with \(result.count) items")
            return result
        } catch {
            logger.warning("On-device processing failed: \(error.localizedDescription)")
            
            if configuration.useCloudFallback {
                logger.info("Attempting cloud fallback")
                return try await processWithCloudFallback(uiImage)
            } else {
                throw error
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func processOnDevice(_ image: UIImage) async throws -> [Rechnungszeile] {
        // Step 1: Perform OCR using Vision framework
        let textObservations = try await performOCR(on: image)
        
        // Step 2: Analyze with Visual Intelligence for semantic understanding
        let analysis = try await analyzeWithVisualIntelligence(image, textObservations: textObservations)
        
        // Step 3: Extract receipt line items using Apple Intelligence
        return try await extractReceiptItems(from: analysis)
    }
    
    private func performOCR(on image: UIImage) async throws -> [VNRecognizedTextObservation] {
        guard let cgImage = image.cgImage else {
            throw RecognitionError.imageProcessingFailed
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            let request = VNRecognizeTextRequest { request, error in
                if let error = error {
                    continuation.resume(throwing: RecognitionError.ocrFailed(error))
                    return
                }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else {
                    continuation.resume(throwing: RecognitionError.noTextFound)
                    return
                }
                
                continuation.resume(returning: observations)
            }
            
            request.recognitionLevel = .accurate
            request.recognitionLanguages = configuration.preferredLanguages
            request.usesLanguageCorrection = true
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            do {
                try handler.perform([request])
            } catch {
                continuation.resume(throwing: RecognitionError.ocrFailed(error))
            }
        }
    }
    
    private func analyzeWithVisualIntelligence(_ image: UIImage, textObservations: [VNRecognizedTextObservation]) async throws -> ReceiptAnalysis {
        // Create semantic content descriptor for Visual Intelligence
        let descriptor = SemanticContentDescriptor(
            labels: ["receipt", "rechnung", "kassenbon", "quittung"],
            pixelBuffer: try createPixelBuffer(from: image)
        )
        
        // Create analysis configuration
        var analysisConfig = ImageAnalyzer.Configuration([.text, .machineReadableCode])
        
        // Perform image analysis
        let imageAnalysis = try await imageAnalyzer.analyze(image, configuration: analysisConfig)
        
        // Combine OCR results with Visual Intelligence analysis
        return ReceiptAnalysis(
            textObservations: textObservations,
            imageAnalysis: imageAnalysis,
            semanticDescriptor: descriptor
        )
    }
    
    private func extractReceiptItems(from analysis: ReceiptAnalysis) async throws -> [Rechnungszeile] {
        var items: [Rechnungszeile] = []
        
        // Extract text lines with confidence scores
        let textLines = analysis.textObservations.compactMap { observation -> (String, Double)? in
            guard let candidate = observation.topCandidates(1).first else { return nil }
            return (candidate.string, Double(candidate.confidence))
        }
        
        // Use pattern matching and semantic analysis to identify receipt items
        for (index, (line, confidence)) in textLines.enumerated() {
            // Skip low confidence lines
            guard confidence >= configuration.confidenceThreshold else { continue }
            
            // Analyze line for receipt item patterns
            if let item = try await analyzeLineAsReceiptItem(
                line: line,
                context: textLines,
                currentIndex: index,
                analysis: analysis
            ) {
                items.append(item)
            }
        }
        
        // Post-process to ensure data consistency
        items = postProcessItems(items)
        
        return items
    }
    
    private func analyzeLineAsReceiptItem(
        line: String,
        context: [(String, Double)],
        currentIndex: Int,
        analysis: ReceiptAnalysis
    ) async throws -> Rechnungszeile? {
        // Use semantic analysis to determine if line represents a product
        let semanticAnalysis = try await performSemanticAnalysis(
            line: line,
            context: context,
            analysis: analysis
        )
        
        guard semanticAnalysis.isProductLine else { return nil }
        
        // Extract product details
        let name = semanticAnalysis.productName ?? line
        let price = semanticAnalysis.price ?? 0
        let category = semanticAnalysis.category ?? "Sonstiges"
        
        // Extract shop and date from receipt metadata
        let metadata = try extractReceiptMetadata(from: analysis)
        
        return Rechnungszeile(
            Name: name,
            Price: Decimal(price),
            Category: category,
            Shop: metadata.shop,
            Datum: metadata.date
        )
    }
    
    private func performSemanticAnalysis(
        line: String,
        context: [(String, Double)],
        analysis: ReceiptAnalysis
    ) async throws -> SemanticLineAnalysis {
        // This would use Apple Intelligence APIs when available
        // For now, using pattern-based analysis as fallback
        
        let pricePattern = try NSRegularExpression(
            pattern: #"(\d+[,.]?\d*)\s*€?"#,
            options: []
        )
        
        let matches = pricePattern.matches(
            in: line,
            options: [],
            range: NSRange(location: 0, length: line.utf16.count)
        )
        
        var price: Double?
        if let match = matches.last,
           let range = Range(match.range(at: 1), in: line) {
            let priceString = String(line[range]).replacingOccurrences(of: ",", with: ".")
            price = Double(priceString)
        }
        
        // Determine if this is likely a product line
        let isProductLine = price != nil && !line.lowercased().contains("summe") &&
                           !line.lowercased().contains("total") &&
                           !line.lowercased().contains("gegeben") &&
                           !line.lowercased().contains("mwst")
        
        // Extract product name (everything before the price)
        var productName = line
        if let priceMatch = matches.last,
           let range = Range(priceMatch.range, in: line) {
            productName = String(line[..<range.lowerBound]).trimmingCharacters(in: .whitespaces)
        }
        
        return SemanticLineAnalysis(
            isProductLine: isProductLine,
            productName: productName.isEmpty ? nil : productName,
            price: price,
            category: categorizeProduct(productName)
        )
    }
    
    private func categorizeProduct(_ name: String) -> String {
        let nameLower = name.lowercased()
        
        // Common Austrian/German product categories
        if nameLower.contains("bio") || nameLower.contains("obst") || nameLower.contains("gemüse") {
            return "Obst & Gemüse"
        } else if nameLower.contains("milch") || nameLower.contains("käse") || nameLower.contains("jogh") {
            return "Milchprodukte"
        } else if nameLower.contains("fleisch") || nameLower.contains("wurst") {
            return "Fleisch & Wurst"
        } else if nameLower.contains("brot") || nameLower.contains("semmel") || nameLower.contains("gebäck") {
            return "Backwaren"
        } else if nameLower.contains("getränk") || nameLower.contains("wasser") || nameLower.contains("saft") {
            return "Getränke"
        } else {
            return "Sonstiges"
        }
    }
    
    private func extractReceiptMetadata(from analysis: ReceiptAnalysis) throws -> ReceiptMetadata {
        // Extract shop name from first few lines
        let shopName = analysis.textObservations
            .prefix(3)
            .compactMap { $0.topCandidates(1).first?.string }
            .first { !$0.isEmpty && $0.count > 2 } ?? "Unbekannter Shop"
        
        // Extract date
        let datePattern = try NSRegularExpression(
            pattern: #"(\d{1,2})[./](\d{1,2})[./](\d{2,4})"#,
            options: []
        )
        
        var receiptDate = Date.now
        
        for observation in analysis.textObservations {
            guard let text = observation.topCandidates(1).first?.string else { continue }
            
            if let match = datePattern.firstMatch(
                in: text,
                options: [],
                range: NSRange(location: 0, length: text.utf16.count)
            ) {
                if let dayRange = Range(match.range(at: 1), in: text),
                   let monthRange = Range(match.range(at: 2), in: text),
                   let yearRange = Range(match.range(at: 3), in: text) {
                    
                    let day = Int(text[dayRange]) ?? 1
                    let month = Int(text[monthRange]) ?? 1
                    var year = Int(text[yearRange]) ?? 2025
                    
                    // Handle 2-digit years
                    if year < 100 {
                        year += 2000
                    }
                    
                    var components = DateComponents()
                    components.day = day
                    components.month = month
                    components.year = year
                    
                    if let date = Calendar.current.date(from: components) {
                        receiptDate = date
                        break
                    }
                }
            }
        }
        
        return ReceiptMetadata(shop: shopName, date: receiptDate)
    }
    
    private func postProcessItems(_ items: [Rechnungszeile]) -> [Rechnungszeile] {
        // Remove duplicates and clean up data
        var processedItems: [Rechnungszeile] = []
        var seenNames = Set<String>()
        
        for item in items {
            let normalizedName = item.Name.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Skip empty or duplicate items
            guard !normalizedName.isEmpty,
                  !seenNames.contains(normalizedName) else { continue }
            
            seenNames.insert(normalizedName)
            processedItems.append(item)
        }
        
        return processedItems
    }
    
    private func processWithCloudFallback(_ image: UIImage) async throws -> [Rechnungszeile] {
        // This would use cloud-based Visual Intelligence APIs when available
        // For now, throwing an error as cloud processing is not yet implemented
        throw RecognitionError.cloudProcessingUnavailable
    }
    
    private func extractUIImage(from image: Image) async -> UIImage? {
        // Convert SwiftUI Image to UIImage
        // This is a simplified approach - in production, you'd need proper conversion
        return UIImage(named: "sample_receipt") // Placeholder
    }
    
    private func createPixelBuffer(from image: UIImage) throws -> CVPixelBuffer {
        guard let cgImage = image.cgImage else {
            throw RecognitionError.imageProcessingFailed
        }
        
        let width = cgImage.width
        let height = cgImage.height
        
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(
            kCFAllocatorDefault,
            width,
            height,
            kCVPixelFormatType_32BGRA,
            nil,
            &pixelBuffer
        )
        
        guard status == kCVReturnSuccess,
              let buffer = pixelBuffer else {
            throw RecognitionError.pixelBufferCreationFailed
        }
        
        CVPixelBufferLockBaseAddress(buffer, [])
        defer { CVPixelBufferUnlockBaseAddress(buffer, []) }
        
        guard let context = CGContext(
            data: CVPixelBufferGetBaseAddress(buffer),
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue
        ) else {
            throw RecognitionError.pixelBufferCreationFailed
        }
        
        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        return buffer
    }
}

// MARK: - Supporting Types

@available(iOS 26.0, *)
private struct ReceiptAnalysis {
    let textObservations: [VNRecognizedTextObservation]
    let imageAnalysis: ImageAnalysis
    let semanticDescriptor: SemanticContentDescriptor
}

@available(iOS 26.0, *)
private struct SemanticLineAnalysis {
    let isProductLine: Bool
    let productName: String?
    let price: Double?
    let category: String?
}

@available(iOS 26.0, *)
private struct ReceiptMetadata {
    let shop: String
    let date: Date
}

// MARK: - Errors

@available(iOS 26.0, *)
public enum RecognitionError: LocalizedError {
    case imageConversionFailed
    case imageProcessingFailed
    case pixelBufferCreationFailed
    case ocrFailed(Error)
    case noTextFound
    case analysisConfigurationFailed
    case semanticAnalysisFailed
    case cloudProcessingUnavailable
    
    public var errorDescription: String? {
        switch self {
        case .imageConversionFailed:
            return "Konnte Bild nicht konvertieren"
        case .imageProcessingFailed:
            return "Bildverarbeitung fehlgeschlagen"
        case .pixelBufferCreationFailed:
            return "Pixel Buffer Erstellung fehlgeschlagen"
        case .ocrFailed(let error):
            return "Texterkennung fehlgeschlagen: \(error.localizedDescription)"
        case .noTextFound:
            return "Kein Text im Bild gefunden"
        case .analysisConfigurationFailed:
            return "Analyse-Konfiguration fehlgeschlagen"
        case .semanticAnalysisFailed:
            return "Semantische Analyse fehlgeschlagen"
        case .cloudProcessingUnavailable:
            return "Cloud-Verarbeitung nicht verfügbar"
        }
    }
}
