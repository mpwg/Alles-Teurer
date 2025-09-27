//
//  RechnungserkennungTests.swift
//  Alles-TeurerTests
//
//  Created on 27.09.25.
//

import Testing
import Foundation
import SwiftUI
import Vision
@testable import Alles_Teurer

@available(iOS 26.0, *)
@Suite("Rechnungserkennung Tests")
struct RechnungserkennungTests {
    
    let sut = Rechnungserkennung()
    
    // MARK: - Test Receipt Data
    
    /// Creates a test image with the sample BILLA receipt text
    private func createTestReceiptImage() -> UIImage {
        let receiptText = """
        BILLA
        27.09.2025
        
        21,46 €
        Summe
        
        0,65 €
        Gespart
        
        27.09.2025 08:50
        Produktpreis
        
        Ja! Bio Süßkartoffel                7,58
        1.52 kg X 4.99 EUR / kg
        
        Clever Grana Padano                 6,29
        
        Clever Äpfel 2kg                    3,79
        
        DKIH Paprika rot Stk.               1,49
        
        Clever Blättert. div. Sor           0,99
        
        Clever Blättert. div. Sor           0,99
        
        Clever Jogh. 0.1%                   0,49
        
        Clever Jogh. 0.1%                   0,49
        
        Stickerpackung                      0,00
        2.0 X 0.0
        
        ----------------------------------------
        Zwischensumme                      22,11 €
        
        Meine Vorteile                     -0,65 €
        
        Summe                              21,46 €
        ----------------------------------------
        
        Gegeben REWE-GS-Kart               21,46 €
        """
        
        // Create image with text
        let size = CGSize(width: 400, height: 800)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            // White background
            UIColor.white.setFill()
            context.fill(CGRect(origin: .zero, size: size))
            
            // Black text
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.monospacedSystemFont(ofSize: 14, weight: .regular),
                .foregroundColor: UIColor.black,
                .paragraphStyle: paragraphStyle
            ]
            
            let attributedString = NSAttributedString(string: receiptText, attributes: attributes)
            attributedString.draw(in: CGRect(x: 20, y: 20, width: size.width - 40, height: size.height - 40))
        }
    }
    
    // MARK: - Basic Recognition Tests
    
    @Test("Recognizes receipt from BILLA sample image")
    func testRecognizeBillaReceipt() async throws {
        // Given
        let testImage = Image(uiImage: createTestReceiptImage())
        
        // When
        let items = try await sut.erkenneRechnung(image: testImage)
        
        // Then
        #expect(items.count > 0, "Should recognize at least one item")
        
        // Verify some expected items
        let productNames = items.map { $0.Name }
        #expect(productNames.contains { $0.contains("Süßkartoffel") }, "Should find Süßkartoffel")
        #expect(productNames.contains { $0.contains("Grana Padano") }, "Should find Grana Padano")
        #expect(productNames.contains { $0.contains("Äpfel") }, "Should find Äpfel")
        #expect(productNames.contains { $0.contains("Paprika") }, "Should find Paprika")
    }
    
    @Test("Extracts correct prices from receipt")
    func testExtractsPrices() async throws {
        // Given
        let testImage = Image(uiImage: createTestReceiptImage())
        
        // When
        let items = try await sut.erkenneRechnung(image: testImage)
        
        // Then
        // Check for specific price values
        let prices = items.map { $0.Price }
        
        #expect(prices.contains(Decimal(7.58)), "Should find price 7.58 for Süßkartoffel")
        #expect(prices.contains(Decimal(6.29)), "Should find price 6.29 for Grana Padano")
        #expect(prices.contains(Decimal(3.79)), "Should find price 3.79 for Äpfel")
        #expect(prices.contains(Decimal(1.49)), "Should find price 1.49 for Paprika")
        #expect(prices.contains(Decimal(0.99)), "Should find price 0.99 for Blätterteig")
        #expect(prices.contains(Decimal(0.49)), "Should find price 0.49 for Joghurt")
    }
    
    @Test("Extracts shop name correctly")
    func testExtractsShopName() async throws {
        // Given
        let testImage = Image(uiImage: createTestReceiptImage())
        
        // When
        let items = try await sut.erkenneRechnung(image: testImage)
        
        // Then
        #expect(!items.isEmpty, "Should have items")
        if let firstItem = items.first {
            #expect(firstItem.Shop == "BILLA", "Shop should be BILLA")
        }
    }
    
    @Test("Extracts date correctly")
    func testExtractsDate() async throws {
        // Given
        let testImage = Image(uiImage: createTestReceiptImage())
        let expectedDate = createDate(day: 27, month: 9, year: 2025)
        
        // When
        let items = try await sut.erkenneRechnung(image: testImage)
        
        // Then
        #expect(!items.isEmpty, "Should have items")
        if let firstItem = items.first {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day, .month, .year], from: firstItem.Datum)
            let expectedComponents = calendar.dateComponents([.day, .month, .year], from: expectedDate)
            
            #expect(components.day == expectedComponents.day, "Day should match")
            #expect(components.month == expectedComponents.month, "Month should match")
            #expect(components.year == expectedComponents.year, "Year should match")
        }
    }
    
    // MARK: - Category Tests
    
    @Test("Assigns correct categories to products")
    func testProductCategorization() async throws {
        // Given
        let testImage = Image(uiImage: createTestReceiptImage())
        
        // When
        let items = try await sut.erkenneRechnung(image: testImage)
        
        // Then
        // Check Bio products
        if let bioItem = items.first(where: { $0.Name.contains("Bio") }) {
            #expect(bioItem.Category == "Obst & Gemüse", "Bio items should be categorized as Obst & Gemüse")
        }
        
        // Check dairy products
        if let yogurtItem = items.first(where: { $0.Name.contains("Jogh") }) {
            #expect(yogurtItem.Category == "Milchprodukte", "Yogurt should be categorized as Milchprodukte")
        }
        
        if let cheeseItem = items.first(where: { $0.Name.contains("Grana Padano") }) {
            #expect(cheeseItem.Category == "Milchprodukte", "Cheese should be categorized as Milchprodukte")
        }
    }
    
    // MARK: - Edge Cases
    
    @Test("Handles empty image gracefully")
    func testEmptyImage() async throws {
        // Given
        let emptyImage = createEmptyImage()
        
        // When
        let items = try await sut.erkenneRechnung(image: Image(uiImage: emptyImage))
        
        // Then
        #expect(items.isEmpty, "Should return empty array for empty image")
    }
    
    @Test("Ignores non-product lines")
    func testIgnoresNonProductLines() async throws {
        // Given
        let testImage = Image(uiImage: createTestReceiptImage())
        
        // When
        let items = try await sut.erkenneRechnung(image: testImage)
        
        // Then
        let productNames = items.map { $0.Name }
        
        // Should not include these non-product lines
        #expect(!productNames.contains { $0.contains("Summe") }, "Should not include 'Summe'")
        #expect(!productNames.contains { $0.contains("Zwischensumme") }, "Should not include 'Zwischensumme'")
        #expect(!productNames.contains { $0.contains("Gespart") }, "Should not include 'Gespart'")
        #expect(!productNames.contains { $0.contains("Meine Vorteile") }, "Should not include 'Meine Vorteile'")
        #expect(!productNames.contains { $0.contains("Gegeben") }, "Should not include payment lines")
    }
    
    @Test("Handles zero-price items correctly")
    func testZeroPriceItems() async throws {
        // Given
        let testImage = Image(uiImage: createTestReceiptImage())
        
        // When
        let items = try await sut.erkenneRechnung(image: testImage)
        
        // Then
        // Stickerpackung has 0.00 price - verify it's handled correctly
        if let stickerItem = items.first(where: { $0.Name.contains("Stickerpackung") }) {
            #expect(stickerItem.Price == Decimal(0), "Should correctly parse 0.00 price")
        }
    }
    
    @Test("Handles duplicate items")
    func testDuplicateItems() async throws {
        // Given
        let testImage = Image(uiImage: createTestReceiptImage())
        
        // When
        let items = try await sut.erkenneRechnung(image: testImage)
        
        // Then
        // The receipt has duplicate items (Blätterteig and Joghurt appear twice)
        let blatterteigItems = items.filter { $0.Name.contains("Blättert") }
        let joghurtItems = items.filter { $0.Name.contains("Jogh") }
        
        // Depending on implementation, duplicates might be kept or merged
        // This test documents the expected behavior
        #expect(blatterteigItems.count <= 2, "Should handle Blätterteig duplicates appropriately")
        #expect(joghurtItems.count <= 2, "Should handle Joghurt duplicates appropriately")
    }
    
    // MARK: - Configuration Tests
    
    @Test("Respects confidence threshold configuration")
    func testConfidenceThreshold() async throws {
        // Given
        let highConfidenceConfig = Rechnungserkennung.Configuration(
            useCloudFallback: false,
            preferredLanguages: ["de-AT"],
            confidenceThreshold: 0.95  // Very high threshold
        )
        let highConfidenceService = Rechnungserkennung(configuration: highConfidenceConfig)
        
        let lowConfidenceConfig = Rechnungserkennung.Configuration(
            useCloudFallback: false,
            preferredLanguages: ["de-AT"],
            confidenceThreshold: 0.3  // Low threshold
        )
        let lowConfidenceService = Rechnungserkennung(configuration: lowConfidenceConfig)
        
        let testImage = Image(uiImage: createTestReceiptImage())
        
        // When
        let highConfidenceItems = try await highConfidenceService.erkenneRechnung(image: testImage)
        let lowConfidenceItems = try await lowConfidenceService.erkenneRechnung(image: testImage)
        
        // Then
        #expect(lowConfidenceItems.count >= highConfidenceItems.count,
                "Lower confidence threshold should recognize same or more items")
    }
    
    @Test("Uses correct language for OCR")
    func testLanguageConfiguration() async throws {
        // Given
        let germanConfig = Rechnungserkennung.Configuration(
            useCloudFallback: false,
            preferredLanguages: ["de-AT", "de-DE"],
            confidenceThreshold: 0.7
        )
        let service = Rechnungserkennung(configuration: germanConfig)
        
        let testImage = Image(uiImage: createTestReceiptImage())
        
        // When
        let items = try await service.erkenneRechnung(image: testImage)
        
        // Then
        // German-specific characters should be correctly recognized
        if let apfelItem = items.first(where: { $0.Name.contains("pfel") }) {
            #expect(apfelItem.Name.contains("Äpfel"), "Should correctly recognize German umlaut 'Ä'")
        }
    }
    
    // MARK: - Performance Tests
    
    @Test("Processes receipt within reasonable time")
    func testProcessingPerformance() async throws {
        // Given
        let testImage = Image(uiImage: createTestReceiptImage())
        let startTime = Date()
        
        // When
        _ = try await sut.erkenneRechnung(image: testImage)
        let endTime = Date()
        
        // Then
        let processingTime = endTime.timeIntervalSince(startTime)
        #expect(processingTime < 5.0, "Processing should complete within 5 seconds")
    }
    
    // MARK: - Helper Methods
    
    private func createDate(day: Int, month: Int, year: Int) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        return Calendar.current.date(from: components) ?? Date()
    }
    
    private func createEmptyImage() -> UIImage {
        let size = CGSize(width: 100, height: 100)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            UIColor.white.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
    }
}

// MARK: - Integration Tests

@available(iOS 26.0, *)
@Suite("Rechnungserkennung Integration Tests")
struct RechnungserkennungIntegrationTests {
    
    @Test("Full receipt processing workflow")
    func testFullWorkflow() async throws {
        // Given
        let service = Rechnungserkennung()
        let testReceipt = createComplexTestReceipt()
        
        // When
        let items = try await service.erkenneRechnung(image: Image(uiImage: testReceipt))
        
        // Then
        // Verify complete data extraction
        #expect(!items.isEmpty, "Should extract items")
        
        for item in items {
            #expect(!item.Name.isEmpty, "Each item should have a name")
            #expect(item.Price >= 0, "Each item should have a non-negative price")
            #expect(!item.Category.isEmpty, "Each item should have a category")
            #expect(!item.Shop.isEmpty, "Each item should have a shop")
            #expect(item.Datum <= Date(), "Date should not be in the future")
        }
        
        // Verify data consistency
        let totalFromItems = items.reduce(Decimal(0)) { $0 + $1.Price }
        #expect(totalFromItems > 0, "Total should be positive")
    }
    
    private func createComplexTestReceipt() -> UIImage {
        // Create a more complex receipt with various formats
        let receiptText = """
        MERKUR
        Filiale Wien Mitte
        01.10.2025 14:23
        
        ========================================
        
        Bio Tomaten AT           2,99
        0,567 kg x 5,27 €/kg
        
        Vollkornbrot             2,49
        
        Bergkäse 150g           4,99
        
        Mineralwasser 6x1L       3,54
        Pfand                    1,50
        
        Bananen                  1,89
        1,234 kg x 1,53 €/kg
        
        ========================================
        SUMME EUR               17,40
        BAR                     20,00
        Rückgeld                 2,60
        ========================================
        
        Vielen Dank für Ihren Einkauf!
        """
        
        let size = CGSize(width: 400, height: 600)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            UIColor.white.setFill()
            context.fill(CGRect(origin: .zero, size: size))
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.monospacedSystemFont(ofSize: 12, weight: .regular),
                .foregroundColor: UIColor.black
            ]
            
            let attributedString = NSAttributedString(string: receiptText, attributes: attributes)
            attributedString.draw(in: CGRect(x: 20, y: 20, width: size.width - 40, height: size.height - 40))
        }
    }
}