# Receipt Scanning Feature

## Overview

The Receipt Scanning feature allows users to photograph or select a receipt image and automatically extract product information, creating multiple purchases at once.

## Architecture

### Files Created

1. **`ReceiptScanViewModel.swift`** - View model handling receipt processing logic
2. **`ReceiptScanView.swift`** - SwiftUI view for the receipt scanning UI

### Data Flow

```
User Action (Photo/Camera)
    ↓
PhotosPicker / Camera
    ↓
ReceiptScanViewModel.loadSelectedPhoto()
    ↓
processReceiptImage()
    ↓
[Visual Intelligence API Integration - TODO]
    ↓
DetectedPurchaseItem[] (Mock data currently)
    ↓
User reviews/edits items
    ↓
savePurchases(to: ModelContext)
    ↓
Create Product & Purchase records
    ↓
SwiftData persistence
```

## UI Components

### Main View (`ReceiptScanView`)

**Sections:**

1. **Photo Selection**

   - Camera button (iOS only)
   - Photo library picker
   - Shows selected image preview

2. **Receipt Header** (after scan)

   - Editable shop name
   - Date picker
   - Total items count & sum

3. **Detected Items List**

   - Shows each detected purchase
   - Swipe to delete
   - Tap to edit
   - Displays: product name, quantity, unit, price per unit, total price

4. **Toolbar**
   - Cancel button
   - Save button (disabled if no items)

### Edit Sheet (`EditDetectedItemSheet`)

Form with fields:

- Product name
- Quantity (number input)
- Unit (text)
- Total price (currency input)
- Calculated price per unit (read-only)

## View Model (`ReceiptScanViewModel`)

### Properties

```swift
// Receipt Information
var shopName: String
var receiptDate: Date

// Detected Items
var detectedItems: [DetectedPurchaseItem]

// UI State
var isProcessing: Bool
var errorMessage: String?
var selectedPhotoItem: PhotosPickerItem?
var scannedImage: UIImage?
```

### Key Methods

#### `loadSelectedPhoto() async`

Loads the selected photo from PhotosPicker and processes it.

#### `processReceiptImage(_ image: UIImage) async`

**TODO**: Integrate with Visual Intelligence API
Currently returns mock data for UI development.

Expected to:

- Send image to Visual Intelligence API
- Parse response for shop name, date, items
- Populate `detectedItems` array

#### `savePurchases(to context: ModelContext) throws`

Saves all detected items as purchases:

1. For each item, find or create Product
2. Create Purchase linked to Product
3. Save to SwiftData context

#### `removeItem(_ item: DetectedPurchaseItem)`

Remove an item from the detected list.

#### `updateItem(_ item: DetectedPurchaseItem, ...)`

Update an item's properties (name, quantity, unit, price).

## Data Model

### `DetectedPurchaseItem`

```swift
struct DetectedPurchaseItem: Identifiable {
    let id: UUID
    var productName: String
    var quantity: Double
    var unit: String
    var totalPrice: Double
    var pricePerUnit: Double { totalPrice / quantity }
}
```

Temporary model used during receipt scanning, before saving to SwiftData.

## Integration Points

### ContentView

Added "Beleg scannen" button to toolbar:

- iOS: Leading toolbar item with camera icon
- macOS: Automatic placement

Sheet presentation:

```swift
.sheet(isPresented: $showingReceiptScan) {
    ReceiptScanView()
}
```

Reloads products when sheet is dismissed.

## Visual Intelligence Integration (TODO)

### Requirements

1. **API Setup**

   - Apple Visual Intelligence API credentials
   - Receipt OCR/parsing endpoint

2. **Image Processing**

   ```swift
   func processReceiptImage(_ image: UIImage) async {
       // 1. Send image to Visual Intelligence API
       // 2. Receive structured JSON response
       // 3. Parse shop name, date, items array
       // 4. Convert to DetectedPurchaseItem[]
   }
   ```

3. **Expected API Response Format**
   ```json
   {
     "shopName": "Hofer",
     "date": "2025-10-12",
     "items": [
       {
         "productName": "Milch 3,5%",
         "quantity": 1.0,
         "unit": "l",
         "totalPrice": 1.29
       },
       ...
     ]
   }
   ```

### Current Mock Data

For UI development, `processReceiptImage()` returns hardcoded sample data:

- Shop: "Hofer"
- Date: Current date
- 4 sample items (milk, bread, eggs, bananas)

Replace this with actual API call when Visual Intelligence is integrated.

## Error Handling

### Validation Errors

```swift
enum ValidationError: LocalizedError {
    case missingShopName  // "Bitte Geschäftsname eingeben"
    case noItems          // "Keine Artikel erkannt"
}
```

### User-Facing Errors

- Photo loading failure
- API processing failure
- Save failure to database

All displayed via `.alert()` modifier.

## User Workflow

### Happy Path

1. User taps "Beleg scannen" in ContentView
2. Sheet opens with ReceiptScanView
3. User taps "Foto aufnehmen" or "Foto wählen"
4. Photo is selected/taken
5. App shows "Beleg wird analysiert..." with progress indicator
6. Receipt header appears with shop name and date
7. List of detected items appears
8. User reviews items:
   - Edit any item by tapping
   - Delete any item by swiping left
   - Edit shop name or date if needed
9. User taps "Speichern"
10. Confirmation alert shows number of saved purchases
11. Sheet dismisses, ContentView reloads products

### Edge Cases

- **No items detected**: Shows empty state with guidance
- **Photo load failure**: Error alert shown
- **Missing shop name on save**: Validation error shown
- **Empty items list on save**: Validation error shown

## Platform Considerations

### iOS-Specific

- Camera button available (`#if os(iOS)`)
- Uses UIImage for image handling
- PhotosPicker for library selection

### macOS

- No camera button (not supported)
- Only photo library selection
- Same UI otherwise

## Future Enhancements

### Phase 1 (Current)

- ✅ UI mockup complete
- ✅ Photo selection working
- ✅ Manual item editing
- ✅ Save to database

### Phase 2 (Next)

- [ ] Visual Intelligence API integration
- [ ] Actual OCR processing
- [ ] Confidence scores per item
- [ ] Suggested corrections

### Phase 3 (Future)

- [ ] Multiple receipt scanning (bulk)
- [ ] Receipt history/archive
- [ ] Receipt image storage
- [ ] Auto-categorization
- [ ] Receipt sharing

## Testing

### Manual Testing Checklist

- [ ] Take photo with camera (iOS)
- [ ] Select photo from library
- [ ] Edit item details
- [ ] Delete item
- [ ] Save with valid data
- [ ] Try to save without shop name (should error)
- [ ] Try to save with no items (should error)
- [ ] Cancel without saving
- [ ] Verify purchases appear in main view

### Unit Test Scenarios

```swift
// ReceiptScanViewModel Tests
- testLoadPhotoSuccess()
- testLoadPhotoFailure()
- testRemoveItem()
- testUpdateItem()
- testSavePurchasesSuccess()
- testSavePurchasesValidationErrors()
- testReset()
```

## Performance Considerations

- Image processing happens asynchronously
- Mock 2-second delay simulates API call
- SwiftData batch saves all purchases at once
- Product lookup optimized with FetchDescriptor

## Accessibility

- All buttons have proper labels
- Form fields have descriptive labels
- Lists support VoiceOver navigation
- Images have `.resizable()` and `.scaledToFit()`

---

**Status**: UI Complete, Visual Intelligence Integration Pending  
**Created**: 12. Oktober 2025  
**Author**: GitHub Copilot AI Assistant
