//
//  ContentViewModel.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//

import Foundation
import SwiftData
import SwiftUI
import UniformTypeIdentifiers

@MainActor
@Observable
final class ContentViewModel {
    let modelContext: ModelContext
    var selectedProductName: String?
    var items: [Rechnungszeile] = []
    var errorMessage: String?
    var showingAddSheet = false
    var showingScanSheet = false
    var showingDeleteAllConfirmation = false
    var showingEditSheet = false
    var itemToEdit: Rechnungszeile?
    #if os(iOS)
    var editMode: EditMode = .inactive
    #else
    var isEditing: Bool = false
    #endif

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        // Don't load data here to avoid state modification during view update
        // Data will be loaded via updateItems() called from the view
    }
    
    func updateItems(_ newItems: [Rechnungszeile]) {
        items = newItems
    }

    var uniqueProductNames: [String] {
        Array(Set(items.map { $0.NormalizedName })).sorted()
    }
    
    var productGroups: [String: [Rechnungszeile]] {
        Dictionary(grouping: items) { $0.NormalizedName }
    }

    func items(for productName: String) -> [Rechnungszeile] {
        items.filter { $0.NormalizedName == productName }
            .sorted { $0.Datum > $1.Datum }  // Most recent first
    }

    // Price analysis for highlighting highest and lowest prices
    var priceAnalysis: (highest: Rechnungszeile?, lowest: Rechnungszeile?) {
        guard !items.isEmpty else { return (nil, nil) }

        let highest = items.max { $0.Price < $1.Price }
        let lowest = items.min { $0.Price < $1.Price }

        return (highest, lowest)
    }



    func addItem() async {
        // This method is now a placeholder for quick-add (could be expanded)
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
            // Items will be automatically updated via @Query in ContentView
        } catch {
            errorMessage = "Failed to save item: \(error.localizedDescription)"
            print("Failed to save item: \(error)")
        }
        showingAddSheet = false
    }

    func deleteItems(_ items: [Rechnungszeile]) async {
        for item in items {
            modelContext.delete(item)
        }
        do {
            try modelContext.save()
            // Items will be automatically updated via @Query in ContentView
        } catch {
            errorMessage = "Failed to delete items: \(error.localizedDescription)"
            print("Failed to delete items: \(error)")
        }
        editMode = .inactive
    }

    func deleteAllItems() async {
        errorMessage = nil

        do {
            // Fetch all items and delete them
            let descriptor = FetchDescriptor<Rechnungszeile>()
            let allItems = try modelContext.fetch(descriptor)

            for item in allItems {
                modelContext.delete(item)
            }

            try modelContext.save()
            // Items will be automatically updated via @Query in ContentView
        } catch {
            errorMessage = "Failed to delete all items: \(error.localizedDescription)"
            print("Failed to delete all items: \(error)")
        }
    }
    
    func updateItem(_ updatedItem: Rechnungszeile) async {
        errorMessage = nil

        do {
            // The item is already updated in-place via SwiftData
            try modelContext.save()
            showingEditSheet = false
            itemToEdit = nil
        } catch {
            errorMessage = "Failed to update item: \(error.localizedDescription)"
            print("Failed to update item: \(error)")
        }
    }

    func generateTestData() async {
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
            // Items will be automatically updated via @Query in ContentView
        } catch {
            errorMessage = "Failed to save test data: \(error.localizedDescription)"
            print("Failed to save test data: \(error)")
        }
    }
    
    // MARK: - CSV Export
    
    /// Exports all Rechnungszeilen to CSV format
    /// - Returns: CSV content as Data
    func exportCSV() async -> Data? {
        errorMessage = nil
        
        // Use the items already provided by @Query instead of fetching again
        let csvContent = generateCSVContent(from: items)
        return csvContent.data(using: .utf8)
    }
    
    /// Generates CSV content from Rechnungszeilen array
    private func generateCSVContent(from items: [Rechnungszeile]) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "de_AT")
        
        var csvContent = ""
        
        // CSV Header (German column names for Austrian market)
        csvContent += "Datum,Produktname,Normalisierter Name,Preis,Preis pro Einheit,Kategorie,Geschäft,ID\n"
        
        // CSV Rows
        for item in items {
            let formattedDate = dateFormatter.string(from: item.Datum)
            let price = formatDecimal(item.Price)
            let pricePerUnit = formatDecimal(item.PricePerUnit)
            
            // Escape quotes and commas in text fields
            let name = escapeCSVField(item.Name)
            let normalizedName = escapeCSVField(item.NormalizedName)
            let category = escapeCSVField(item.Category)
            let shop = escapeCSVField(item.Shop)
            let id = item.id.uuidString
            
            csvContent += "\(formattedDate),\(name),\(normalizedName),\(price),\(pricePerUnit),\(category),\(shop),\(id)\n"
        }
        
        return csvContent
    }
    
    /// Formats Decimal values for CSV export (uses German number format with comma as decimal separator)
    private func formatDecimal(_ decimal: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "de_AT")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: decimal as NSDecimalNumber) ?? "0,00"
    }
    
    /// Escapes CSV fields containing quotes or commas
    private func escapeCSVField(_ field: String) -> String {
        if field.contains("\"") || field.contains(",") || field.contains("\n") {
            return "\"\(field.replacingOccurrences(of: "\"", with: "\"\""))\""
        }
        return field
    }
    
    /// Generates a suggested filename for the CSV export
    func generateCSVFilename() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd_HH-mm"
        let timestamp = dateFormatter.string(from: Date())
        
        return "Alles-Teurer_Export_\(timestamp).csv"
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
