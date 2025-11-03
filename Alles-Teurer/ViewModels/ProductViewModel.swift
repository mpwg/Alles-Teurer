//
//  ProductViewModel.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 11.10.25.
//

import SwiftUI
import SwiftData
import Charts

@Observable
final class ProductViewModel {
    // MARK: - Properties
    var modelContext: ModelContext
    var products: [Product] = []
    var searchText = ""
    var selectedProduct: Product?
    
    // MARK: - Computed Properties
    
    /// Filtered products based on search text
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { $0.normalizedName.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    /// Check if there are any products
    var hasProducts: Bool {
        !products.isEmpty
    }
    
    // MARK: - Product Analytics
    
    /// Get sorted purchases for a product
    func purchases(for product: Product) -> [Purchase] {
        product.purchases?.sorted(by: { $0.date < $1.date }) ?? []
    }
    
    /// Calculate price statistics for a product
    func priceStats(for product: Product) -> (min: Decimal, max: Decimal, avg: Decimal, median: Decimal) {
        let purchases = purchases(for: product)
        guard !purchases.isEmpty else { return (0, 0, 0, 0) }
        
        let prices = purchases.map(\.pricePerQuantity).sorted()
        let min = prices.first ?? 0
        let max = prices.last ?? 0
        let sum = prices.reduce(Decimal(0), +)
        let avg = sum / Decimal(prices.count)
        let median = prices.count % 2 == 0
            ? (prices[prices.count/2-1] + prices[prices.count/2]) / 2
            : prices[prices.count/2]
        
        return (min, max, avg, median)
    }
    
    /// Analyze shop data for a product
    func shopAnalysis(for product: Product) -> [(shop: String, count: Int, avgPrice: Decimal, minPrice: Decimal, maxPrice: Decimal)] {
        let purchases = purchases(for: product)
        let shopGroups = Dictionary(grouping: purchases, by: \.shopName)
        
        return shopGroups.map { shop, purchaseList in
            let prices = purchaseList.map(\.pricePerQuantity)
            let sum = prices.reduce(Decimal(0), +)
            return (
                shop: shop,
                count: purchaseList.count,
                avgPrice: sum / Decimal(prices.count),
                minPrice: prices.min() ?? 0,
                maxPrice: prices.max() ?? 0
            )
        }.sorted(by: { $0.avgPrice < $1.avgPrice })
    }
    
    /// Calculate standard deviation for product prices
    func calculateStandardDeviation(for product: Product) -> Decimal {
        let purchases = purchases(for: product)
        guard !purchases.isEmpty else { return 0 }
        
        let prices = purchases.map(\.pricePerQuantity)
        let stats = priceStats(for: product)
        let mean = stats.avg
        let squaredDiffs = prices.map { price in
            let diff = price - mean
            return diff * diff
        }
        let variance = squaredDiffs.reduce(Decimal(0), +) / Decimal(prices.count)
        return Decimal(sqrt(NSDecimalNumber(decimal: variance).doubleValue))
    }
    
    /// Create price ranges for distribution chart
    func createPriceRanges(for product: Product) -> [(range: String, count: Int)] {
        let purchases = purchases(for: product)
        guard !purchases.isEmpty else { return [] }
        
        let prices = purchases.map(\.pricePerQuantity)
        let minPrice = prices.min() ?? 0
        let maxPrice = prices.max() ?? 0
        let rangeSize = (maxPrice - minPrice) / 5
        
        var ranges: [(range: String, count: Int)] = []
        
        for i in 0..<5 {
            let start = minPrice + Decimal(i) * rangeSize
            let end = minPrice + Decimal(i + 1) * rangeSize
            let count = prices.filter { $0 >= start && $0 < (i == 4 ? end + Decimal(0.01) : end) }.count
            
            let nsStart = NSDecimalNumber(decimal: start).doubleValue
            let nsEnd = NSDecimalNumber(decimal: end).doubleValue
            ranges.append((
                range: "\(nsStart.formatted(.currency(code: "EUR"))) - \(nsEnd.formatted(.currency(code: "EUR")))",
                count: count
            ))
        }
        
        return ranges
    }
    
    /// Create monthly spending data
    func createMonthlyData(for product: Product) -> [(month: Date, totalSpent: Decimal)] {
        let purchases = purchases(for: product)
        let calendar = Calendar.current
        let monthlyGroups = Dictionary(grouping: purchases) { purchase in
            calendar.startOfMonth(for: purchase.date)
        }
        
        return monthlyGroups.map { month, purchaseList in
            let totalSpent = purchaseList.map { $0.totalPrice }.reduce(Decimal(0), +)
            return (month: month, totalSpent: totalSpent)
        }.sorted(by: { $0.month < $1.month })
    }
    
    // MARK: - Initialization
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadProducts()
    }
    
    // MARK: - Methods
    
    /// Load all products from the database
    func loadProducts() {
        let descriptor = FetchDescriptor<Product>(
            sortBy: [SortDescriptor(\Product.normalizedName)]
        )
        do {
            products = try modelContext.fetch(descriptor)
        } catch {
            print("Error loading products: \(error)")
        }
    }
    
    /// Delete a product
    func deleteProduct(_ product: Product) {
        // Clear selection if deleting selected product
        if selectedProduct == product {
            selectedProduct = nil
        }
        modelContext.delete(product)
        loadProducts()
    }
    
    /// Update product after purchase is added
    func updateProduct(_ product: Product) {
        try? modelContext.save()
        loadProducts()
    }
}
