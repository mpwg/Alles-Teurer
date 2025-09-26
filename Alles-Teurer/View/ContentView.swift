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
    @State private var selectedProduct: String?

    var body: some View {
        NavigationSplitView {
            Group {
                if let viewModel = viewModel {
                    List(selection: $selectedProduct) {
                        ForEach(viewModel.productGroups.keys.sorted(), id: \.self) { productName in
                            let items = viewModel.productGroups[productName] ?? []
                            let latestItem = items.max { $0.Datum < $1.Datum }
                            
                            if let latestItem = latestItem {
                                RechnungszeileRow(
                                    item: latestItem,
                                    isHighestPrice: viewModel.priceAnalysis.highest?.id == latestItem.id,
                                    isLowestPrice: viewModel.priceAnalysis.lowest?.id == latestItem.id
                                )
                                .tag(productName)
                            }
                        }
                        .onDelete { indexSet in
                            let productNames = indexSet.map { Array(viewModel.productGroups.keys.sorted())[$0] }
                            let itemsToDelete = productNames.flatMap { viewModel.productGroups[$0] ?? [] }
                            Task {
                                await viewModel.deleteItems(itemsToDelete)
                                selectedProduct = nil
                            }
                        }
                    }
                    .refreshable {
                        await viewModel.loadItems()
                    }
                } else if viewModel?.isLoading == true {
                    ProgressView("Laden...")
                } else {
                    ProgressView("Initialisierung...")
                }
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
                    Button {
                        Task {
                            await viewModel?.addItem()
                        }
                    } label: {
                        Label("Artikel hinzufügen", systemImage: "plus")
                    }
                    .disabled(viewModel?.isLoading == true)
                }
            }
        } detail: {
            if let selectedProduct = selectedProduct,
               let viewModel = viewModel,
               let items = viewModel.productGroups[selectedProduct] {
                ProductDetailView(
                    productName: selectedProduct,
                    items: items,
                    onDelete: { itemsToDelete in
                        await viewModel.deleteItems(itemsToDelete)
                        // If all items for this product are deleted, clear selection
                        if viewModel.productGroups[selectedProduct]?.isEmpty != false {
                            self.selectedProduct = nil
                        }
                    }
                )
            } else {
                Text("Wählen Sie einen Artikel aus")
            }
        }
        .task {
            if viewModel == nil {
                viewModel = ContentViewModel(modelContext: modelContext)
            }
        }
        .alert("Fehler", isPresented: .constant(viewModel?.errorMessage != nil)) {
            Button("OK") {
                viewModel?.errorMessage = nil
            }
        } message: {
            Text(viewModel?.errorMessage ?? "Unbekannter Fehler")
        }
    }
}





#Preview {
    ContentView()
        .modelContainer(for: Rechnungszeile.self, inMemory: true)
}
