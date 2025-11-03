//
//  PurchaseViewModel.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 11.10.25.
//

import SwiftUI
import SwiftData

@Observable
final class PurchaseViewModel {
    // MARK: - Properties
    private var modelContext: ModelContext
    private var productViewModel: ProductViewModel
    
    var sortOption: PurchaseSortOption = .dateNewest
    
    // For adding new purchases
    var productName: String = ""
    var shopName: String = ""
    var totalPrice: Decimal = 0.0
    var quantity: Decimal = 1.0
    var actualProductName: String = ""
    var unit: String = "Stk"
    var purchaseDate: Date = Date()
    var selectedProduct: Product?
    
    // MARK: - Sort Options
    
    enum PurchaseSortOption: String, CaseIterable {
        case dateNewest = "Datum (neueste)"
        case dateOldest = "Datum (älteste)"
        case priceHighest = "Preis/Einheit (höchste)"
        case priceLowest = "Preis/Einheit (niedrigste)"
        case totalPriceHighest = "Gesamtpreis (höchste)"
        case totalPriceLowest = "Gesamtpreis (niedrigste)"
        case quantityHighest = "Menge (höchste)"
        case quantityLowest = "Menge (niedrigste)"
        case shopName = "Geschäft (A-Z)"
    }
    
    // MARK: - Computed Properties
    
    /// Get sorted purchases for a product
    func sortedPurchases(for product: Product) -> [Purchase] {
        let purchases = product.purchases ?? []
        
        switch sortOption {
        case .dateNewest:
            return purchases.sorted { $0.date > $1.date }
        case .dateOldest:
            return purchases.sorted { $0.date < $1.date }
        case .priceHighest:
            return purchases.sorted { $0.pricePerQuantity > $1.pricePerQuantity }
        case .priceLowest:
            return purchases.sorted { $0.pricePerQuantity < $1.pricePerQuantity }
        case .totalPriceHighest:
            return purchases.sorted { $0.totalPrice > $1.totalPrice }
        case .totalPriceLowest:
            return purchases.sorted { $0.totalPrice < $1.totalPrice }
        case .quantityHighest:
            return purchases.sorted { $0.quantity > $1.quantity }
        case .quantityLowest:
            return purchases.sorted { $0.quantity < $1.quantity }
        case .shopName:
            return purchases.sorted { $0.shopName < $1.shopName }
        }
    }
    
    // MARK: - Suggestions for AddPurchaseSheet
    
    /// Austrian supermarket suggestions
    let austrianShops = [
        "Hofer", "Billa", "Lidl", "Spar", "Merkur", "Interspar",
        "Penny", "MPreis", "Eurospar", "Nah & Frisch", "ADEG"
    ]
    
    /// Common product suggestions
    let commonProducts = [
        "Milch", "Brot", "Butter", "Eier", "Käse", "Joghurt", "Bananen", "Äpfel",
        "Kartoffeln", "Zwiebeln", "Tomaten", "Gurken", "Nudeln", "Reis", "Fleisch",
        "Wurst", "Schinken", "Salat", "Paprika", "Karotten", "Mineralwasser",
        "Kaffee", "Zucker", "Mehl", "Öl"
    ]
    
    /// Get products sorted by purchase count (most frequently bought first)
    var frequentProducts: [Product] {
        productViewModel.products.sorted { lhs, rhs in
            let lhsCount = lhs.purchases?.count ?? 0
            let rhsCount = rhs.purchases?.count ?? 0
            return lhsCount > rhsCount
        }
    }
    
    /// Combined product suggestions
    var productSuggestions: [String] {
        let topFrequentProducts = frequentProducts.lazy.prefix(10).map(\.normalizedName)
        let topFrequentSet = Set(topFrequentProducts.map { $0.lowercased() })
        
        var suggestions: [String] = []
        suggestions.reserveCapacity(15)
        
        suggestions.append(contentsOf: topFrequentProducts)
        
        for product in commonProducts {
            if suggestions.count >= 15 { break }
            if !topFrequentSet.contains(product.lowercased()) {
                suggestions.append(product)
            }
        }
        
        return suggestions
    }
    
    /// Get shops sorted by purchase count
    var frequentShops: [String] {
        var shopCounts: [String: Int] = [:]
        
        for product in productViewModel.products {
            guard let purchases = product.purchases else { continue }
            for purchase in purchases {
                shopCounts[purchase.shopName, default: 0] += 1
            }
        }
        
        return shopCounts.sorted { $0.value > $1.value }.map(\.key)
    }
    
    /// Combined shop suggestions
    var shopSuggestions: [String] {
        var suggestions: [String] = []
        suggestions.reserveCapacity(20)
        
        let topFrequentShops = Array(frequentShops.prefix(8))
        suggestions.append(contentsOf: topFrequentShops)
        
        let frequentShopNames = Set(topFrequentShops.map { $0.lowercased() })
        let additionalAustrianShops = austrianShops.filter {
            !frequentShopNames.contains($0.lowercased())
        }
        suggestions.append(contentsOf: additionalAustrianShops)
        
        return Array(suggestions.prefix(15))
    }
    
    /// Get filtered products based on search text
    func filteredProducts(matching searchText: String) -> [Product] {
        productViewModel.products.filter {
            $0.normalizedName.localizedCaseInsensitiveContains(searchText) &&
            $0.normalizedName.lowercased() != searchText.lowercased()
        }.sorted { $0.normalizedName < $1.normalizedName }
    }
    
    // MARK: - Validation
    
    var isValidPurchase: Bool {
        !productName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !shopName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !actualProductName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        totalPrice > 0 &&
        quantity > 0
    }
    
    // MARK: - Initialization
    
    init(modelContext: ModelContext, productViewModel: ProductViewModel) {
        self.modelContext = modelContext
        self.productViewModel = productViewModel
    }
    
    // MARK: - Methods
    
    /// Add a new purchase
    func addPurchase() {
        guard isValidPurchase else { return }
        
        let trimmedProductName = productName.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedShopName = shopName.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedActualName = actualProductName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Create the purchase
        let purchase = Purchase(
            shopName: trimmedShopName,
            date: purchaseDate,
            totalPrice: totalPrice,
            quantity: quantity,
            actualProductName: trimmedActualName,
            unit: unit
        )
        
        modelContext.insert(purchase)
        
        // Find or create product
        var product: Product
        if let existingProduct = selectedProduct ?? productViewModel.products.first(where: {
            $0.normalizedName.lowercased() == trimmedProductName.lowercased()
        }) {
            product = existingProduct
        } else {
            product = Product(
                normalizedName: trimmedProductName,
                bestPricePerQuantity: purchase.pricePerQuantity,
                bestPriceStore: trimmedShopName,
                highestPricePerQuantity: purchase.pricePerQuantity,
                highestPriceStore: trimmedShopName,
                unit: unit
            )
            modelContext.insert(product)
        }
        
        // Link purchase to product
        purchase.product = product
        
        // Update product's best/worst prices
        updateProductPrices(product)
        
        try? modelContext.save()
        productViewModel.loadProducts()
        
        // Reset form
        resetForm()
    }
    
    /// Update product's best and worst prices
    private func updateProductPrices(_ product: Product) {
        guard let purchases = product.purchases, !purchases.isEmpty else { return }
        
        var bestPrice = Decimal.greatestFiniteMagnitude
        var bestStore = ""
        var worstPrice = Decimal.zero
        var worstStore = ""
        
        for purchase in purchases {
            let price = purchase.pricePerQuantity
            if price < bestPrice {
                bestPrice = price
                bestStore = purchase.shopName
            }
            if price > worstPrice {
                worstPrice = price
                worstStore = purchase.shopName
            }
        }
        
        product.bestPricePerQuantity = bestPrice
        product.bestPriceStore = bestStore
        product.highestPricePerQuantity = worstPrice
        product.highestPriceStore = worstStore
        product.lastUpdated = Date()
    }
    
    /// Reset the form after adding a purchase
    func resetForm() {
        productName = ""
        shopName = ""
        totalPrice = 0.0
        quantity = 1.0
        actualProductName = ""
        unit = "Stk"
        purchaseDate = Date()
        selectedProduct = nil
    }
    
    /// Select a product from suggestions
    func selectProduct(_ product: Product) {
        selectedProduct = product
        productName = product.normalizedName
        actualProductName = product.normalizedName
        unit = product.unit
    }
    
    /// Select a product by name
    func selectProductByName(_ name: String) {
        productName = name
        actualProductName = name
        
        if let existingProduct = productViewModel.products.first(where: {
            $0.normalizedName.lowercased() == name.lowercased()
        }) {
            selectedProduct = existingProduct
            unit = existingProduct.unit
        } else {
            selectedProduct = nil
        }
    }
}
