# Toolbar Architecture Analysis & Improvement Plan

## 🔍 Current Architecture Issues

### 1. **Mixed Concerns in Views**

**Problem**: Toolbar logic contains business operations directly in views
**Example**: ContentView toolbar handles CSV export logic inline

```swift
// ❌ CURRENT - Business logic in View
Button("CSV Export", systemImage: "square.and.arrow.up") {
    Task {
        csvData = await viewModel.exportCSV()
        if csvData != nil {
            showingExportSheet = true
        }
    }
}
```

### 2. **Inconsistent Toolbar Patterns**

**Problem**: Each view implements toolbars differently

- `ContentView`: Complex inline logic with multiple ToolbarItemGroup
- `EditRechnungszeileView`: Simple save/cancel pattern
- `ProductDetailView`: Menu-based sorting options
- `ScanReceiptView`: Reset/done pattern

### 3. **ViewModifier Anti-Pattern**

**Problem**: Heavy reliance on custom ViewModifiers for state management
**Location**: `/View/MainView/` directory

- `ViewModelSetupModifier.swift`
- `AlertsModifier.swift`
- `SheetsModifier.swift`
- `FileExporterModifier.swift`
- `ConfirmationDialogModifier.swift`

**Impact**: Makes architecture harder to follow and debug

### 4. **Duplicate Actions**

**Problem**: Save buttons in both forms AND toolbars
**Example**: `AddRechnungszeileView` has save button in form section + toolbar

### 5. **State Management Inconsistencies**

**Problem**: Mixed patterns for toolbar state management

- Some @State in Views
- Some state in ViewModels
- Inconsistent naming and handling

## 🎯 Recommended Solution Architecture

### 1. **ToolbarViewModel Protocol**

Create a standardized approach for toolbar management:

```swift
protocol ToolbarViewModelProtocol: ObservableObject {
    var toolbarConfiguration: ToolbarConfiguration { get }
    func handleToolbarAction(_ action: ToolbarAction)
}

struct ToolbarConfiguration {
    let primaryActions: [ToolbarAction]
    let secondaryActions: [ToolbarAction]
    let navigationActions: [ToolbarAction]
}

enum ToolbarAction: Identifiable {
    case save
    case cancel
    case delete
    case export
    case add
    case scan
    case sort(SortOption)
    case custom(String, systemImage: String, action: () -> Void)

    var id: String { /* implementation */ }
}
```

### 2. **Reusable Toolbar Component**

Create a unified toolbar component:

```swift
struct StandardToolbar: ToolbarContent {
    let configuration: ToolbarConfiguration
    let onAction: (ToolbarAction) -> Void

    var body: some ToolbarContent {
        // Standardized toolbar implementation
    }
}
```

### 3. **Remove ViewModifier Anti-Pattern**

- Eliminate custom sheet/alert modifiers
- Move state management into ViewModels
- Use standard SwiftUI state management patterns

### 4. **Consistent MVVM Pattern**

- All business logic in ViewModels
- Views only handle UI state and user interactions
- Consistent @Observable pattern usage

## 🔧 Implementation Plan

### Phase 1: Create Toolbar Infrastructure

1. Create `ToolbarViewModelProtocol`
2. Create `ToolbarConfiguration` and `ToolbarAction` types
3. Create `StandardToolbar` component

### Phase 2: Refactor ContentView

1. Move toolbar logic to `ContentViewModel`
2. Replace inline toolbar with `StandardToolbar`
3. Remove ViewModifier dependencies

### Phase 3: Standardize Other Views

1. Update `EditRechnungszeileView` toolbar
2. Update `ProductDetailView` toolbar
3. Update `ScanReceiptView` toolbar
4. Update `AddRechnungszeileView` toolbar

### Phase 4: Clean Up

1. Remove custom ViewModifier files
2. Ensure consistent MVVM patterns
3. Add accessibility support
4. Add unit tests for toolbar logic

## 📋 Files Requiring Changes

### New Files to Create:

- `Logic/Toolbar/ToolbarViewModelProtocol.swift`
- `Logic/Toolbar/ToolbarConfiguration.swift`
- `View/Components/StandardToolbar.swift`

### Files to Modify:

- `View/MainView/ContentView.swift` - Major refactor
- `ViewModel/ContentViewModel.swift` - Add toolbar logic
- `View/Rechnungszeile/EditRechnungszeileView.swift` - Standardize toolbar
- `View/Produkt/ProductDetailView.swift` - Standardize toolbar
- `View/ScanReceiptView.swift` - Standardize toolbar
- `View/Rechnungszeile/AddRechnungszeileView.swift` - Remove duplicate actions

### Files to Remove:

- `View/MainView/ViewModelSetupModifier.swift`
- `View/MainView/AlertsModifier.swift`
- `View/MainView/SheetsModifier.swift`
- `View/MainView/FileExporterModifier.swift`
- `View/MainView/ConfirmationDialogModifier.swift`

## ✅ Expected Benefits

1. **Consistent UX**: Standardized toolbar behavior across all views
2. **Better Maintainability**: Centralized toolbar logic and configuration
3. **Proper MVVM**: Clear separation of concerns
4. **Easier Testing**: Business logic isolated in ViewModels
5. **Accessibility**: Consistent accessibility implementation
6. **Reduced Code Duplication**: Reusable toolbar components

## 🚨 Risks & Considerations

1. **Breaking Changes**: Major refactoring will require extensive testing
2. **Complex Migration**: Need to carefully migrate existing state management
3. **Accessibility**: Must ensure toolbar accessibility isn't degraded
4. **Performance**: Ensure new architecture doesn't impact performance
