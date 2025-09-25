# AllesTeurer - Technical Architecture

## Platform Requirements

- **iOS 26.0+** minimum deployment target
- **Xcode 26** with Swift 6 strict concurrency
- **Vision Framework 5.0** with Visual Intelligence APIs
- **SwiftData 2.0** for persistence
- **Swift Charts 2.0** for visualization

## Core Architecture with iOS 26 Visual Intelligence

### 1. Visual Intelligence Layer (iOS 26)

```swift
import Vision
import VisionKit

@available(iOS 26.0, *)
@MainActor
@Observable
final class VisualIntelligenceService {
    private let documentAnalyzer: VNDocumentAnalyzer
    private let receiptProcessor: ReceiptProcessor

    var processingState: ProcessingState = .idle
    var confidence: Double = 0.0

    init() {
        self.documentAnalyzer = VNDocumentAnalyzer()
        self.receiptProcessor = ReceiptProcessor()
        configureVisualIntelligence()
    }

    private func configureVisualIntelligence() {
        // iOS 26 Visual Intelligence configuration
        let config = VNVisualIntelligenceConfiguration()
        config.documentType = .receipt
        config.languages = ["de-DE", "en-US"]
        config.enableAdaptiveLearning = true
        config.privacyMode = .onDevice
        config.useNeuralEngine = true // A18 Pro optimization
    }

    // MANDATORY: Always use async/await - NEVER completion handlers
    func processReceipt(from image: UIImage) async throws -> UniversalReceipt {
        processingState = .analyzing

        let request = VNAnalyzeReceiptRequest()
        request.preferBackgroundProcessing = true
        request.usesCPUOnly = false

        let handler = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
        try await handler.perform([request])

        guard let observations = request.results else {
            throw VisualIntelligenceError.noReceiptDetected
        }

        return try await receiptProcessor.process(observations)
    }
}

// Swift 6 Actor for thread-safe processing
@available(iOS 26.0, *)
actor ReceiptProcessor {
    func process(_ observations: [VNReceiptObservation]) async throws -> UniversalReceipt {
        // Process with iOS 26 Visual Intelligence
    }
}
```

### 2. SwiftData 2.0 Models with Actor Isolation

```swift
import SwiftData
import Foundation

@available(iOS 26.0, *)
@Model
final class UniversalReceipt: Sendable {
    @Attribute(.unique) let id: UUID
    var rawText: String
    var processedData: ProcessedReceiptData
    var confidence: Double
    var processingDate: Date

    @Relationship(deleteRule: .cascade)
    var items: [UniversalItem]

    @Relationship(inverse: \Store.receipts)
    var store: Store?

    var metadata: ReceiptMetadata

    init(rawText: String, confidence: Double) {
        self.id = UUID()
        self.rawText = rawText
        self.confidence = confidence
        self.processingDate = .now
        self.items = []
        self.processedData = ProcessedReceiptData()
        self.metadata = ReceiptMetadata()
    }
}

// MANDATORY: Use @ModelActor for all data operations
@available(iOS 26.0, *)
@ModelActor
actor DataManager {
    // NEVER access ModelContext directly from ViewModels
    func saveReceipt(_ receipt: UniversalReceipt) async throws {
        modelContext.insert(receipt)
        try modelContext.save()
    }

    func fetchReceipts() async throws -> [UniversalReceipt] {
        let descriptor = FetchDescriptor<UniversalReceipt>(
            sortBy: [SortDescriptor(\.processingDate, order: .reverse)]
        )
        return try modelContext.fetch(descriptor)
    }
}
```

### 3. Observable ViewModels with Async/Await

```swift
import SwiftUI

@available(iOS 26.0, *)
@MainActor
@Observable  // MANDATORY: Use @Observable, NEVER ObservableObject
final class ReceiptScannerViewModel {
    private let visualIntelligence: VisualIntelligenceService
    private let dataManager: DataManager

    var scanState: ScanState = .idle
    var receipts: [UniversalReceipt] = []
    var currentReceipt: UniversalReceipt?

    init(visualIntelligence: VisualIntelligenceService, dataManager: DataManager) {
        self.visualIntelligence = visualIntelligence
        self.dataManager = dataManager
    }

    // MANDATORY: Always async/await, NEVER completion handlers
    func processReceipt(from imageData: Data) async {
        scanState = .processing

        do {
            guard let image = UIImage(data: imageData) else {
                throw ScanError.invalidImage
            }

            let receipt = try await visualIntelligence.processReceipt(from: image)
            try await dataManager.saveReceipt(receipt)
            self.currentReceipt = receipt
            await loadReceipts()
            scanState = .success(receipt)
        } catch {
            scanState = .error(error.localizedDescription)
        }
    }

    private func loadReceipts() async {
        do {
            receipts = try await dataManager.fetchReceipts()
        } catch {
            print("Failed to load receipts: \(error)")
        }
    }
}
```
