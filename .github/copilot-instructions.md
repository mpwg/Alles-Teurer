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

## Build and Test Automation (XcodeBuildMCP)

**ALWAYS use XcodeBuildMCP tools for building, running, and testing this project.**

### Initial Setup

Before any build/run operation:

1. **Discover tools for the workflow**:

   ```
   mcp_xcodebuildmcp_discover_tools({
     task_description: "Build and run iOS app on iPhone simulator using Alles-Teurer.xcodeproj"
   })
   ```

2. **Discover project files**:
   ```
   mcp_xcodebuildmcp_discover_projs({
     workspaceRoot: "/Users/mat/code/Alles-Teurer"
   })
   ```

### Building and Running

**For iOS Simulator** (preferred for development):

```
mcp_xcodebuildmcp_build_run_sim({
  projectPath: "/Users/mat/code/Alles-Teurer/Alles-Teurer.xcodeproj",
  scheme: "Alles-Teurer",
  simulatorName: "iPhone 17",
  preferXcodebuild: true
})
```

**Available Simulators**: Check with `mcp_xcodebuildmcp_list_sims()`

- iPhone 17, iPhone 17 Pro, iPhone 17 Pro Max
- iPhone 16, iPhone 16 Pro, iPhone 16 Pro Max
- iPad Pro (M4/M5), iPad Air (M3)

**For Physical Device**:

- Physical iPhone available: "Matthias' iPhone 15 Pro Max"

### Testing

```
mcp_xcodebuildmcp_test_sim({
  projectPath: "/Users/mat/code/Alles-Teurer/Alles-Teurer.xcodeproj",
  scheme: "Alles-Teurer",
  simulatorName: "iPhone 17"
})
```

### Cleaning Build Artifacts

```
mcp_xcodebuildmcp_clean({
  projectPath: "/Users/mat/code/Alles-Teurer/Alles-Teurer.xcodeproj",
  scheme: "Alles-Teurer",
  platform: "iOS Simulator"
})
```

### Debugging and Logging

After launching app, capture logs:

```
mcp_xcodebuildmcp_launch_app_logs_sim({
  simulatorUuid: "SIMULATOR_UUID",
  bundleId: "eu.mpwg.Alles-Teurer"
})
```

### Build Troubleshooting

1. **Use `preferXcodebuild: true`** if incremental builds fail
2. **Check build settings**: `mcp_xcodebuildmcp_show_build_settings()`
3. **List available schemes**: `mcp_xcodebuildmcp_list_schemes()`
4. **Clean before rebuilding** if experiencing strange issues

### Mandatory Usage Rules

- ❌ **NEVER** use `xcodebuild` commands directly in terminal
- ❌ **NEVER** use Xcode GUI commands like "Product > Run"
- ✅ **ALWAYS** use MCP tools for all Xcode operations
- ✅ **ALWAYS** specify `preferXcodebuild: true` for reliability
- ✅ **ALWAYS** use project file path, not workspace (this project uses .xcodeproj)
