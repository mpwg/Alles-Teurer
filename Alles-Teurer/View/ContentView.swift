//
//  ContentView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 25.09.25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Rechnungszeile]

    // Computed properties for price analysis
    private var priceAnalysis: (highest: Rechnungszeile?, lowest: Rechnungszeile?) {
        guard !items.isEmpty else { return (nil, nil) }

        let highest = items.max { $0.Price < $1.Price }
        let lowest = items.min { $0.Price < $1.Price }

        return (highest, lowest)
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    RechnungszeileRow(
                        item: item,
                        isHighestPrice: priceAnalysis.highest?.id == item.id,
                        isLowestPrice: priceAnalysis.lowest?.id == item.id
                    )
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Rechnungen")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Bearbeiten") {
                        // Handle edit mode toggle - Mac Catalyst compatible
                        // This is a placeholder for edit functionality
                    }
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Artikel hinzufügen", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Wählen Sie einen Artikel aus")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Rechnungszeile(
                Name: "Neuer Artikel",
                Price: Decimal(1.99),
                Category: "Kategorie",
                Shop: "Geschäft",
                Datum: Date.now
            )
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}





#Preview {
    ContentView()
        .modelContainer(for: Rechnungszeile.self, inMemory: true)
}
