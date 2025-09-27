//
//  ProductNormalizationTests.swift
//  Alles-TeurerTests
//
//  Created by GitHub Copilot on 27.09.25.
//

import Testing
import Foundation
import SwiftData
@testable import Alles_Teurer

@available(iOS 26.0, *)
@Suite("Product Normalization Tests")
struct ProductNormalizationTests {
    
    // MARK: - Test Data
    
    private let testProductNames = [
        // Store brands
        ("Ja natürlich Bio Joghurt Natur 500g", "Joghurt"),
        ("Clever Erdäpfel mehlig 2kg", "Erdäpfel"),
        ("SPAR Premium Grana Padano gerieben", "Grana Padano"),
        ("BILLA Milch 3,5% 1L", "Milch"),
        
        // Brand products
        ("Bio Faschiertes gemischt 500g", "Faschiertes"),
        ("DKIH Paprika rot 1 Stk.", "Paprika"),
        ("Clever Jogh. 0.1%", "Joghurt"),
        ("Ja! Bio Süßkartoffel", "Süßkartoffel"),
        
        // Complex names
        ("Clever Blättert. div. Sor", "Blätterteig"),
        ("Österreichische Butter gesalzen 250g", "Butter"),
        ("Premium Apfelsaft naturtrüb 1L Flasche", "Apfelsaft")
    ]
    
    // MARK: - Tests
    
    @Test("LLM Product Normalization")
    func testLLMNormalization() async throws {
        // Create in-memory model context for testing
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Rechnungszeile.self, configurations: config)
        let context = ModelContext(container)
        
        // Add some existing normalized names to test consistency
        let existingItem1 = Rechnungszeile(
            Name: "Test Joghurt", 
            Price: 1.0, 
            Category: "Milchprodukte", 
            Shop: "Test", 
            Datum: Date(),
            NormalizedName: "Joghurt"
        )
        let existingItem2 = Rechnungszeile(
            Name: "Test Erdäpfel", 
            Price: 2.0, 
            Category: "Gemüse", 
            Shop: "Test", 
            Datum: Date(),
            NormalizedName: "Erdäpfel"
        )
        
        context.insert(existingItem1)
        context.insert(existingItem2)
        try context.save()
        
        // Create Rechnungserkennung instance with context
        let erkennung = Rechnungserkennung(modelContext: context)
        
        // Test normalization for each test case
        for (originalName, expectedPattern) in testProductNames {
            // Note: Since this depends on LLM, we can't guarantee exact matches
            // Instead, we test that normalization happens and follows patterns
            let normalizedName = await erkennung.testNormalizeProductNameWithLLM(
                originalName, 
                existingNormalizedNames: Set(["Joghurt", "Erdäpfel", "Milch", "Butter"])
            )
            
            // Validate that normalization occurred
            #expect(!normalizedName.isEmpty, "Normalized name should not be empty for: \(originalName)")
            #expect(normalizedName.count > 1, "Normalized name should be meaningful for: \(originalName)")
            
            // Validate that common patterns are removed
            #expect(!normalizedName.lowercased().contains("clever"), "Should remove 'Clever' brand from: \(originalName)")
            #expect(!normalizedName.lowercased().contains("ja natürlich"), "Should remove 'Ja natürlich' brand from: \(originalName)")
            #expect(!normalizedName.contains("kg"), "Should remove weight units from: \(originalName)")
            #expect(!normalizedName.contains("ml"), "Should remove volume units from: \(originalName)")
            #expect(!normalizedName.contains("500g"), "Should remove specific weight from: \(originalName)")
            
            print("✓ '\(originalName)' → '\(normalizedName)'")
        }
    }
    
    @Test("Common Product Types List")
    func testCommonProductTypes() {
        let erkennung = Rechnungserkennung()
        let commonTypes = erkennung.testGetCommonProductTypes()
        
        #expect(commonTypes.count == 20, "Should have exactly 20 common product types")
        #expect(commonTypes.contains("Milch"), "Should contain basic dairy product")
        #expect(commonTypes.contains("Brot"), "Should contain basic bakery product")
        #expect(commonTypes.contains("Erdäpfel"), "Should use Austrian term for potatoes")
        #expect(commonTypes.contains("Paradeiser"), "Should use Austrian term for tomatoes")
        
        // Check that all types are properly capitalized
        for type in commonTypes {
            #expect(type.first?.isUppercase == true, "Product type '\(type)' should start with uppercase")
        }
    }
    
    @Test("Database Context Integration")
    func testDatabaseContextIntegration() async throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Rechnungszeile.self, configurations: config)
        let context = ModelContext(container)
        
        // Add test data
        let testItems = [
            Rechnungszeile(Name: "Test1", Price: 1.0, Category: "Cat1", Shop: "Shop1", Datum: Date(), NormalizedName: "Milch"),
            Rechnungszeile(Name: "Test2", Price: 2.0, Category: "Cat2", Shop: "Shop2", Datum: Date(), NormalizedName: "Brot"),
            Rechnungszeile(Name: "Test3", Price: 3.0, Category: "Cat3", Shop: "Shop3", Datum: Date(), NormalizedName: "Joghurt"),
        ]
        
        for item in testItems {
            context.insert(item)
        }
        try context.save()
        
        let erkennung = Rechnungserkennung(modelContext: context)
        let existingNames = await erkennung.testGetExistingNormalizedNames()
        
        #expect(existingNames.count == 3, "Should load all normalized names from database")
        #expect(existingNames.contains("Milch"), "Should contain Milch")
        #expect(existingNames.contains("Brot"), "Should contain Brot") 
        #expect(existingNames.contains("Joghurt"), "Should contain Joghurt")
    }
}

// MARK: - Test Extension to access internal methods

extension Rechnungserkennung {
    // Expose internal methods for testing
    internal func testGetCommonProductTypes() -> [String] {
        return getCommonProductTypes()
    }
    
    internal func testGetExistingNormalizedNames() async -> Set<String> {
        return await getExistingNormalizedNames()
    }
    
    internal func testNormalizeProductNameWithLLM(_ productName: String, existingNormalizedNames: Set<String>) async -> String {
        return await normalizeProductNameWithLLM(productName, existingNormalizedNames: existingNormalizedNames)
    }
}