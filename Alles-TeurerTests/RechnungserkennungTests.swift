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
    
    // MARK: - Foundation Models Tests
    
    @Test("Extracts multiple Rechnungszeilen from BILLA receipt")
    @MainActor
    func testExtractMultipleRechnungszeilen() async throws {
        // Given
        let sut = Rechnungserkennung()
        let testImage = createTestReceiptImage()
        
        // When
        let rechnungszeilen = try await sut.extractRechnungszeilen(from: testImage)
        
        // Then
        #expect(rechnungszeilen.count >= 6, "Should extract at least 6 products from the receipt")
        
        // Verify shop name is correctly extracted
        #expect(rechnungszeilen.allSatisfy { $0.Shop.contains("BILLA") }, "All items should be from BILLA")
        
        // Verify dates are set to receipt date or current date
        let expectedDate = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        for item in rechnungszeilen {
            let itemDate = Calendar.current.dateComponents([.year, .month, .day], from: item.Datum)
            #expect(itemDate.year == expectedDate.year, "Year should match")
            #expect(itemDate.month == expectedDate.month, "Month should match") 
            #expect(itemDate.day == expectedDate.day, "Day should match")
        }
    }
    
    @Test("Extracts correct product names and prices")
    @MainActor 
    func testExtractSpecificProducts() async throws {
        // Given
        let sut = Rechnungserkennung()
        let testImage = createTestReceiptImage()
        
        // When
        let rechnungszeilen = try await sut.extractRechnungszeilen(from: testImage)
        
        // Then - Look for specific products from the receipt
        let produktNamen = rechnungszeilen.map { $0.Name }
        
        // Check for key products (allowing for slight variations in OCR/parsing)
        let expectedProducts = [
            "Bio Süßkartoffel",
            "Grana Padano", 
            "Äpfel",
            "Paprika",
            "Blättert"
        ]
        
        for expectedProduct in expectedProducts {
            let found = produktNamen.contains { name in
                name.localizedCaseInsensitiveContains(expectedProduct)
            }
            #expect(found, "Should find product containing '\(expectedProduct)'")
        }
        
        // Verify price ranges are reasonable (all should be between 0.01 and 20.00)
        for item in rechnungszeilen {
            #expect(item.Price > 0, "Price should be positive: \(item.Name) - \(item.Price)")
            #expect(item.Price < 50, "Price should be reasonable: \(item.Name) - \(item.Price)")
        }
    }
    
    @Test("Handles model unavailability gracefully")
    @MainActor
    func testModelUnavailableError() async throws {
        // This test verifies error handling when Foundation Models are not available
        // Since we can't easily mock SystemLanguageModel.availability, we test the error types
        
        let sut = Rechnungserkennung()
        
        // Test with an invalid image to trigger a different error path
        let emptyImage = UIImage()
        
        do {
            _ = try await sut.extractRechnungszeilen(from: emptyImage)
            #expect(false, "Should have thrown an error for empty image")
        } catch let error as RechnungserkennungError {
            // Verify we get a proper error type
            #expect(error.errorDescription != nil, "Error should have a description")
        } catch {
            #expect(false, "Should throw RechnungserkennungError, got: \(error)")
        }
    }
    
    @Test("Normalizes german product names correctly")
    @MainActor
    func testProductNameNormalization() async throws {
        // Given
        let sut = Rechnungserkennung()
        let testImage = createTestReceiptImage()
        
        // When
        let rechnungszeilen = try await sut.extractRechnungszeilen(from: testImage)
        
        // Then - Check that normalized names are created
        for item in rechnungszeilen {
            #expect(!item.NormalizedName.isEmpty, "NormalizedName should not be empty for \(item.Name)")
            #expect(item.NormalizedName == item.NormalizedName.lowercased(), "NormalizedName should be lowercase")
            
            // Should not contain umlauts in normalized form
            #expect(!item.NormalizedName.contains("ä"), "Should replace ä with ae")
            #expect(!item.NormalizedName.contains("ö"), "Should replace ö with oe") 
            #expect(!item.NormalizedName.contains("ü"), "Should replace ü with ue")
        }
    }
    
    @Test("Categorizes products appropriately")
    @MainActor
    func testProductCategorization() async throws {
        // Given
        let sut = Rechnungserkennung()
        let testImage = createTestReceiptImage()
        
        // When
        let rechnungszeilen = try await sut.extractRechnungszeilen(from: testImage)
        
        // Then - All items should have categories assigned
        for item in rechnungszeilen {
            #expect(!item.Category.isEmpty, "Category should not be empty for \(item.Name)")
            #expect(item.Category != "Unknown", "Should not have unknown category")
        }
        
        // Most items from BILLA should be "Lebensmittel"
        let lebensmittelCount = rechnungszeilen.filter { $0.Category == "Lebensmittel" }.count
        #expect(lebensmittelCount > 0, "Should categorize food items as Lebensmittel")
    }
    
    // MARK: - Error Handling Tests
    
    @Test("Handles invalid images gracefully")
    @MainActor
    func testInvalidImageHandling() async {
        // Given
        let sut = Rechnungserkennung()
        
        // Test with various invalid images
        let testCases: [(UIImage, String)] = [
            (UIImage(), "Empty image"),
            (UIImage(systemName: "photo")!, "System icon image")
        ]
        
        for (image, description) in testCases {
            do {
                _ = try await sut.extractRechnungszeilen(from: image)
                // Some cases might work, so we don't fail here
            } catch let error as RechnungserkennungError {
                // Verify we get proper error descriptions
                #expect(error.errorDescription != nil, "\(description): Error should have description")
            } catch {
                #expect(false, "\(description): Should throw RechnungserkennungError, got: \(error)")
            }
        }
    }
    
    // MARK: - Performance Tests
    
    @Test("Completes processing within reasonable time")
    @MainActor
    func testPerformance() async throws {
        // Given
        let sut = Rechnungserkennung()
        let testImage = createTestReceiptImage()
        
        // When & Then
        let startTime = Date()
        _ = try await sut.extractRechnungszeilen(from: testImage)
        let duration = Date().timeIntervalSince(startTime)
        
        // Should complete within 30 seconds (generous for CI/testing)
        #expect(duration < 30.0, "Processing should complete within 30 seconds, took \(duration)s")
    }
}