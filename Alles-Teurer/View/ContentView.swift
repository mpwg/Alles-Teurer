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
    @State private var viewModel: ContentViewModel?
    @State private var showingAddSheet = false

    private var groupedItems: [String: [Rechnungszeile]] {
        guard let viewModel = viewModel else { return [:] }
        return Dictionary(grouping: viewModel.items, by: { $0.Name })
    }

    private var sortedProductNames: [String] {
        groupedItems.keys.sorted()
    }

    var body: some View {
        NavigationSplitView {
            Group {
                if let viewModel = viewModel {
                    if viewModel.isLoading {
                        ProgressView("Daten werden geladen...")
                    } else if viewModel.items.isEmpty {
                        ContentUnavailableView(
                            "Noch keine Einkäufe",
                            systemImage: "cart",
                            description: Text(
                                "Fügen Sie Ihren ersten Einkauf hinzu, um die Preisentwicklung zu verfolgen."
                            )
                        )
                    } else {
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
                    }
                } else {
                    ProgressView("Initialisierung...")
                }
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
                    if let viewModel = viewModel, !viewModel.items.isEmpty {
                        EditButton()
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddItemView()
            }
            .task {
                // Delay initialization slightly to ensure scene is fully set up
                await Task.yield()
                if viewModel == nil {
                    viewModel = ContentViewModel(modelContext: modelContext)
                }
            }
            .alert("Fehler", isPresented: .constant(viewModel?.errorMessage != nil)) {
                Button("OK") {
                    viewModel?.errorMessage = nil
                }
            } message: {
                if let errorMessage = viewModel?.errorMessage {
                    Text(errorMessage)
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
        Task {
            await viewModel?.addItem()
        }
    }

    private func deleteItems(_ itemsToDelete: [Rechnungszeile]) async {
        await viewModel?.deleteItems(itemsToDelete)
    }

    private func deleteProductGroup(offsets: IndexSet) {
        Task {
            for index in offsets {
                let productName = sortedProductNames[index]
                if let itemsToDelete = groupedItems[productName] {
                    await viewModel?.deleteItems(itemsToDelete)
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
