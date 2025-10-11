---
description: Guide for converting SwiftUI views to MVVM pattern using @Observable macro
globs: "**/*.swift"
alwaysApply: false
---

# Converting SwiftUI Views to MVVM Pattern with @Observable

This guide provides a systematic approach for refactoring SwiftUI views into the MVVM (Model-View-ViewModel) pattern using Swift's modern `@Observable` macro, based on the Alles Teurer app architecture.

## Overview

The MVVM pattern separates concerns by:

- **Model**: Data entities (SwiftData models like `Product`, `Purchase`)
- **View**: SwiftUI views that display UI
- **ViewModel**: Business logic and state management using `@Observable`

## Key Principles

### 1. Use @Observable Instead of ObservableObject

**Modern Approach (iOS 17+)**

```swift
import SwiftUI
import SwiftData

@Observable
final class ProductListViewModel {
    var products: [Product] = []
    var searchText = ""
    var sortOption: ProductSortOption = .nameAscending

    // Computed properties automatically trigger view updates
    var filteredProducts: [Product] {
        // filtering logic
    }
}
```

### 2. State Management Migration

Replace old property wrappers with modern equivalents:

| Old Pattern                 | New Pattern         | Use Case              |
| --------------------------- | ------------------- | --------------------- |
| `@StateObject`              | `@State`            | Creating ViewModels   |
| `@ObservedObject`           | No wrapper needed   | Passing ViewModels    |
| `@EnvironmentObject`        | `@Environment`      | Sharing ViewModels    |
| `@Published`                | Remove (not needed) | Observable properties |
| `@ObservedObject` + binding | `@Bindable`         | Two-way binding       |

## Step-by-Step Conversion Process

### Step 1: Identify View Logic to Extract

Look for these patterns in your views:

- Complex computed properties
- Business logic in view body
- Data fetching/processing
- State management beyond UI state
- Validation logic

**Before (View with embedded logic):**

```swift
struct ProductListView: View {
    @Query private var products: [Product]
    @State private var searchText = ""

    var body: some View {
        List {
            ForEach(products.filter { product in
                searchText.isEmpty ||
                product.normalizedName.localizedCaseInsensitiveContains(searchText)
            }) { product in
                // Complex view logic here
            }
        }
    }
}
```

### Step 2: Create ViewModel Class

Create a ViewModel for each major view component:

```swift
import SwiftUI
import SwiftData

@Observable
final class ProductListViewModel {
    // MARK: - Properties
    private var modelContext: ModelContext
    var products: [Product] = []
    var searchText = ""
    var sortOption: ProductSortOption = .nameAscending
    var isLoading = false
    var errorMessage: String?

    // MARK: - Computed Properties
    var filteredProducts: [Product] {
        let filtered = searchText.isEmpty ? products :
            products.filter {
                $0.normalizedName.localizedCaseInsensitiveContains(searchText)
            }

        return filtered.sorted(by: sortOption.comparator)
    }

    var hasProducts: Bool {
        !products.isEmpty
    }

    // MARK: - Initialization
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadProducts()
    }

    // MARK: - Methods
    func loadProducts() {
        let descriptor = FetchDescriptor<Product>()
        do {
            products = try modelContext.fetch(descriptor)
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func deleteProduct(_ product: Product) {
        modelContext.delete(product)
        loadProducts()
    }

    func addPurchase(for product: Product, purchase: Purchase) {
        product.purchases.append(purchase)
        try? modelContext.save()
        loadProducts()
    }
}
```

### Step 3: Update View to Use ViewModel

**After (Clean view with ViewModel):**

```swift
struct ProductListView: View {
    @State private var viewModel: ProductListViewModel
    @Environment(\.modelContext) private var modelContext

    init() {
        // Initialize in init to access modelContext
    }

    var body: some View {
        List {
            ForEach(viewModel.filteredProducts) { product in
                ProductRowView(product: product)
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            viewModel.deleteProduct(product)
                        }
                    }
            }
        }
        .searchable(text: $viewModel.searchText)
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            } else if !viewModel.hasProducts {
                ContentUnavailableView(
                    "Keine Produkte",
                    systemImage: "cart",
                    description: Text("Fügen Sie Ihr erstes Produkt hinzu")
                )
            }
        }
        .alert("Fehler", isPresented: .constant(viewModel.errorMessage != nil)) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
}
```

### Step 4: Handle SwiftData Integration

For apps using SwiftData (like Alles Teurer):

```swift
@Observable
final class PurchaseViewModel {
    private var modelContext: ModelContext

    // Form state
    var productName = ""
    var shopName = ""
    var quantity: Double = 1.0
    var totalPrice: Double = 0.0
    var purchaseDate = Date()

    // Validation
    var isValid: Bool {
        !productName.isEmpty &&
        !shopName.isEmpty &&
        quantity > 0 &&
        totalPrice > 0
    }

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func savePurchase() async throws {
        let normalizedName = productName.trimmingCharacters(in: .whitespacesAndNewlines)

        // Find or create product
        let descriptor = FetchDescriptor<Product>(
            predicate: #Predicate { $0.normalizedName == normalizedName }
        )

        let existingProducts = try modelContext.fetch(descriptor)
        let product = existingProducts.first ?? Product(normalizedName: normalizedName)

        // Create purchase
        let purchase = Purchase(
            actualProductName: productName,
            shopName: shopName,
            quantity: quantity,
            totalPrice: totalPrice,
            purchaseDate: purchaseDate
        )

        product.purchases.append(purchase)

        if existingProducts.isEmpty {
            modelContext.insert(product)
        }

        try modelContext.save()
    }
}
```

### Step 5: Handle Bindings with @Bindable

When you need two-way binding to ViewModel properties:

```swift
struct AddPurchaseSheet: View {
    @Bindable var viewModel: PurchaseViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            TextField("Produktname", text: $viewModel.productName)
            TextField("Geschäft", text: $viewModel.shopName)

            Stepper(
                "Menge: \(viewModel.quantity.formatted())",
                value: $viewModel.quantity,
                in: 0.1...1000,
                step: 0.1
            )

            TextField(
                "Preis",
                value: $viewModel.totalPrice,
                format: .currency(code: "EUR")
            )
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Abbrechen") { dismiss() }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Speichern") {
                    Task {
                        try? await viewModel.savePurchase()
                        dismiss()
                    }
                }
                .disabled(!viewModel.isValid)
            }
        }
    }
}
```

### Step 6: Share ViewModels via Environment

For app-wide state (like FamilySharingSettings):

```swift
@Observable
final class AppViewModel {
    var isFamilySharingEnabled = false
    var restartRequired = false
    private let userDefaults = UserDefaults.standard

    init() {
        loadSettings()
    }

    func loadSettings() {
        isFamilySharingEnabled = userDefaults.bool(forKey: "familySharingEnabled")
        restartRequired = userDefaults.bool(forKey: "restartRequired")
    }

    func toggleFamilySharing() {
        isFamilySharingEnabled.toggle()
        userDefaults.set(isFamilySharingEnabled, forKey: "familySharingEnabled")
        userDefaults.set(true, forKey: "restartRequired")
        restartRequired = true
    }
}

// In App file
@main
struct AllesTeuerApp: App {
    @State private var appViewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appViewModel)
        }
    }
}

// In child views
struct SettingsView: View {
    @Environment(AppViewModel.self) private var appViewModel

    var body: some View {
        Toggle("Familie teilen", isOn: .init(
            get: { appViewModel.isFamilySharingEnabled },
            set: { _ in appViewModel.toggleFamilySharing() }
        ))
    }
}
```

## Testing ViewModels

ViewModels are easily testable in isolation:

```swift
import Testing
import SwiftData

@Test
func testProductFiltering() async throws {
    // Create in-memory model container for testing
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Product.self, configurations: config)

    let viewModel = ProductListViewModel(modelContext: container.mainContext)

    // Add test data
    let product = Product(normalizedName: "Milch")
    container.mainContext.insert(product)
    try container.mainContext.save()

    // Test filtering
    viewModel.searchText = "Milch"
    viewModel.loadProducts()

    #expect(viewModel.filteredProducts.count == 1)
    #expect(viewModel.filteredProducts.first?.normalizedName == "Milch")
}
```

## Common Patterns for Alles Teurer

### Price Analysis ViewModel

```swift
@Observable
final class PriceAnalysisViewModel {
    var product: Product
    var sortOption: PurchaseSortOption = .dateDescending

    var sortedPurchases: [Purchase] {
        product.purchases.sorted(by: sortOption.comparator)
    }

    var priceStatistics: PriceStats {
        PriceStats(
            average: product.averagePrice,
            minimum: product.bestPricePerQuantity,
            maximum: product.highestPricePerQuantity,
            trend: calculateTrend()
        )
    }

    private func calculateTrend() -> PriceTrend {
        // Trend calculation logic
    }
}
```

### Autocomplete ViewModel

```swift
@Observable
final class AutocompleteViewModel {
    private var modelContext: ModelContext
    var searchText = ""
    var suggestions: [String] = []

    func updateSuggestions() {
        guard !searchText.isEmpty else {
            suggestions = []
            return
        }

        // Fetch frequent products
        let descriptor = FetchDescriptor<Product>(
            sortBy: [SortDescriptor(\.purchases.count, order: .reverse)]
        )

        do {
            let products = try modelContext.fetch(descriptor)
            suggestions = products
                .map(\.normalizedName)
                .filter { $0.localizedCaseInsensitiveContains(searchText) }
                .prefix(10)
                .map { String($0) }
        } catch {
            suggestions = []
        }
    }
}
```

## Migration Checklist

- [ ] Identify views with complex logic
- [ ] Create ViewModel classes with `@Observable`
- [ ] Move business logic from views to ViewModels
- [ ] Replace `@StateObject` with `@State` for ViewModel creation
- [ ] Remove `@Published` from ViewModel properties
- [ ] Use `@Bindable` for two-way binding needs
- [ ] Replace `@EnvironmentObject` with `@Environment`
- [ ] Move SwiftData queries to ViewModels where appropriate
- [ ] Add computed properties for derived state
- [ ] Implement async methods for data operations
- [ ] Create unit tests for ViewModels
- [ ] Update preview providers with mock ViewModels

## Best Practices

1. **Keep ViewModels focused**: One ViewModel per major view component
2. **Use computed properties**: Leverage automatic change tracking
3. **Avoid @Published**: Not needed with `@Observable`
4. **Test ViewModels**: Business logic should be unit tested
5. **Handle errors gracefully**: Include error state in ViewModels
6. **Use dependency injection**: Pass ModelContext to ViewModels
7. **Maintain single responsibility**: ViewModels handle state and logic, not UI
8. **Document complex logic**: Add comments for business rules
9. **Consider performance**: Use lazy evaluation for expensive computations
10. **Follow Austrian context**: Maintain locale-specific formatting in ViewModels

## Anti-Patterns to Avoid

- Don't use `ObservableObject` in new code
- Don't mix `@Published` with `@Observable`
- Don't put UI code in ViewModels
- Don't create massive ViewModels (split if > 200 lines)
- Don't ignore error handling
- Don't bypass SwiftData's MainContext for UI updates
- Don't create circular dependencies between ViewModels
