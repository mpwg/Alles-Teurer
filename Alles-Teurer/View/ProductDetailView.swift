//
//  ProductDetailView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//

import SwiftData
import SwiftUI

struct ProductDetailView: View {
    let productName: String
    let items: [Rechnungszeile]
    let onDelete: ([Rechnungszeile]) async -> Void

    @Environment(\.modelContext) private var modelContext
    @State private var viewModel: ProductDetailViewModel?

    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = Locale(identifier: "de_AT")
        return formatter
    }()

    var body: some View {
        Group {
            if let viewModel = viewModel {
                if viewModel.isLoading {
                    ProgressView("Daten werden geladen...")
                } else if viewModel.sortedItems.isEmpty {
                    ContentUnavailableView(
                        "Keine Einträge",
                        systemImage: "cart",
                        description: Text("Für dieses Produkt wurden noch keine Einkäufe erfasst.")
                    )
                } else {
                    List {
                        ForEach(viewModel.sortedItems) { item in
                            ItemRowView(
                                item: item,
                                priceRange: viewModel.priceRange,
                                currencyFormatter: currencyFormatter
                            )
                        }
                        .onDelete { indexSet in
                            let itemsToDelete = indexSet.map { viewModel.sortedItems[$0] }
                            Task {
                                await viewModel.deleteItems(itemsToDelete)
                                await onDelete(itemsToDelete)
                            }
                        }
                    }
                }
            } else {
                ProgressView("Initialisierung...")
            }
        }
        .navigationTitle(productName)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            // Use ToolbarItemGroup to properly group items
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if let viewModel = viewModel {
                    Menu {
                        Picker(
                            "Sortierung",
                            selection: Binding(
                                get: { viewModel.sortOption },
                                set: { viewModel.setSortOption($0) }
                            )
                        ) {
                            Label("Preis", systemImage: "eurosign.circle")
                                .tag(SortOption.price)
                            Label("Datum", systemImage: "calendar")
                                .tag(SortOption.date)
                            Label("Geschäft", systemImage: "storefront")
                                .tag(SortOption.shop)
                        }
                        .pickerStyle(.inline)

                        Divider()

                        Picker(
                            "Reihenfolge",
                            selection: Binding(
                                get: { viewModel.sortOrder },
                                set: { viewModel.setSortOrder($0) }
                            )
                        ) {
                            Label("Aufsteigend", systemImage: "arrow.up")
                                .tag(SortOrder.forward)
                            Label("Absteigend", systemImage: "arrow.down")
                                .tag(SortOrder.reverse)
                        }
                        .pickerStyle(.inline)
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .accessibilityLabel("Sortieroptionen")
                            .accessibilityHint("Sortierung und Reihenfolge der Einträge ändern")
                    }

                    if !items.isEmpty {
                        EditButton()
                    }
                }
            }
        }
        .task {
            // Initialize viewModel immediately without delay
            viewModel = ProductDetailViewModel(
                productName: productName,
                items: items,
                modelContext: modelContext
            )
        }
        .onChange(of: items) { _, newItems in
            viewModel?.updateItems(newItems)
        }
        .onChange(of: productName) { _, newProductName in
            viewModel = ProductDetailViewModel(
                productName: newProductName,
                items: items,
                modelContext: modelContext
            )
        }
        .alert("Fehler", isPresented: .constant(viewModel?.errorMessage != nil)) {
            Button("OK") {
                viewModel?.dismissError()
            }
        } message: {
            if let errorMessage = viewModel?.errorMessage {
                Text(errorMessage)
            }
        }
    }
}

#Preview("Mit Einträgen") {
    NavigationStack {
        ProductDetailView(
            productName: "Milch",
            items: SampleData.sampleRechnungszeilen,
            onDelete: { _ in }
        )
    }
}

#Preview("Leer") {
    NavigationStack {
        ProductDetailView(
            productName: "Brot",
            items: [],
            onDelete: { _ in }
        )
    }
}
