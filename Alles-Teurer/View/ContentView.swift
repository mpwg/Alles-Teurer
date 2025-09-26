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

    @State private var showingAddSheet = false

    private var groupedItems: [String: [Rechnungszeile]] {
        Dictionary(grouping: items, by: { $0.Name })
    }

    private var sortedProductNames: [String] {
        groupedItems.keys.sorted()
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(sortedProductNames, id: \.self) { productName in
                    NavigationLink(
                        destination: ProductDetailView(
                            productName: productName,
                            items: groupedItems[productName] ?? [],
                            onDelete: deleteItems
                        )
                    ) {
                        ProductRowView(
                            productName: productName,
                            items: groupedItems[productName] ?? []
                        )
                    }
                }
                .onDelete(perform: deleteProductGroup)
            }
            .navigationTitle("Alles Teurer")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddSheet = true }) {
                        Image(systemName: "plus")
                            .accessibilityLabel("Neuen Eintrag hinzufügen")
                    }
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    if !items.isEmpty {
                        EditButton()
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddItemView()
            }
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView(
                        "Noch keine Einkäufe",
                        systemImage: "cart",
                        description: Text(
                            "Fügen Sie Ihren ersten Einkauf hinzu, um die Preisentwicklung zu verfolgen."
                        )
                    )
                }
            }
        } detail: {
            ContentUnavailableView(
                "Produkt auswählen",
                systemImage: "arrow.left",
                description: Text(
                    "Wählen Sie ein Produkt aus der Liste aus, um die Details zu sehen.")
            )
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Rechnungszeile(
                Name: "Neues Produkt",
                Price: 1.23,
                Category: "Kategorie",
                Shop: "Geschäft",
                Datum: Date.now
            )
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(_ itemsToDelete: [Rechnungszeile]) async {
        await MainActor.run {
            withAnimation {
                for item in itemsToDelete {
                    modelContext.delete(item)
                }
            }
        }
    }

    private func deleteProductGroup(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let productName = sortedProductNames[index]
                if let itemsToDelete = groupedItems[productName] {
                    for item in itemsToDelete {
                        modelContext.delete(item)
                    }
                }
            }
        }
    }
}

#Preview("Mit Daten") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Rechnungszeile.self, configurations: config)

    // Sample-Daten hinzufügen
    for item in SampleData.sampleRechnungszeilen {
        container.mainContext.insert(item)
    }

    return ContentView()
        .modelContainer(container)
}

#Preview("Leer") {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Rechnungszeile.self, configurations: config)

    return ContentView()
        .modelContainer(container)
}
