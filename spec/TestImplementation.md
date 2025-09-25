# AllesTeurer - Test Implementation Strategy

## Swift Testing Framework (iOS 26)

### Visual Intelligence Tests

```swift
import Testing
import SwiftData
@testable import AllesTeurer

@Suite("Visual Intelligence Tests")
@available(iOS 26.0, *)
struct VisualIntelligenceTests {
    let service = VisualIntelligenceService()

    @Test("Receipt detection with iOS 26 Visual Intelligence")
    func testReceiptDetection() async throws {
        let image = TestData.germanReceiptImage

        let receipt = try await service.processReceipt(from: image)

        #expect(receipt.confidence > 0.95)
        #expect(receipt.store?.name == "REWE")
        #expect(receipt.items.count == 12)
    }

    @Test("Low confidence handling")
    func testLowConfidenceDetection() async throws {
        let image = TestData.blurryReceiptImage

        let receipt = try await service.processReceipt(from: image)

        #expect(receipt.confidence < 0.85)
        #expect(receipt.metadata.requiresReview == true)
    }
}

@Suite("SwiftData Actor Tests")
@available(iOS 26.0, *)
struct DataManagerTests {
    @Test("Thread-safe receipt saving")
    func testConcurrentSaving() async throws {
        let dataManager = DataManager(modelContainer: .inMemory)

        await withTaskGroup(of: Void.self) { group in
            for i in 0..<10 {
                group.addTask {
                    let receipt = UniversalReceipt(
                        rawText: "Test \(i)",
                        confidence: 0.95
                    )
                    try? await dataManager.saveReceipt(receipt)
                }
            }
        }

        let receipts = try await dataManager.fetchReceipts()
        #expect(receipts.count == 10)
    }
}

@Suite("ViewModel Async Tests")
@available(iOS 26.0, *)
@MainActor
struct ViewModelTests {
    @Test("Async receipt processing")
    func testAsyncProcessing() async throws {
        let viewModel = ReceiptScannerViewModel(
            visualIntelligence: MockVisualIntelligence(),
            dataManager: MockDataManager()
        )

        await viewModel.processReceipt(from: TestData.receiptImageData)

        #expect(viewModel.scanState == .success)
        #expect(viewModel.currentReceipt != nil)
    }
}
```

### Performance Tests

```swift
@Suite("Performance Tests")
@available(iOS 26.0, *)
struct PerformanceTests {
    @Test("Receipt processing under 1.5 seconds")
    func testProcessingSpeed() async throws {
        let service = VisualIntelligenceService()
        let image = TestData.standardReceiptImage

        let startTime = ContinuousClock.now
        _ = try await service.processReceipt(from: image)
        let duration = ContinuousClock.now - startTime

        #expect(duration < .seconds(1.5))
    }

    @Test("Memory usage under 40MB")
    func testMemoryUsage() async throws {
        let initialMemory = getMemoryUsage()

        let service = VisualIntelligenceService()
        _ = try await service.processReceipt(from: TestData.largeReceiptImage)

        let peakMemory = getMemoryUsage()
        let usage = peakMemory - initialMemory

        #expect(usage < 40_000_000) // 40MB in bytes
    }
}
```
