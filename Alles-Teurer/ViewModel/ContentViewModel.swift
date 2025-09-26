//
//  ContentViewModel.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//

import SwiftUI
import SwiftData

@MainActor
@Observable
final class ContentViewModel {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func addItem() {
        let newItem = Rechnungszeile(
            Name: "Name", 
            Price: 1.23, 
            Category: "Category", 
            Shop: "Shop", 
            Datum: Date.now
        )
        modelContext.insert(newItem)
        
        do {
            try modelContext.save()
        } catch {
            // Handle save error - in a production app, you might want to show an alert
            print("Failed to save item: \(error)")
        }
    }
    
    func deleteItems(at offsets: IndexSet, from items: [Rechnungszeile]) {
        for index in offsets {
            modelContext.delete(items[index])
        }
        
        do {
            try modelContext.save()
        } catch {
            // Handle save error
            print("Failed to delete items: \(error)")
        }
    }
    
    func generateTestData() {
        let testItems: [(String, String, Decimal)] = [
            ("Vollmilch 1L", "Milchprodukte", Decimal(1.29)),
            ("Semmel 6 Stück", "Backwaren", Decimal(2.40)),
            ("Leberkäse 200g", "Fleisch & Wurst", Decimal(3.99)),
            ("Erdäpfel 2kg", "Gemüse", Decimal(2.99)),
            ("Kaisersemmel", "Backwaren", Decimal(0.55)),
            ("Wiener Schnitzel 400g", "Fleisch & Wurst", Decimal(8.99)),
            ("Apfelmost 1L", "Getränke", Decimal(1.99)),
            ("Mozarella 125g", "Milchprodukte", Decimal(2.29)),
            ("Schwarzbrot", "Backwaren", Decimal(2.89)),
            ("Tomaten 500g", "Gemüse", Decimal(2.49)),
            ("Gurken 1 Stück", "Gemüse", Decimal(1.19)),
            ("Bergkäse 200g", "Milchprodukte", Decimal(4.99)),
            ("Speck 150g", "Fleisch & Wurst", Decimal(3.49)),
            ("Kaffee Melange", "Getränke", Decimal(4.20)),
            ("Sachertorte", "Süßwaren", Decimal(6.50)),
            ("Almdudler 0,5L", "Getränke", Decimal(1.79)),
            ("Leberwurst 100g", "Fleisch & Wurst", Decimal(2.69)),
            ("Topfen 250g", "Milchprodukte", Decimal(1.89)),
            ("Knödelbrot", "Backwaren", Decimal(1.99)),
            ("Paprika rot 1kg", "Gemüse", Decimal(3.99))
        ]
        
        let austrianShops = ["Billa", "Spar", "Merkur", "Interspar", "Hofer", "Penny", "MPreis", "Nah&Frisch"]
        
        // Generate 5-10 random items
        let numberOfItems = Int.random(in: 5...10)
        
        for _ in 0..<numberOfItems {
            let randomItem = testItems.randomElement()!
            let randomShop = austrianShops.randomElement()!
            
            // Generate random date within last 30 days
            let randomDays = Int.random(in: 0...30)
            let randomDate = Calendar.current.date(byAdding: .day, value: -randomDays, to: Date.now) ?? Date.now
            
            // Add some price variation (±20%)
            let basePrice = randomItem.2
            let variation = Decimal(Double.random(in: 0.8...1.2))
            let finalPrice = (basePrice * variation).rounded(2)
            
            let newItem = Rechnungszeile(
                Name: randomItem.0,
                Price: finalPrice,
                Category: randomItem.1,
                Shop: randomShop,
                Datum: randomDate
            )
            
            modelContext.insert(newItem)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save test data: \(error)")
        }
    }
}

// Extension to help with decimal rounding
private extension Decimal {
    func rounded(_ scale: Int) -> Decimal {
        var result = Decimal()
        var value = self
        NSDecimalRound(&result, &value, scale, .bankers)
        return result
    }
}