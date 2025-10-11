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
    func priceStats(for product: Product) -> (min: Double, max: Double, avg: Double, median: Double) {
        let purchases = purchases(for: product)
        guard !purchases.isEmpty else { return (0, 0, 0, 0) }
        
        let prices = purchases.map(\.pricePerQuantity).sorted()
        let min = prices.first ?? 0
        let max = prices.last ?? 0
        let avg = prices.reduce(0, +) / Double(prices.count)
        let median = prices.count % 2 == 0
            ? (prices[prices.count/2-1] + prices[prices.count/2]) / 2
            : prices[prices.count/2]
        
        return (min, max, avg, median)
    }
    
    /// Analyze shop data for a product
    func shopAnalysis(for product: Product) -> [(shop: String, count: Int, avgPrice: Double, minPrice: Double, maxPrice: Double)] {
        let purchases = purchases(for: product)
        let shopGroups = Dictionary(grouping: purchases, by: \.shopName)
        
        return shopGroups.map { shop, purchaseList in
            let prices = purchaseList.map(\.pricePerQuantity)
            return (
                shop: shop,
                count: purchaseList.count,
                avgPrice: prices.reduce(0, +) / Double(prices.count),
                minPrice: prices.min() ?? 0,
                maxPrice: prices.max() ?? 0
            )
        }.sorted(by: { $0.avgPrice < $1.avgPrice })
    }
    
    /// Calculate standard deviation for product prices
    func calculateStandardDeviation(for product: Product) -> Double {
        let purchases = purchases(for: product)
        guard !purchases.isEmpty else { return 0 }
        
        let prices = purchases.map(\.pricePerQuantity)
        let stats = priceStats(for: product)
        let mean = stats.avg
        let squaredDiffs = prices.map { pow($0 - mean, 2) }
        let variance = squaredDiffs.reduce(0, +) / Double(prices.count)
        return sqrt(variance)
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
            let start = minPrice + Double(i) * rangeSize
            let end = minPrice + Double(i + 1) * rangeSize
            let count = prices.filter { $0 >= start && $0 < (i == 4 ? end + 0.01 : end) }.count
            
            ranges.append((
                range: "\(start.formatted(.currency(code: "EUR"))) - \(end.formatted(.currency(code: "EUR")))",
                count: count
            ))
        }
        
        return ranges
    }
    
    /// Create monthly spending data
    func createMonthlyData(for product: Product) -> [(month: Date, totalSpent: Double)] {
        let purchases = purchases(for: product)
        let calendar = Calendar.current
        let monthlyGroups = Dictionary(grouping: purchases) { purchase in
            calendar.startOfMonth(for: purchase.date)
        }
        
        return monthlyGroups.map { month, purchaseList in
            let totalSpent = purchaseList.map { $0.totalPrice }.reduce(0, +)
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
