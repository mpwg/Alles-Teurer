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

    var body: some View {
        NavigationSplitView {
            // Master: List of unique product names
            if let viewModel = viewModel {
                if viewModel.isLoading {
                    ProgressView("Lädt Produkte...")
                        .navigationTitle("Produkte")
                } else if let errorMessage = viewModel.errorMessage {
                    ContentUnavailableView(
                        "Fehler beim Laden",
                        systemImage: "exclamationmark.triangle",
                        description: Text(errorMessage)
                    )
                    .navigationTitle("Produkte")
                } else {
                    ProductNamesListView(
                        productNames: viewModel.uniqueProductNames,
                        selectedProductName: Binding(
                            get: { viewModel.selectedProductName },
                            set: { viewModel.selectedProductName = $0 }
                        ),
                        onGenerateTestData: {
                            Task {
                                await viewModel.generateTestData()
                            }
                        }
                    )
                    .navigationTitle("Produkte")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Test Daten") {
                                Task {
                                    await viewModel.generateTestData()
                                }
                            }
                            .disabled(viewModel.isLoading)
                        }
                    }
                }
            } else {
                ProgressView("Initialisiere...")
                    .navigationTitle("Produkte")
            }
        } detail: {
            // Detail: List of all items for selected product
            if let viewModel = viewModel,
                let selectedName = viewModel.selectedProductName
            {
                ProductDetailView(
                    productName: selectedName,
                    items: viewModel.items(for: selectedName),
                    onDelete: { itemsToDelete in
                        Task {
                            await viewModel.deleteItems(itemsToDelete)
                        }
                    }
                )
            } else {
                ContentUnavailableView(
                    "Kein Produkt ausgewählt",
                    systemImage: "list.bullet.rectangle",
                    description: Text(
                        "Wählen Sie ein Produkt aus der Liste, um Details anzuzeigen.")
                )
            }
        }
        .onAppear {
            // Initialize viewModel with the actual modelContext when view appears
            if viewModel == nil {
                viewModel = ContentViewModel(modelContext: modelContext)
            }
        }
        .refreshable {
            await viewModel?.loadItems()
        }
    }

}





#Preview {
    ContentView()
        .modelContainer(for: Rechnungszeile.self, inMemory: true)
}
