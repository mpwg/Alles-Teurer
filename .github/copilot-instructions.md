# AllesTeurer - AI Agent Instructions

## Project Overview

AllesTeurer is a **privacy-first native iOS app in early development** that will track product price inflation through receipt scanning and local analytics. Currently implements a basic SwiftUI + SwiftData foundation with plans to add Apple's Visual Intelligence framework for receipt recognition and Swift Charts for data visualization.

**Current Status**: Early development stage with basic CRUD functionality for receipt line items (`Rechnungszeile`)
**Target Architecture**: iOS-first development using SwiftUI, SwiftData, and native iOS frameworks

## Current Project Structure

```
AllesTeurer/
├── Alles-Teurer/            # Native iOS App
│   ├── Alles_TeurerApp.swift       # App Entry Point with SwiftData ModelContainer
│   ├── ContentView.swift           # Main SwiftUI View (basic list/add functionality)
│   ├── Model/
│   │   └── Rechnungszeile.swift    # SwiftData Model for receipt line items
│   ├── View/                       # Currently empty - planned UI components
│   ├── ViewModel/                  # Currently empty - planned view models
│   ├── Info.plist                  # App Configuration
│   ├── Alles_Teurer.entitlements  # App Capabilities
│   └── Assets.xcassets/            # App Assets and Icons
├── Alles-Teurer.xcodeproj/  # Xcode Project Configuration
├── Alles-TeurerTests/       # Unit Tests (basic template)
├── Alles-TeurerUITests/     # UI Tests (basic template)
├── spec/                    # Requirements and architecture docs (vision/planning)
├── README.md               # Project overview and vision
└── .github/                # GitHub configuration and instructions
    ├── copilot-instructions.md     # AI agent development guidelines
    └── instructions/               # Specific coding guidelines and patterns
```

## Current Implementation & Architecture

### What's Currently Implemented

- **SwiftUI + SwiftData Foundation**: Basic app structure with `Alles_TeurerApp.swift` containing ModelContainer setup
- **Rechnungszeile Model**: SwiftData model representing receipt line items with German properties:
  ```swift
  @Model
  final class Rechnungszeile: Identifiable {
      var Name: String        // Product name
      var Price: Decimal      // Price using Decimal for currency precision
      var Category: String    // Product category
      var Shop: String        // Store name
      var Datum: Date         // Date (German for "date")
      var id: UUID           // Unique identifier
  }
  ```
- **Basic CRUD UI**: ContentView with list, add, and delete functionality using NavigationSplitView
- **German Language Focus**: Property names and comments in German, targeting Austrian market

### Planned Architecture (from spec/ directory)

- **Target iOS 26.0+** with Swift 6.2 strict concurrency
- **Visual Intelligence Integration** for receipt OCR (not yet implemented)
- **MVVM Pattern** with @Observable ViewModels (View/ and ViewModel/ directories currently empty)
- **Privacy-First**: All processing on-device, no external API calls
- **Swift Charts** for price trend visualization (planned)

### Development Patterns to Follow

- **Use Swift modern concurrency** (async/await) when adding async operations
- **SwiftData best practices**: Continue using @Model for data types, @Query in views
- **German naming conventions**: Follow existing pattern of German property names for domain models
- **Decimal for currency**: Always use `Decimal` type for monetary values (already established in Rechnungszeile.swift)

## Development Workflows

### Project Setup

- **Standard Xcode Project**: Use Xcode for build/run/test (no Fastlane currently configured)
- **Simulator Testing**: Run on iOS Simulator for development
- **SwiftData Schema**: ModelContainer configured in `Alles_TeurerApp.swift` with current schema

### Key Files to Understand

- **`Alles-Teurer/Model/Rechnungszeile.swift`**: Core data model - understand German property names
- **`Alles-Teurer/ContentView.swift`**: Main UI implementation showing SwiftData @Query usage
- **`Alles-Teurer/Alles_TeurerApp.swift`**: App entry point with ModelContainer setup
- **`spec/` directory**: Contains requirements and architectural vision in German/English

### Current SwiftData Usage Pattern

```swift
// From ContentView.swift - actual implementation pattern to follow
@Environment(\.modelContext) private var modelContext
@Query private var items: [Rechnungszeile]

// Adding items (from addItem() function)
let newItem = Rechnungszeile(Name: "Name", Price: 1.23, Category: "Category", Shop: "Shop", Datum: Date.now)
modelContext.insert(newItem)
```

### Critical Constraints

- **Privacy-First**: All data processing stays on device (architectural principle from README)
- **German Market Focus**: UI and data structures should consider Austrian/German conventions
- **Currency Precision**: Always use `Decimal` type for prices (established pattern)
- **No External Dependencies**: Prefer native iOS frameworks over third-party libraries

## Current Development Patterns

### SwiftData Model Pattern (Established)

```swift
// Follow the established pattern from Rechnungszeile.swift
@Model
final class Rechnungszeile: Identifiable {
    var Name: String        // German property names for domain models
    var Price: Decimal      // Always use Decimal for currency
    var Category: String
    var Shop: String
    var Datum: Date        // German: "date"
    var id: UUID

    init(Name: String, Price: Decimal, Category: String, Shop: String, Datum: Date) {
        // Initialize all properties explicitly
        self.Name = Name
        self.Price = Price
        self.Category = Category
        self.Shop = Shop
        self.Datum = Datum
        self.id = UUID()
    }
}
```

### SwiftUI + SwiftData Integration (Established)

```swift
// From ContentView.swift - follow this pattern
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Rechnungszeile]  // Use German model names

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    // Display using German date formatting
                    Text(item.Datum, format: Date.FormatStyle(date: .numeric, time: .standard))
                }
                .onDelete(perform: deleteItems)
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Rechnungszeile(Name: "Name", Price: 1.23, Category: "Category", Shop: "Shop", Datum: Date.now)
            modelContext.insert(newItem)
        }
    }
}
```

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
@available(iOS 26.0, \*)
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
@available(iOS 26.0, \*)
@ModelActor
actor DataManager {
// NEVER access ModelContext directly from ViewModels
func saveReceipt(\_ receipt: UniversalReceipt) async throws {
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

````

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
````

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

### Build & Test Commands

Currently using standard Xcode project workflow (no Fastlane configured yet):

```bash
# Open the project
open "Alles-Teurer.xcodeproj"

# Build from command line (if needed)
xcodebuild build -project "Alles-Teurer.xcodeproj" -scheme "Alles-Teurer" -destination "platform=iOS Simulator,name=iPhone 16 Pro"

# Run tests from command line
xcodebuild test -project "Alles-Teurer.xcodeproj" -scheme "Alles-Teurer" -destination "platform=iOS Simulator,name=iPhone 16 Pro"
```

**Note**: Build automation with Fastlane is planned but not yet implemented.

### Feature Development Approach

1. **Follow spec-driven workflow**: Reference `/spec/` directory for requirements and architecture
2. **EARS notation**: Requirements written as "WHEN [condition], THE SYSTEM SHALL [behavior]"
3. **Privacy validation**: Ensure no data leaves device except optional backend sync
4. **Accessibility first**: Use semantic markup and proper accessibility support in SwiftUI

## Planned Features (Not Yet Implemented)

The following are architectural plans documented in `spec/` but not yet implemented:

- **Visual Intelligence Integration**: Apple's framework for receipt OCR (iOS 26+)
- **MVVM Architecture**: @Observable ViewModels with async/await patterns
- **Swift Charts**: Interactive price trend visualizations
- **Advanced SwiftData**: Relationships, complex queries, data analytics
- **Receipt Scanning**: Camera integration with Vision framework
- **Product Matching**: Algorithms to identify same products across receipts

## Testing Approach

- **Current**: Basic XCTest templates in place
- **Planned**: Swift Testing framework for new tests
- **UI Testing**: XCUITest for interface validation
- **Accessibility**: VoiceOver and Dynamic Type support validation

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
