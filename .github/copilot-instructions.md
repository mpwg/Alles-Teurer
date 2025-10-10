# Alles Teurer - Copilot Instructions

## Project Overview

**Alles Teurer** is a cross-platform SwiftUI grocery price tracking app for Austria. It helps users track and compare prices across Austrian supermarkets (Hofer, Billa, Lidl, Spar, etc.) with CloudKit sync for family sharing.

## Architecture

### Core Data Models (SwiftData)

- **Product**: Normalized product with best/worst price tracking (`Product.swift`)
  - `normalizedName`: Standardized product name (e.g., "Milch")
  - Price bounds: `bestPricePerQuantity`/`highestPricePerQuantity` with store names
  - One-to-many relationship with Purchase (cascade delete)
- **Purchase**: Individual shopping transactions (`Purchase.swift`)
  - Links to Product via `@Relationship`
  - Contains `actualProductName` (store-specific name), quantity, totalPrice
  - Austrian locale formatting in computed properties

### Family Sharing Architecture (`FamilySharingSettings.swift`)

**Critical**: App uses **separate databases** for Debug/Release builds to prevent data contamination:

```swift
let containerSuffix = isDebugBuild ? "-debug" : ""
ModelConfiguration("AllesTeurer\(containerSuffix)", ...)
```

**Restart Required Pattern**: Settings changes require app restart - implement via UserDefaults flags:

```swift
var restartRequired: Bool // Tracked in UserDefaults
// UI shows banner when true, cleared after successful container creation
```

### Platform-Specific Patterns

See `PLATFORM_COMPATIBILITY.md` for iOS/macOS differences:

- **Toolbar**: iOS uses `navigationBarTrailing`, macOS uses `primaryAction`
- **Colors**: iOS `Color(.systemGray6)`, macOS `Color(NSColor.controlBackgroundColor)`
- **EditButton**: iOS-only - manual "Fertig" button for macOS

### Austrian Market Context

- **Test Data** (`TestData.swift`): 25 common Austrian grocery products
- **Shop Names**: Hofer, Billa, Lidl, Spar, Merkur, Interspar, Penny, MPreis
- **Locale**: `de_AT` for date formatting, EUR currency throughout
- **Units**: kg, l, Stk (Stück), g, ml, m, cm

## Key UI Patterns

### Smart Autocomplete (`AddPurchaseSheet.swift`)

**Performance-optimized suggestions**:

```swift
// Combine frequent purchases + common Austrian products
var productSuggestions: [String] {
    let topFrequentProducts = frequentProducts.lazy.prefix(10).map(\.normalizedName)
    // Filter to avoid duplicates, limit to 15 total
}
```

### Price Analysis Views

- **ProductDetailView**: Advanced sorting (9 options: date, price, quantity, shop)
- **ProductRowView**: Best/worst price comparison with visual indicators
- Price difference calculations emphasize cost-saving opportunities

### NavigationSplitView Architecture

**ContentView** uses master-detail pattern:

- Master: Product list with search/edit capabilities
- Detail: ProductDetailView with purchase history
- Empty state: ContentUnavailableView for guidance

## Development Workflows

### Build Configurations

- **Debug**: Uses `-debug` suffix for database isolation
- **Release**: Production database, same CloudKit container
- **Platform Support**: `TARGETED_DEVICE_FAMILY = "1,2,7"` (iPhone, iPad, Vision Pro)

### CloudKit Setup

**Required Entitlements** (`Alles_Teurer.entitlements`):

```xml
<key>com.apple.developer.icloud-container-identifiers</key>
<array><string>iCloud.eu.mpwg.alles-teurer</string></array>
```

### Data Management

**Cascade Delete**: Products → Purchases automatically handled by SwiftData
**Price Updates**: New purchases automatically update Product best/worst prices
**Sample Data**: Auto-generated on first launch via `TestData.createSampleData()`

## Critical Implementation Notes

1. **Family Sharing Toggle**: Always check CloudKit availability before enabling
2. **Price Calculations**: Handle division by zero in `pricePerQuantity` computations
3. **Database Migrations**: Debug/Release separation prevents migration conflicts
4. **Austrian Formatting**: Use `Locale(identifier: "de_AT")` consistently
5. **Cross-Platform**: Always test toolbar/UI on both iOS and macOS

## Extension Points

- Add new Austrian supermarket chains to `austrianShops` arrays
- Extend `PurchaseSortOption` enum for additional sorting methods
- Customize `TestData.swift` for regional product variations
- Implement push notifications via `remote-notification` background mode (Info.plist)

## Performance Considerations

- Lazy evaluation in suggestion algorithms (`AddPurchaseSheet.swift`)
- Pre-allocated capacity for suggestion arrays
- Efficient @Query usage with proper sort descriptors
- Background CloudKit availability checks with async/await
