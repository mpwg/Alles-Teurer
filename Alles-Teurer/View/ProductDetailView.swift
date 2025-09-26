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

    @State private var sortOption: SortOption = .date
    @State private var sortOrder: SortOrder = .reverse

    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = Locale(identifier: "de_AT")
        return formatter
    }()

    private var sortedItems: [Rechnungszeile] {
        switch sortOption {
        case .price:
            return items.sorted { lhs, rhs in
                sortOrder == .forward ? lhs.Price < rhs.Price : lhs.Price > rhs.Price
            }
        case .date:
            return items.sorted { lhs, rhs in
                sortOrder == .forward ? lhs.Datum < rhs.Datum : lhs.Datum > rhs.Datum
            }
        case .shop:
            return items.sorted { lhs, rhs in
                let comparison = lhs.Shop.localizedCaseInsensitiveCompare(rhs.Shop)
                return sortOrder == .forward
                    ? comparison == .orderedAscending : comparison == .orderedDescending
            }
        }
    }

    private var priceRange: (min: Decimal, max: Decimal)? {
        guard !items.isEmpty else { return nil }
        let prices = items.map { $0.Price }
        return (min: prices.min() ?? 0, max: prices.max() ?? 0)
    }

    var body: some View {
        List {
            ForEach(sortedItems) { item in
                ItemRowView(
                    item: item,
                    priceRange: priceRange,
                    currencyFormatter: currencyFormatter
                )
            }
            .onDelete { indexSet in
                let itemsToDelete = indexSet.map { sortedItems[$0] }
                Task {
                    await onDelete(itemsToDelete)
                }
            }
        }
        .navigationTitle(productName)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Menu {
                    Picker("Sortierung", selection: $sortOption) {
                        Label("Preis", systemImage: "eurosign.circle")
                            .tag(SortOption.price)
                        Label("Datum", systemImage: "calendar")
                            .tag(SortOption.date)
                        Label("Geschäft", systemImage: "storefront")
                            .tag(SortOption.shop)
                    }
                    .pickerStyle(.inline)

                    Divider()

                    Picker("Reihenfolge", selection: $sortOrder) {
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
        .overlay {
            if items.isEmpty {
                ContentUnavailableView(
                    "Keine Einträge",
                    systemImage: "cart",
                    description: Text("Für dieses Produkt wurden noch keine Einkäufe erfasst.")
                )
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
