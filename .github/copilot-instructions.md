# AllesTeurer - AI Agent Instructions

## Project Overview

AllesTeurer is a privacy-first native iOS app that tracks product price inflation through receipt scanning and local analytics. The app uses SwiftUI 6.0 for the user interface, SwiftData 2.0 for persistence, Apple's Visual Intelligence framework for universal receipt recognition, and Swift Charts 2.0 for interactive data visualization, maintaining strict on-device processing.

**Architecture**: iOS-first development using SwiftUI, SwiftData, and native iOS frameworks.

## iOS Project Structure

```
AllesTeurer/
├── Alles Teurer/            # Native iOS App
│   ├── Alles_TeurerApp.swift       # App Entry Point with SwiftData ModelContainer
│   ├── ContentView.swift           # Main SwiftUI View
│   ├── Item.swift                  # SwiftData Models
│   ├── Info.plist                  # App Configuration
│   ├── Alles_Teurer.entitlements  # App Capabilities
│   └── Assets.xcassets/            # App Assets and Icons
├── Alles Teurer.xcodeproj/  # Xcode Project Configuration
├── Alles TeurerTests/       # Unit Tests using Swift Testing
├── Alles TeurerUITests/     # UI Tests using XCUITest
├── spec/                    # Requirements and architecture docs
├── docs/                    # Additional documentation
├── README.md               # Project overview
└── .github/                # GitHub configuration and instructions
    ├── copilot-instructions.md     # AI agent development guidelines
    └── instructions/               # Specific coding guidelines
        ├── swift.instructions.md           # Swift coding conventions
        ├── swiftui-observation.instructions.md  # SwiftUI Observable patterns
        └── a11y.instructions.md           # Accessibility requirements
```

## Architecture & Key Patterns

### Native iOS 26 Strategy

- **macOS 26, iOS 26, Xcode 26, Swift 6.2, and all relevant SDKs/packages are available and pre-installed on GitHub Actions runners.**
- **Never downgrade or target older versions unless explicitly required by the project.**
- **SwiftUI 6.0**: Enhanced declarative UI with iOS 26 features
- **SwiftData 2.0**: Advanced type-safe persistence with performance improvements
- **Visual Intelligence**: Apple's universal document recognition framework
- **Vision Framework 5.0**: Enhanced on-device OCR with Visual Intelligence APIs
- **Swift Charts 2.0**: Interactive 3D data visualization with gesture support
- **Swift 6.2**: Strict concurrency with enhanced actor isolation
- **iOS 26-First**: Single platform focus leveraging cutting-edge iOS features
- **Privacy-First**: All processing happens on-device with differential privacy

### MVVM + Repository Pattern with Async/Await (MANDATORY)

**CRITICAL ARCHITECTURE RULES - ALWAYS ENFORCE:**

- **UI**: SwiftUI with Observable ViewModels and data binding
- **ViewModels**: @Observable classes handling UI state and business logic
- **Repositories**: Data access abstraction with SwiftData integration
- **Use Cases**: Domain logic encapsulation for complex operations
- **Local-First**: SwiftData for type-safe, native iOS data persistence

**CONCURRENCY REQUIREMENTS - NO EXCEPTIONS:**

- **Always use async/await pattern** - NEVER use completion handlers or @escaping closures
- **Thread Safety**: Use @ModelActor for data operations, @MainActor for UI updates
- **ViewModel Pattern**: All ViewModels must be @Observable and handle async operations properly
- **Data Operations**: All data access must go through ModelActor-based repositories
- **UI Updates**: All UI state changes must happen on @MainActor

**NEVER DO:**

- Use completion handlers instead of async/await
- Use @escaping closures for async operations
- Access SwiftData ModelContext directly from ViewModels
- Perform data operations without proper actor isolation
- Mix ObservableObject with @Observable patterns

### SwiftData Implementation

```swift
import SwiftData

@Model
class Item {
    var name: String
    var timestamp: Date

    init(name: String, timestamp: Date = Date()) {
        self.name = name
        self.timestamp = timestamp
    }
}

// In SwiftUI View
struct ContentView: View {
    @Query private var items: [Item]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        // UI code here
    }
}
```

### SwiftData Predicate Guidelines (CRITICAL)

**ALWAYS FOLLOW THESE RULES:**

- Use `#Predicate<ModelType>` with explicit type for @Query
- String filtering: `contains()`, `starts(with:)`, `localizedStandardContains()` for case-insensitive
- Boolean logic: Use `&&`/`||` in single expressions, `!condition` (NOT `== false`)
- External values: Create local copies first (`let now = Date.now`)
- Relationship queries: `collection.contains { }`, `collection.filter { }`, `!collection.isEmpty`

**PREDICATE EXAMPLES:**

```swift
// Correct patterns
#Predicate<Product> { product in product.name.contains("Milk") }
#Predicate<Receipt> { receipt in !receipt.items.isEmpty }
let today = Date.now
#Predicate<Receipt> { receipt in receipt.date > today }
```

### Critical Technical Constraints

- **SwiftData 2.0 ONLY**: Native iOS data persistence with enhanced performance
- **iOS 26.0+**: Minimum deployment target for Visual Intelligence APIs
- **Xcode 26.0+**: Development environment requirement for Swift 6.2
- **Swift 6.2**: Strict concurrency with enhanced actor isolation
- **Visual Intelligence**: Apple's Visual Intelligence framework for universal receipt recognition
- **Privacy-First**: No external API calls for core functionality, all data stays on device
- **Accessibility**: WCAG 2.2 Level AA compliance required for all UI components

## Core Development Patterns

### Visual Intelligence Service with SwiftData 2.0

```swift
import Vision
import VisionKit
import SwiftData

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

// Swift 6.2 Actor for thread-safe processing
@available(iOS 26.0, *)
actor ReceiptProcessor {
    func process(_ observations: [VNReceiptObservation]) async throws -> UniversalReceipt {
        // Process with iOS 26 Visual Intelligence
        // Universal receipt understanding without store-specific code
    }
}

// SwiftData 2.0 Models with Universal Architecture
@Model
@available(iOS 26.0, *)
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

@Model
@available(iOS 26.0, *)
final class UniversalItem: Sendable {
    let identifier: String
    var descriptions: [String] // Multiple descriptions for matching
    var quantity: Decimal
    var unitPrice: Decimal?
    var totalPrice: Decimal
    var category: ItemCategory?
    var attributes: [String: String] // Flexible attributes

    init(identifier: String, descriptions: [String], quantity: Decimal, totalPrice: Decimal) {
        self.identifier = identifier
        self.descriptions = descriptions
        self.quantity = quantity
        self.totalPrice = totalPrice
        self.attributes = [:]
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

### Observable ViewModels with Async/Await

```swift
@MainActor
@Observable
class ReceiptScannerViewModel {
    private let ocrService: OCRService
    private let dataManager: DataManager

    var scanState: ScanState = .idle
    var receipts: [Receipt] = []

    init(ocrService: OCRService, dataManager: DataManager) {
        self.ocrService = ocrService
        self.dataManager = dataManager
    }

    func processReceipt(from imageData: Data) async {
        scanState = .processing
        do {
            let receipt = try await ocrService.processReceiptImage(imageData)
            try await dataManager.saveReceipt(receipt)
            await loadReceipts()
            scanState = .success(receipt)
        } catch {
            scanState = .error(error.localizedDescription)
        }
    }

    private func loadReceipts() async {
        do {
            receipts = try await dataManager.fetchAllReceipts()
        } catch {
            print("Failed to load receipts: \(error)")
        }
    }
}

enum ScanState {
    case idle
    case processing
    case success(Receipt)
    case error(String)
}
```

### SwiftUI Views with Async ViewModels

```swift
struct ReceiptScannerView: View {
    @State private var viewModel: ReceiptScannerViewModel

    init(dataManager: DataManager) {
        let ocrService = OCRService()
        _viewModel = State(wrappedValue: ReceiptScannerViewModel(
            ocrService: ocrService,
            dataManager: dataManager
        ))
    }

    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.scanState {
                case .idle:
                    CameraView { imageData in
                        Task {
                            await viewModel.processReceipt(from: imageData)
                        }
                    }
                case .processing:
                    ProgressView("Rechnung wird verarbeitet...")
                case .success(let receipt):
                    ReceiptResultView(receipt: receipt)
                case .error(let message):
                    ErrorView(message: message) {
                        Task {
                            await viewModel.resetScanState()
                        }
                    }
                }
            }
            .navigationTitle("Rechnung scannen")
            .task {
                await viewModel.loadInitialData()
            }
        }
    }
}
```

## Development Workflows

### MANDATORY: Use Fastlane Commands Only

**CRITICAL RULE - NEVER USE xcodebuild DIRECTLY:**

- ALWAYS use fastlane commands for all build, test, and deployment operations
- fastlane provides consistent, reliable automation with proper error handling
- Direct xcodebuild usage is prohibited to ensure consistent CI/CD workflows

### Fastlane Commands (MANDATORY)

```bash
# Build all targets (ALWAYS USE THIS)
bundle exec fastlane build

# Run all tests (ALWAYS USE THIS)
bundle exec fastlane test

# Run unit tests only
bundle exec fastlane unit_tests

# Run UI tests only
bundle exec fastlane ui_tests

# Run tests on specific simulator
bundle exec fastlane test device:"iPhone 16 Pro"

# Build and archive for App Store
bundle exec fastlane archive

# Deploy to App Store Connect
bundle exec fastlane deploy_to_app_store
```

### Development Setup Commands

```bash
# Install fastlane dependencies
bundle install

# Open iOS project (for debugging only)
open "Alles Teurer.xcodeproj"

# Check fastlane configuration
bundle exec fastlane --help
```

### NEVER USE - Prohibited Commands

```bash
# ❌ NEVER USE - Use 'bundle exec fastlane build' instead
xcodebuild build -scheme "Alles Teurer" -destination "platform=iOS Simulator,name=iPhone 16 Pro"

# ❌ NEVER USE - Use 'bundle exec fastlane test' instead
xcodebuild test -scheme "Alles Teurer" -destination "platform=iOS Simulator,name=iPhone 16 Pro"

# ❌ NEVER USE - Use 'bundle exec fastlane archive' instead
xcodebuild archive -scheme "Alles Teurer" -archivePath "AllesTeurer.xcarchive"
```

### Feature Development Approach

1. **Follow spec-driven workflow**: Reference `/spec/` directory for requirements and architecture
2. **EARS notation**: Requirements written as "WHEN [condition], THE SYSTEM SHALL [behavior]"
3. **Privacy validation**: Ensure no data leaves device except optional backend sync
4. **Accessibility first**: Use semantic markup and proper accessibility support in SwiftUI

## Technology-Specific Conventions

### Visual Intelligence Integration (iOS 26)

- Use Visual Intelligence for universal receipt recognition without store-specific code
- Handle German text recognition with enhanced iOS 26 language models
- Implement adaptive learning with on-device differential privacy
- Process receipts with A18 Pro Neural Engine optimization
- Use async/await for all Visual Intelligence operations
- Maintain 95%+ accuracy through contextual understanding

### Feature Development Approach

1. **Follow spec-driven workflow**: Reference `/spec/` directory for requirements and architecture
2. **EARS notation**: Requirements written as "WHEN [condition], THE SYSTEM SHALL [behavior]"
3. **Privacy validation**: Ensure no data leaves device except optional backend sync
4. **Accessibility first**: Use semantic markup and proper accessibility support in SwiftUI

### Swift Charts 2.0 Implementation

- Create interactive 3D price trend visualizations with iOS 26 features
- Support both light/dark mode appearances with enhanced contrast
- Implement gesture-based navigation and drill-down functionality
- Ensure charts are accessible with VoiceOver and Dynamic Type
- Use Swift Charts 2.0 real-time data binding capabilities

### Apple Intelligence Integration

- Use Natural Language framework for product categorization
- Implement smart product matching algorithms
- Process receipt text locally without external API calls
- Handle multilingual product names (German focus)

### Testing Framework

- **Primary Framework**: Swift Testing (`import Testing`) for new tests
- **Legacy Support**: XCTest for existing compatibility
- **UI Testing**: XCUITest for end-to-end receipt scanning flows
- **Accessibility Testing**: Validate VoiceOver and Dynamic Type support

## Critical "Don'ts"

- **Never use Core Data** - Swift Data only
- **No external analytics** - All insights calculated locally
- **No third-party OCR** - Apple Visual Intelligence framework exclusively
- **No cloud processing** - Maintain privacy-first architecture
- **Don't break accessibility** - Every UI element must be accessible

## Testing Approach

- **Unit Testing**: Test OCR processing, product matching, and price analytics using Swift Testing framework
- **UI Testing**: Verify receipt scanning flow and data display accuracy with XCUITest
- **Accessibility Testing**: Validate VoiceOver and Dynamic Type support
- **Privacy Testing**: Ensure no network calls in core functionality

## References

### Specifications & Architecture

- `/spec/Anforderungen.md` - Functional requirements in German
- `/spec/architecture.md` - Technical architecture decisions

### Core Development Instructions

- `/.github/instructions/modern-swift.md` - Modern Swift development patterns and SwiftUI best practices
- `/.github/instructions/swift-concurrency.md` - Swift 6 concurrency, data race safety, and strict concurrency
- `/.github/instructions/swiftdata.md` - Complete SwiftData framework documentation and patterns
- `/.github/instructions/swiftui.md` - SwiftUI development guidelines
- `/.github/instructions/swift-observable.md` - Observable pattern implementation
- `/.github/instructions/swift-observation.md` - Observation framework usage
- `/.github/instructions/swift6-migration.md` - Migration to Swift 6 guidelines

### Testing & Quality Assurance

- `/.github/instructions/swift-testing-playbook.md` - Complete Swift Testing migration guide
- `/.github/instructions/swift-testing-api.md` - Swift Testing API reference
- `/.github/instructions/ai-agent-testing.instructions.md` - AI agent test implementation guidelines
- `/.github/instructions/a11y.instructions.md` - Accessibility requirements (WCAG 2.2 Level AA)

### Specialized Features

- `/.github/instructions/VisualIntelligence.md` - Apple Visual Intelligence framework integration
- `/.github/instructions/Charts.md` - Swift Charts framework documentation and implementation patterns
- `/.github/instructions/OSLog.md` - Apple OSLog framework for structured logging and debugging
- `/.github/instructions/Symbols.md` - Apple Symbols framework for SF Symbols integration
- `/.github/instructions/swift-argument-parser.md` - Command line interface development

### Workflow & Process

- `/.github/instructions/spec-driven-workflow-v1.instructions.md` - Specification-driven development workflow
- `/.github/instructions/conventional-commit.instructions.md` - Conventional commit message standards
- `/.github/instructions/github-actions-ci-cd-best-practices.instructions.md` - CI/CD pipeline best practices
- `/.github/instructions/Fastlane.md` - Fastlane automation framework documentation and best practices
- `/.github/instructions/FastlaneActions.md` - Fastlane Actions documentation and best practices

### Documentation & Content

- `/.github/instructions/markdown.instructions.md` - Documentation and content creation standards
- `/.github/instructions/localization.instructions.md` - Localization guidelines for markdown documents
- `/.github/instructions/mermaid.md` - Diagram creation with Mermaid

### Analysis & Maintenance

- `/.github/instructions/code-analysis.md` - Code analysis and review guidelines
- `/.github/instructions/bug-fix.md` - Bug fixing methodology
- `/.github/instructions/analyze-issue.md` - Issue analysis procedures
- `/.github/instructions/add-to-changelog.md` - Changelog maintenance guidelines

```

```
