---
description: "Toolbar Architecture Guidelines for Alles-Teurer"
applyTo: "**/View/*.swift"
---

# Toolbar Architecture Guidelines

## Core Principles

### 1. Toolbar Scoping

- **NEVER** apply `.toolbar` modifiers to `NavigationSplitView` or `NavigationStack` containers
- **ALWAYS** apply `.toolbar` modifiers to the specific view content that needs the toolbar
- **AVOID** toolbar inheritance issues by keeping toolbars scoped to their immediate content

### 2. Toolbar Placement Strategy

#### Primary Actions (`placement: .primaryAction`)

- Most important and frequently used actions
- Add, Scan, Export, Sort controls
- Maximum 3-4 items to avoid overcrowding
- Use clear, descriptive system icons

#### Secondary Actions (`placement: .secondaryAction`)

- Less frequent or destructive actions
- Delete, Edit, Advanced options
- Use red foreground color for destructive actions
- Include confirmation dialogs for destructive actions

#### Navigation Actions

- `placement: .cancellationAction` for Cancel/Close buttons
- `placement: .topBarLeading` for Back/Reset actions
- `placement: .topBarTrailing` for Done/Finish actions

## Implementation Patterns

### ✅ CORRECT: Content-Scoped Toolbars

```swift
struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            mainContent // <- Toolbar applied here
        } detail: {
            detailContent // <- Separate toolbar here if needed
        }
    }

    @ViewBuilder
    var mainContent: some View {
        // Content implementation
        VStack {
            // Content
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                // Toolbar items
            }
        }
    }
}
```

### ❌ INCORRECT: Container-Level Toolbars

```swift
struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            mainContent
        } detail: {
            detailContent
        }
        .toolbar { // <- This will cause overflow issues!
            // Toolbar items
        }
    }
}
```

## Toolbar Categories by View Type

### Main List Views (ContentView, RechnungsZeilenListView)

```swift
.toolbar {
    ToolbarItemGroup(placement: .primaryAction) {
        Button("CSV Export", systemImage: "square.and.arrow.up") { }
        Button("Hinzufügen", systemImage: "plus") { }
        Button("Rechnung scannen", systemImage: "qrcode.viewfinder") { }
    }

    ToolbarItemGroup(placement: .secondaryAction) {
        Button("Alle löschen", systemImage: "trash.fill") { }
            .foregroundColor(.red)
    }
}
```

### Detail Views (ProductDetailView)

```swift
.toolbar {
    ToolbarItemGroup(placement: .primaryAction) {
        Menu("Sortieren") {
            // Sort options
        } label: {
            Image(systemName: "arrow.up.arrow.down")
        }
    }

    ToolbarItemGroup(placement: .secondaryAction) {
        Button("Bearbeiten", systemImage: "pencil") { }
    }
}
```

### Modal Views (AddRechnungszeileView, EditRechnungszeileView)

```swift
.toolbar {
    ToolbarItem(placement: .cancellationAction) {
        Button("Abbrechen") { dismiss() }
    }

    ToolbarItem(placement: .primaryAction) {
        Button("Speichern") { save() }
            .fontWeight(.semibold)
            .disabled(!isFormValid)
    }
}
```

### Full-Screen Modals (ScanReceiptView, CameraView)

```swift
.toolbar {
    ToolbarItem(placement: .topBarTrailing) {
        Button("Fertig") { dismiss() }
    }

    ToolbarItem(placement: .topBarLeading) {
        Button("Zurücksetzen") { reset() }
    }
}
```

## Accessibility Guidelines

### Labels and Hints

- Always provide `.accessibilityLabel()` for icon-only buttons
- Add `.accessibilityHint()` for complex interactions
- Use descriptive button text when possible

```swift
Button("", systemImage: "trash.fill") { }
    .accessibilityLabel("Alle Artikel löschen")
    .accessibilityHint("Löscht alle gespeicherten Artikel unwiderruflich")
```

### State Communication

- Disable buttons when actions are not available
- Use `.disabled()` with clear visual feedback
- Provide loading states for async operations

## Platform Considerations

### Mac Catalyst Compatibility

- Use `ToolbarItemGroup` instead of individual `ToolbarItem` when appropriate
- Test toolbar behavior on both iOS and macOS
- Consider keyboard shortcuts for primary actions

### iOS Specific

- Follow iOS Human Interface Guidelines for toolbar density
- Use system icons consistently
- Respect safe areas and device orientations

## Common Anti-Patterns to Avoid

1. **Toolbar Overflow**: Placing toolbar on NavigationSplitView
2. **Too Many Items**: More than 5 primary actions
3. **Inconsistent Placement**: Same actions in different placements across views
4. **Missing Accessibility**: Icon buttons without labels
5. **State Confusion**: Enabled buttons that don't work in current state

## Testing Checklist

- [ ] Toolbar items appear only in intended view
- [ ] No toolbar overflow to other navigation levels
- [ ] All buttons have proper accessibility labels
- [ ] Disabled states work correctly
- [ ] Actions perform expected behaviors
- [ ] Destructive actions have confirmations
- [ ] Toolbar works on both iPhone and iPad
- [ ] Mac Catalyst compatibility verified (if applicable)

## Migration Guide

When refactoring existing toolbars:

1. Identify current toolbar scope (container vs. content)
2. Move `.toolbar` modifier to specific content view
3. Update placement strategy based on action importance
4. Add proper accessibility labels
5. Test on multiple platforms
6. Verify no toolbar inheritance issues

This architecture ensures clean separation of concerns and prevents the toolbar overflow issues that were affecting the app's navigation experience.
