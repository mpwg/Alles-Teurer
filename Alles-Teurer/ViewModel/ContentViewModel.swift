//
//  ContentViewModel.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
@Observable
final class ContentViewModel {
    private let modelContext: ModelContext
    var selectedProductName: String?
    var items: [Rechnungszeile] = []
    var isLoading = false
    var errorMessage: String?

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        Task {
            await loadItems()
        }
    }

    var uniqueProductNames: [String] {
        Array(Set(items.map { $0.NormalizedName })).sorted()
    }

    func items(for productName: String) -> [Rechnungszeile] {
        items.filter { $0.Name == productName }
            .sorted { $0.Datum > $1.Datum }  // Most recent first
    }

    func loadItems() async {
        isLoading = true
        errorMessage = nil

        do {
            let descriptor = FetchDescriptor<Rechnungszeile>(
                sortBy: [SortDescriptor(\.Datum, order: .reverse)]
            )
            items = try modelContext.fetch(descriptor)
        } catch {
            errorMessage = "Failed to load items: \(error.localizedDescription)"
            print("Failed to load items: \(error)")
        }

        isLoading = false
    }

    func addItem() async {
        let newItem = Rechnungszeile(
            Name: "Name",
            Price: 1.23,
            Category: "Category",
            Shop: "Shop",
            Datum: Date.now,
            NormalizedName: "Name",
            PricePerUnit: 2.34
        )
        modelContext.insert(newItem)

        do {
            try modelContext.save()
            await loadItems()  // Refresh the data
        } catch {
            errorMessage = "Failed to save item: \(error.localizedDescription)"
            print("Failed to save item: \(error)")
        }
    }

    func deleteItems(_ items: [Rechnungszeile]) async {
        for item in items {
            modelContext.delete(item)
        }

        do {
            try modelContext.save()
            await loadItems()  // Refresh the data
        } catch {
            errorMessage = "Failed to delete items: \(error.localizedDescription)"
            print("Failed to delete items: \(error)")
        }
    }

    func deleteAllItems() async {
        isLoading = true
        errorMessage = nil

        do {
            // Fetch all items and delete them
            let descriptor = FetchDescriptor<Rechnungszeile>()
            let allItems = try modelContext.fetch(descriptor)

            for item in allItems {
                modelContext.delete(item)
            }

            try modelContext.save()
            await loadItems()  // Refresh the data
        } catch {
            errorMessage = "Failed to delete all items: \(error.localizedDescription)"
            print("Failed to delete all items: \(error)")
        }

        isLoading = false
    }

    func generateTestData() async {
        isLoading = true
        errorMessage = nil
        print("generateTestData() started")
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
            ("Paprika rot 1kg", "Gemüse", Decimal(3.99)),
        ]

        let austrianShops = [
            "Billa", "Spar", "Merkur", "Interspar", "Hofer", "Penny", "MPreis", "Nah&Frisch",
        ]

        // Generate 15-25 random items with some duplicates for better testing
        let numberOfItems = Int.random(in: 15...25)

        for _ in 0..<numberOfItems {
            let randomItem = testItems.randomElement()!
            let randomShop = austrianShops.randomElement()!

            // Generate random date within last 90 days
            let randomDays = Int.random(in: 0...90)
            let randomDate =
                Calendar.current.date(byAdding: .day, value: -randomDays, to: Date.now) ?? Date.now

            // Add some price variation (±20%)
            let basePrice = randomItem.2
            let variation = Decimal(Double.random(in: 0.8...1.2))
            let finalPrice = (basePrice * variation).rounded(2)

            let newItem = Rechnungszeile(
                Name: randomItem.0,
                Price: finalPrice,
                Category: randomItem.1,
                Shop: randomShop,
                Datum: randomDate,
                NormalizedName: randomItem.0,
                PricePerUnit: finalPrice
            )

            modelContext.insert(newItem)
        }

        do {
            try modelContext.save()
            await loadItems()  // Refresh the data
        } catch {
            errorMessage = "Failed to save test data: \(error.localizedDescription)"
            print("Failed to save test data: \(error)")
        }

        isLoading = false
    }
}

// Extension to help with decimal rounding
extension Decimal {
    fileprivate func rounded(_ scale: Int) -> Decimal {
        var result = Decimal()
        var value = self
        NSDecimalRound(&result, &value, scale, .bankers)
        return result
    }
}
