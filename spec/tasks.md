# AllesTeurer - iOS 26 Implementation Tasks

## Implementation Status: iOS-Native with Swift 6

**Generated**: 2025-09-22  
**Updated**: 2025-09-25  
**Platform**: iOS 26.0+ (iPhone, iPad, Mac Catalyst)
**Language**: Swift 6 with strict concurrency

## Swift 6 & iOS 26 Native Architecture

This project leverages cutting-edge iOS 26 features:

- **Swift 6** with complete data isolation and strict concurrency
- **SwiftUI 6.0** with enhanced Observable macro and new view modifiers
- **SwiftData 2.0** with improved performance and migrations
- **Vision Framework 4.0** with enhanced multilingual OCR
- **Swift Charts 2.0** with interactive 3D visualizations
- **iOS 26.0+** minimum deployment for latest features

## Phase 1: Core Foundation (iOS 26)

### Task 1.1: Project Setup with Swift 6 ✅ COMPLETED (BASELINE)

**Priority**: CRITICAL | **Effort**: 1 day | **Dependencies**: None

**Objective**: Configure native iOS project with Swift 6 strict concurrency and iOS 26 features.

**Acceptance Criteria (Baseline)**:

- [x] Xcode project builds for iPhone, iPad, and Mac Catalyst
- [x] SwiftData 2.0 ModelContainer configured and used in app
- [x] Privacy manifest present; Info.plist usage strings present
- [x] Fastlane lanes run tests successfully on Mac Catalyst

Status notes:

- ModelContainer is wired in `Alles_TeurerApp.swift`. The app builds for Catalyst and tests pass via Fastlane.
- PrivacyInfo.xcprivacy added; camera/photo usage strings present in Info.plist.
- Further verification of explicit Swift 6 language mode flag and App Groups enablement is planned for Phase 1 hardening follow-up.

**Implementation Details**:

1. **Project Configuration**:

   ```swift
   // Swift 6 strict concurrency in Package.swift
   swiftLanguageVersions: [.version("6")]
   ```

2. **Platform Support**:

   - iPhone: Dynamic Type and compact layouts
   - iPad: Multi-window, Stage Manager, Apple Pencil support
   - Mac Catalyst: Menu bar, keyboard shortcuts, drag & drop

3. **Capabilities**:
   - Camera access for receipt scanning
   - App Groups for widget data sharing
   - CloudKit for optional sync
   - Siri and Shortcuts

### Task 1.2: SwiftData 2.0 Models with Actors ✅ COMPLETED (BASELINE)

**Priority**: CRITICAL | **Effort**: 2 days | **Dependencies**: Task 1.1

**Objective**: Define SwiftData models with Swift 6 actor isolation for thread-safe data access.

**Acceptance Criteria (Baseline)**:

- [x] All models use `@Model` with proper relationships
- [x] Actor isolation for data access with `@ModelActor`
- [ ] Migration support for future schema changes (deferred)
- [ ] Efficient indexing and full-text search (deferred pending toolchain support)

**Implementation Details**:

```swift
import SwiftData
import Foundation

@Model
@available(iOS 26.0, *)
final class Receipt {
    @Attribute(.unique) let id: UUID
    var storeName: String
    var storeLocation: String?
    var scanDate: Date
    var totalAmount: Decimal

    @Relationship(deleteRule: .cascade)
    var items: [ReceiptItem]

    @Relationship(inverse: \Store.receipts)
    var store: Store?

    var ocrConfidence: Double
    var rawOCRText: String?
    var imageData: Data?

    init(storeName: String, scanDate: Date = .now, totalAmount: Decimal) {
        self.id = UUID()
        self.storeName = storeName
        self.scanDate = scanDate
        self.totalAmount = totalAmount
        self.items = []
        self.ocrConfidence = 0.0
    }
}

@Model
@available(iOS 26.0, *)
final class Product {
    @Attribute(.unique) let id: UUID
    var name: String
    var category: ProductCategory
    var brand: String?
    var barcode: String?

    @Relationship(deleteRule: .cascade)
    var priceHistory: [PriceRecord]

    var lastUpdated: Date

    init(name: String, category: ProductCategory) {
        self.id = UUID()
        self.name = name
        self.category = category
        self.priceHistory = []
        self.lastUpdated = .now
    }
}

// Actor for thread-safe data operations
@ModelActor
@available(iOS 26.0, *)
actor DataManager {
    func processReceipt(_ receipt: Receipt) async throws {
        // Thread-safe receipt processing with Swift 6 isolation
    }

    func calculateInflation(for product: Product) async -> Double {
        // Isolated calculation with automatic actor context
    }
}
```

Status notes:

- Domain models implemented (`Rechnung`, `RechnungsArtikel`, `Produkt`, `PreisEintrag`, `Geschaeft`).
- `DataManager` actor provides save/fetch/delete and analytics stub. Concurrency upheld via actor isolation and identifiers across boundaries.
- Indexing and search are deferred due to current toolchain limitations.

### Task 1.3: Vision Framework 4.0 OCR Service ✅ COMPLETED (BASELINE)

**Priority**: CRITICAL | **Effort**: 3 days | **Dependencies**: Task 1.2

**Objective**: Implement Vision Framework 4.0 with iOS 26's enhanced German text recognition.

**Acceptance Criteria (Baseline)**:

- [x] Observable OCR service with async/await only
- [x] Vision text recognition helper (availability-guarded)
- [x] Parser actor for German/Austrian receipts (value DTOs)
- [x] Tests passing via Fastlane; placeholder fallback ensures deterministic output on non-iOS targets

**Implementation Details**:

```swift
import Vision
import VisionKit
import SwiftUI

@available(iOS 26.0, *)
@Observable
@MainActor
final class OCRService {
    var scanState: ScanState = .idle
    var recognizedReceipt: Receipt?

    private let textRecognizer = VNRecognizeTextRequest()

    init() {
        configureTextRecognizer()
    }

    private func configureTextRecognizer() {
        textRecognizer.recognitionLevel = .accurate
        textRecognizer.recognitionLanguages = ["de-DE", "en-US"]
        textRecognizer.usesLanguageCorrection = true
        textRecognizer.customWords = germanRetailerVocabulary
    }

    func processImage(_ image: UIImage) async throws -> Receipt {
        // Use iOS 26's enhanced Vision processing
        guard let cgImage = image.cgImage else {
            throw OCRError.invalidImage
        }

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])

        return try await withCheckedThrowingContinuation { continuation in
            textRecognizer.completionHandler = { request, error in
                // Process with German receipt patterns
                // Extract store, items, prices, total
            }

            Task {
                try handler.perform([textRecognizer])
            }
        }
    }
}

// iOS 26 Document Scanner with Live Text
struct DocumentScannerView: UIViewControllerRepresentable {
    @Binding var scannedReceipt: Receipt?

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = context.coordinator
        return scanner
    }

    // Implementation continues...
}
```

Status notes:

- `OCRService` produces `RecognizedReceipt` DTOs. When Vision/UIKit available, it recognizes lines and parses with `ReceiptParser`; otherwise it returns a deterministic placeholder.
- `DocumentScannerView` scaffold added behind iOS-only guards. Visual Intelligence deep integration and live feedback are slated for Phase 2+.

---

## Phase 1 – Work Completed (Baseline)

- Domain models with SwiftData 2.0 created: `Rechnung`, `RechnungsArtikel`, `Produkt`, `PreisEintrag`, `Geschaeft`.
- Repository (`DataManager` @ModelActor) implemented: save, fetch (sorted), delete by `PersistentIdentifier`, inflation calculation stub, safe scalar helpers.
- Basic SwiftUI integration in `ContentView`: list, detail, add test data, delete via repository.
- Async `OCRService` using @Observable and @MainActor emitting DTOs.
- Parser actor (`ReceiptParser`) for de_AT numbers and basic heuristics.
- Scan Demo UI path: wired in `ContentView` with a toolbar button that triggers OCR → DTO mapping → save via `ScannerViewModel` → confirmation alert.
- UI smoke test added: `Alles-TeurerUITests/ScannerSmokeTests.swift` taps Scan Demo and verifies the confirmation (robust on Mac Catalyst with alert/sheet checks). Class marked `@MainActor`.
- Tests: Unit + UI tests run green via Fastlane on Mac Catalyst.

Fastlane summary (latest):

- Tests: 9
- Failures: 0
- Platform: Mac Catalyst (fastest)

## Phase 1 – Next Steps

1. Verify Xcode project flags for explicit Swift 6 language mode and iOS 26 min target at the project level.
2. Enable App Groups for production and wire shared container if needed.
3. Deepen Visual Intelligence integration (live feedback, better field extraction, confidence scoring) and expand tests with real receipt samples.
4. Add SwiftData indexing/full-text search once supported; document migration.
5. Expand test coverage (repositories, predicates, UI smoke, a11y checks).

## Phase 2: User Interface (iOS 26 SwiftUI)

### Task 2.1: SwiftUI 6.0 Main Interface ⏳ READY

**Priority**: HIGH | **Effort**: 3 days | **Dependencies**: Phase 1

**Objective**: Build responsive SwiftUI interface optimized for iOS 26 features.

**Acceptance Criteria**:

- [ ] Adaptive layouts for iPhone, iPad, and Mac Catalyst
- [ ] iOS 26 navigation with `NavigationStack` and `NavigationSplitView`
- [ ] Live Activities for price tracking
- [ ] Interactive widgets with Swift Charts
- [ ] Control Center controls for quick scanning
- [ ] Focus filters for shopping mode

**Implementation Details**:

```swift
import SwiftUI
import SwiftData

@main
@available(iOS 26.0, *)
struct AllesTeurerApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Receipt.self, Product.self, Store.self])
                .environment(appModel)
        }
        .commands {
            // Mac Catalyst menu commands
            CommandGroup(replacing: .newItem) {
                Button("Scan Receipt") {
                    appModel.startScanning()
                }
                .keyboardShortcut("r", modifiers: .command)
            }
        }

        #if os(iOS)
        // iOS 26 Control Center Scene
        ControlCenterScene {
            QuickScanControl()
        }
        #endif
    }
}

// Main navigation with iOS 26 features
struct ContentView: View {
    @Environment(AppModel.self) private var appModel
    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        if sizeClass == .regular {
            // iPad/Mac layout
            NavigationSplitView {
                Sidebar()
            } content: {
                ProductList()
            } detail: {
                DetailView()
            }
        } else {
            // iPhone layout
            NavigationStack {
                TabView {
                    ScannerTab()
                        .tabItem {
                            Label("Scan", systemImage: "camera.viewfinder")
                        }

                    ProductsTab()
                        .tabItem {
                            Label("Products", systemImage: "cart")
                        }

                    AnalyticsTab()
                        .tabItem {
                            Label("Analytics", systemImage: "chart.line.uptrend.xyaxis")
                        }
                }
            }
        }
    }
}
```

### Task 2.2: Swift Charts 2.0 Analytics ⏳ READY

**Priority**: HIGH | **Effort**: 2 days | **Dependencies**: Task 2.1

**Objective**: Implement interactive price analytics with Swift Charts 2.0 3D visualizations.

**Acceptance Criteria**:

- [ ] 3D price trend visualizations
- [ ] Interactive chart annotations
- [ ] Gesture-based navigation
- [ ] Comparative analysis views
- [ ] Export to PDF/Image
- [ ] VoiceOver accessibility

**Implementation Details**:

```swift
import Charts
import SwiftUI

@available(iOS 26.0, *)
struct PriceAnalyticsView: View {
    @Query private var products: [Product]
    @State private var selectedTimeRange = TimeRange.month
    @State private var visualizationType = VisualizationType.line3D

    var body: some View {
        Chart {
            ForEach(products) { product in
                ForEach(product.priceHistory) { record in
                    // iOS 26 3D Chart capabilities
                    Plot3D(
                        x: .value("Date", record.date),
                        y: .value("Price", record.price),
                        z: .value("Store", record.store.name)
                    )
                    .foregroundStyle(by: .value("Product", product.name))
                    .symbol(by: .value("Category", product.category))
                }
            }
        }
        .chart3DStyle(.realistic) // iOS 26 3D styling
        .chartInteraction(.all) // Full gesture support
        .chartAccessibilityDescription { product, price in
            "\(product.name) cost \(price.formatted(.currency(code: "EUR"))) on \(price.date.formatted())"
        }
    }
}
```

## Phase 3: Platform Integration

### Task 3.1: Widgets & Live Activities ⏳ READY

**Priority**: MEDIUM | **Effort**: 2 days | **Dependencies**: Phase 2

**Objective**: Implement iOS 26 widgets and Live Activities for price tracking.

**Implementation Details**:

```swift
import WidgetKit
import ActivityKit

@available(iOS 26.0, *)
struct PriceTrackerWidget: Widget {
    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: "PriceTracker",
            provider: PriceProvider()
        ) { entry in
            PriceWidgetView(entry: entry)
        }
        .configurationDisplayName("Price Tracker")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge, .systemExtraLarge])
        .contentMarginsDisabled() // iOS 26 full-bleed widgets
    }
}

// Live Activity for active shopping
struct ShoppingActivityAttributes: ActivityAttributes {
    struct ContentState: Codable, Hashable {
        var itemsScanned: Int
        var totalSpent: Decimal
        var savings: Decimal
    }

    var storeName: String
}
```

### Task 3.2: Mac Catalyst Optimizations ⏳ READY

**Priority**: MEDIUM | **Effort**: 2 days | **Dependencies**: Phase 2

**Objective**: Optimize for Mac Catalyst with native Mac features.

**Acceptance Criteria**:

- [ ] Native Mac menu bar
- [ ] Keyboard shortcuts
- [ ] Drag & drop receipt import
- [ ] Multi-window support
- [ ] Touch Bar support (for compatible Macs)
- [ ] macOS Sonoma+ features

## Phase 4: Testing & Quality

### Task 4.1: Swift Testing Framework ⏳ READY

**Priority**: HIGH | **Effort**: 3 days | **Dependencies**: Phase 3

**Objective**: Comprehensive testing with Swift Testing framework.

```swift
import Testing
import SwiftData

@Suite("Receipt Processing")
@available(iOS 26.0, *)
struct ReceiptTests {
    @Test("German receipt parsing accuracy")
    func parseGermanReceipt() async throws {
        let ocrService = OCRService()
        let testImage = TestData.germanReceiptImage

        let receipt = try await ocrService.processImage(testImage)

        #expect(receipt.storeName == "REWE")
        #expect(receipt.items.count == 12)
        #expect(receipt.totalAmount == 47.83)
    }

    @Test("Price inflation calculation", arguments: [
        (old: 1.99, new: 2.49, expected: 25.13),
        (old: 3.50, new: 3.50, expected: 0.0)
    ])
    func calculateInflation(old: Decimal, new: Decimal, expected: Double) {
        let inflation = PriceAnalyzer.calculateInflation(from: old, to: new)
        #expect(inflation.isApproximatelyEqual(to: expected, tolerance: 0.01))
    }
}
```

## Success Metrics

- **Performance**: Receipt processing < 2 seconds on iPhone 15
- **Accuracy**: 95%+ OCR accuracy on German receipts
- **Memory**: < 100MB for typical usage
- **Battery**: < 5% drain for 30 minutes of scanning
- **Accessibility**: 100% VoiceOver compatible
