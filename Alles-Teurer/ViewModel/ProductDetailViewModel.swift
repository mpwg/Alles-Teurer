//
//  ProductDetailViewModel.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 26.09.25.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
@Observable
final class ProductDetailViewModel {
    private let modelContext: ModelContext
    private let _items: [Rechnungszeile]

    // UI State
    var sortOption: SortOption = .date
    var sortOrder: SortOrder = .reverse
    var isLoading = false
    var errorMessage: String?

    // Computed properties
    let productName: String

    init(productName: String, items: [Rechnungszeile], modelContext: ModelContext) {
        self.productName = productName
        self._items = items
        self.modelContext = modelContext
    }

    var sortedItems: [Rechnungszeile] {
        switch sortOption {
        case .price:
            return _items.sorted { lhs, rhs in
                sortOrder == .forward ? lhs.Price < rhs.Price : lhs.Price > rhs.Price
            }
        case .date:
            return _items.sorted { lhs, rhs in
                sortOrder == .forward ? lhs.Datum < rhs.Datum : lhs.Datum > rhs.Datum
            }
        case .shop:
            return _items.sorted { lhs, rhs in
                let comparison = lhs.Shop.localizedCaseInsensitiveCompare(rhs.Shop)
                return sortOrder == .forward
                    ? comparison == .orderedAscending : comparison == .orderedDescending
            }
        }
    }

    var priceRange: (min: Decimal, max: Decimal)? {
        guard !_items.isEmpty else { return nil }
        let prices = _items.map { $0.Price }
        return (min: prices.min() ?? 0, max: prices.max() ?? 0)
    }

    var averagePrice: Decimal {
        guard !_items.isEmpty else { return 0 }
        let total = _items.reduce(Decimal(0)) { $0 + $1.Price }
        return total / Decimal(_items.count)
    }

    var latestPrice: Decimal? {
        _items.max(by: { $0.Datum < $1.Datum })?.Price
    }

    var priceStats: (lowest: Decimal, highest: Decimal, average: Decimal)? {
        guard let range = priceRange else { return nil }
        return (lowest: range.min, highest: range.max, average: averagePrice)
    }

    // Actions
    func setSortOption(_ option: SortOption) {
        sortOption = option
    }

    func setSortOrder(_ order: SortOrder) {
        sortOrder = order
    }

    func toggleSortOrder() {
        sortOrder = sortOrder == .forward ? .reverse : .forward
    }

    func deleteItems(_ itemsToDelete: [Rechnungszeile]) async {
        isLoading = true
        defer { isLoading = false }

        do {
            for item in itemsToDelete {
                modelContext.delete(item)
            }
            try modelContext.save()
        } catch {
            errorMessage = "Failed to delete items: \(error.localizedDescription)"
        }
    }

    func dismissError() {
        errorMessage = nil
    }
}
