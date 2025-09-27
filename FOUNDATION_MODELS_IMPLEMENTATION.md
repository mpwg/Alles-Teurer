# Foundation Models Receipt Recognition Implementation

## Overview

I have successfully implemented a complete receipt recognition system for the Alles-Teurer iOS app that uses Apple's Foundation Models framework to extract `Rechnungszeilen` (receipt line items) from receipt images.

## Key Features

### ✅ Foundation Models Integration

- **Smart Receipt Parsing**: Uses Apple's on-device language model to intelligently parse receipt text
- **Structured Data Extraction**: Extracts multiple receipt line items from a single receipt image
- **German Language Support**: Optimized for Austrian/German receipts with proper localization
- **Privacy-First**: All processing happens on-device using Apple Intelligence

### ✅ Advanced OCR Processing

- **Vision Framework Integration**: High-accuracy text extraction from receipt images
- **Multi-language Support**: Configured for German and English text recognition
- **Optimized Settings**: Uses accurate recognition level with language correction

### ✅ Intelligent Data Processing

- **Multiple Product Extraction**: Extracts all products from a single receipt, not just one
- **Smart Categorization**: Automatically categorizes products (Lebensmittel, Drogerie, etc.)
- **Price Normalization**: Handles various price formats (€, EUR, comma/decimal separators)
- **Product Name Normalization**: Creates searchable normalized product names
- **Shop Recognition**: Identifies store names from receipt headers

## Implementation Details

### Core Components

1. **`Rechnungserkennung.swift`** - Main service class

   - Uses `SystemLanguageModel` for intelligent parsing
   - Handles model availability checking
   - Comprehensive error handling with localized messages
   - Structured JSON response parsing

2. **Updated `ScanReceiptViewModel.swift`**

   - Integrates the new Foundation Models service
   - Supports multiple extracted line items
   - Maintains backward compatibility
   - Enhanced error handling

3. **Updated `ScanReceiptView.swift`**

   - Shows preview of extracted products
   - Batch saving of multiple line items
   - Better user feedback and status displays

4. **Comprehensive Tests**
   - Full test suite using Swift Testing framework
   - Tests for various receipt formats
   - Error handling validation
   - Performance testing
   - Sample image generation for testing

### Key Features of the Implementation

#### Smart Prompting Strategy

```swift
let instructions = """
Du bist ein Experte für die Analyse von deutschen Kassenbons und Rechnungen.
Deine Aufgabe ist es, strukturierte Daten aus Rechnungstexten zu extrahieren.

Befolge diese Regeln:
- Extrahiere ALLE Produkte/Artikel aus der Rechnung
- Ignoriere Rabatte, Pfand und Gesamtsummen
- Verwende deutsche Produktnamen wie sie auf der Rechnung stehen
- Kategorisiere Produkte nach österreichischen/deutschen Standards
- Extrahiere Einzelpreise, nicht Gesamtsummen
- Behandle Mengenangaben (kg, Stk, etc.) korrekt

Antworte ausschließlich mit gültigem JSON ohne zusätzlichen Text.
"""
```

#### Robust Error Handling

- Model availability checking (device compatibility, Apple Intelligence enabled)
- Vision Framework error handling
- Foundation Models parsing errors
- JSON decoding error recovery
- User-friendly German error messages

#### Data Structure

```swift
struct ParsedReceiptData: Codable {
    let shopName: String
    let date: Date
    let lineItems: [ReceiptLineItem]
}

struct ReceiptLineItem: Codable {
    let productName: String
    let price: Decimal
    let category: String
    let quantity: String?
    let pricePerUnit: Decimal?
}
```

## Usage Example

```swift
let rechnungserkennung = Rechnungserkennung()

// Extract multiple line items from receipt image
let rechnungszeilen = try await rechnungserkennung.extractRechnungszeilen(from: receiptImage)

// Results in multiple Rechnungszeile objects:
// - Ja! Bio Süßkartoffel (7.58€, Obst & Gemüse, BILLA)
// - Clever Grana Padano (6.29€, Milchprodukte, BILLA)
// - Clever Äpfel 2kg (3.79€, Obst & Gemüse, BILLA)
// - etc.
```

## Testing

The implementation includes comprehensive tests covering:

- Multi-product extraction from BILLA receipt
- Price and product name accuracy
- Shop name and date extraction
- German text normalization
- Product categorization
- Error handling scenarios
- Performance benchmarks

## Requirements

- **iOS 26.0+** (for Foundation Models framework)
- **Apple Intelligence enabled** on device
- **Compatible devices** (iPhone 15 Pro/Pro Max or later, iPad with M1 or later)

## Integration Notes

- The new system is fully integrated into the existing `ScanReceiptView`
- Maintains backward compatibility with the legacy `createRechnungszeile` method
- Uses the same `Rechnungszeile` SwiftData model
- Follows established German naming conventions
- Preserves existing UI/UX patterns

This implementation significantly enhances the receipt scanning capabilities by leveraging Apple's most advanced on-device AI technology while maintaining privacy and providing accurate, structured data extraction from German/Austrian receipts.
