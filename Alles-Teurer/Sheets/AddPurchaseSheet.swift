//
//  AddPurchaseSheet.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI
import SwiftData

struct AddPurchaseSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query private var products: [Product]
    
    @State private var selectedProduct: Product?
    @State private var productName: String = ""
    @State private var shopName: String = ""
    @State private var totalPrice: Double = 0.0
    @State private var quantity: Double = 1.0
    @State private var actualProductName: String = ""
    @State private var unit: String = "Stk"
    @State private var purchaseDate: Date = Date()
    @State private var showingProductSuggestions: Bool = false
    
    // Austrian supermarket suggestions
    private let austrianShops = [
        "Hofer", "Billa", "Lidl", "Spar", "Merkur", "Interspar", 
        "Penny", "MPreis", "Eurospar", "Nah & Frisch", "ADEG"
    ]
    
    // Common product suggestions (top 25 most bought items in Austria)
    private let commonProducts = [
        "Milch", "Brot", "Butter", "Eier", "Käse", "Joghurt", "Bananen", "Äpfel",
        "Kartoffeln", "Zwiebeln", "Tomaten", "Gurken", "Nudeln", "Reis", "Fleisch",
        "Wurst", "Schinken", "Salat", "Paprika", "Karotten", "Mineralwasser",
        "Kaffee", "Zucker", "Mehl", "Öl"
    ]
    
    // Get products sorted by purchase count (most frequently bought first)
    private var frequentProducts: [Product] {
        // Cache the computation to avoid repeated expensive operations
        return products.sorted { lhs, rhs in
            let lhsCount = lhs.purchases?.count ?? 0
            let rhsCount = rhs.purchases?.count ?? 0
            return lhsCount > rhsCount
        }
    }
    
    // Combined product suggestions: common products + frequent products from DB
    private var productSuggestions: [String] {
        // Limit expensive operations and use lazy evaluation where possible
        let topFrequentProducts = frequentProducts.lazy.prefix(10).map(\.normalizedName)
        let topFrequentSet = Set(topFrequentProducts.map { $0.lowercased() })
        
        var suggestions: [String] = []
        suggestions.reserveCapacity(15) // Pre-allocate capacity
        
        suggestions.append(contentsOf: topFrequentProducts)
        
        // Add common products that aren't already in the frequent list
        for product in commonProducts {
            if suggestions.count >= 15 { break }
            if !topFrequentSet.contains(product.lowercased()) {
                suggestions.append(product)
            }
        }
        
        return suggestions
    }
    
    // Get shops sorted by purchase count (most frequently used first)
    private var frequentShops: [String] {
        // Use a more efficient approach to avoid creating intermediate collections
        var shopCounts: [String: Int] = [:]
        
        for product in products {
            guard let purchases = product.purchases else { continue }
            for purchase in purchases {
                shopCounts[purchase.shopName, default: 0] += 1
            }
        }
        
        return shopCounts.sorted { $0.value > $1.value }.map(\.key)
    }
    
    // Combined shop suggestions: frequent shops + common Austrian shops
    private var shopSuggestions: [String] {
        var suggestions: [String] = []
        suggestions.reserveCapacity(20) // Pre-allocate capacity
        
        // Add top frequent shops from database (limit to 8)
        let topFrequentShops = Array(frequentShops.prefix(8))
        suggestions.append(contentsOf: topFrequentShops)
        
        // Add Austrian shops that aren't already in the frequent list
        let frequentShopNames = Set(topFrequentShops.map { $0.lowercased() })
        let additionalAustrianShops = austrianShops.filter {
            !frequentShopNames.contains($0.lowercased())
        }
        suggestions.append(contentsOf: additionalAustrianShops)
        
        return Array(suggestions.prefix(15)) // Limit to 15 total suggestions
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Einkauf hinzufügen")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 16) {
                // Product Name Entry
                VStack(alignment: .leading, spacing: 8) {
                    Text("Produkt")
                        .font(.headline)
                    
                    TextField("Produktname eingeben", text: $productName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: productName) { _, newValue in
                            // Update actualProductName if it's empty or was auto-filled
                            if actualProductName.isEmpty || actualProductName == selectedProduct?.normalizedName {
                                actualProductName = newValue
                            }
                            // Clear selected product if user is typing
                            selectedProduct = nil
                        }
                    
                    // Static product suggestions (always visible)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(productSuggestions, id: \.self) { product in
                                Button(product) {
                                    productName = product
                                    actualProductName = product
                                    // Check if this product exists in database
                                    if let existingProduct = products.first(where: { $0.normalizedName.lowercased() == product.lowercased() }) {
                                        selectedProduct = existingProduct
                                        unit = existingProduct.unit
                                    }
                                }
                                .buttonStyle(.bordered)
                                .font(.caption)
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    
                    // Autocomplete suggestions (when typing)
                    if !productName.isEmpty {
                        let filteredProducts = products.filter { 
                            $0.normalizedName.localizedCaseInsensitiveContains(productName) &&
                            $0.normalizedName.lowercased() != productName.lowercased()
                        }.sorted { $0.normalizedName < $1.normalizedName }
                        
                        if !filteredProducts.isEmpty {
                            Text("Vorschläge aus der Datenbank:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.top, 4)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(filteredProducts.prefix(8), id: \.self) { product in
                                        Button(product.normalizedName) {
                                            productName = product.normalizedName
                                            selectedProduct = product
                                            actualProductName = product.normalizedName
                                            unit = product.unit
                                        }
                                        .buttonStyle(.borderedProminent)
                                        .font(.caption)
                                    }
                                }
                                .padding(.horizontal, 4)
                            }
                        }
                    }
                }
                
                // Shop Name
                VStack(alignment: .leading, spacing: 8) {
                    Text("Geschäft")
                        .font(.headline)
                    
                    TextField("Geschäft eingeben", text: $shopName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Static shop suggestions (always visible)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(shopSuggestions, id: \.self) { shop in
                                Button(shop) {
                                    shopName = shop
                                }
                                .buttonStyle(.bordered)
                                .font(.caption)
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    
                    // Autocomplete suggestions for shops (when typing)
                    if !shopName.isEmpty {
                        // Get unique shop names from all purchases
                        let allShopNames = Set(products.flatMap { ($0.purchases ?? []).map { $0.shopName } })
                        let filteredShops = allShopNames.filter {
                            $0.localizedCaseInsensitiveContains(shopName) &&
                            $0.lowercased() != shopName.lowercased()
                        }.sorted()
                        
                        if !filteredShops.isEmpty {
                            Text("Vorschläge aus der Datenbank:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.top, 4)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(filteredShops.prefix(8), id: \.self) { shop in
                                        Button(shop) {
                                            shopName = shop
                                        }
                                        .buttonStyle(.borderedProminent)
                                        .font(.caption)
                                    }
                                }
                                .padding(.horizontal, 4)
                            }
                        }
                    }
                }
                
                // Actual Product Name
                VStack(alignment: .leading, spacing: 8) {
                    Text("Produktname im Geschäft")
                        .font(.headline)
                    
                    TextField("Wie das Produkt im Geschäft heißt", text: $actualProductName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Price, Quantity, and Unit
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Gesamtpreis")
                            .font(.headline)
                        
                        TextField("0.00", value: $totalPrice, format: .currency(code: "EUR"))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            #if os(iOS)
                            .keyboardType(.decimalPad)
                            #endif
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Menge")
                            .font(.headline)
                        
                        TextField("1.0", value: $quantity, format: .number.precision(.fractionLength(0...2)))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            #if os(iOS)
                            .keyboardType(.decimalPad)
                            #endif
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Einheit")
                            .font(.headline)
                        
                        Picker("Einheit", selection: $unit) {
                            Text("Stk").tag("Stk")
                            Text("kg").tag("kg")
                            Text("g").tag("g")
                            Text("l").tag("l")
                            Text("ml").tag("ml")
                            Text("m").tag("m")
                            Text("cm").tag("cm")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                
                // Date
                VStack(alignment: .leading, spacing: 8) {
                    Text("Datum")
                        .font(.headline)
                    
                    DatePicker("Kaufdatum", selection: $purchaseDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                }
                
                // Price per unit calculation
                if totalPrice > 0 && quantity > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Preis pro \(unit)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text((totalPrice / quantity).formatted(.currency(code: "EUR")))
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .padding(.top, 8)
                }
            }
            
            Spacer()
            
            HStack {
                Button("Abbrechen") {
                    dismiss()
                }
                #if os(macOS)
                .keyboardShortcut(.cancelAction)
                #endif
                
                Spacer()
                
                Button("Speichern") {
                    showingProductSuggestions = false
                    savePurchase()
                }
                .buttonStyle(.borderedProminent)
                #if os(macOS)
                .keyboardShortcut(.defaultAction)
                #endif
                .disabled(!canSave)
            }
        }
        .padding(24)
        .onTapGesture {
            // Hide suggestions when tapping elsewhere
            showingProductSuggestions = false
        }
        #if os(macOS)
        .frame(minWidth: 500, minHeight: 600)
        #endif
    }
    
    private var canSave: Bool {
        !productName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && 
        !shopName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !actualProductName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        totalPrice > 0 &&
        quantity > 0
    }
    
    private func savePurchase() {
        let trimmedProductName = productName.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedShopName = shopName.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedActualProductName = actualProductName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Find existing product or create new one
        let product: Product
        if let existingProduct = selectedProduct ?? products.first(where: { $0.normalizedName.lowercased() == trimmedProductName.lowercased() }) {
            product = existingProduct
        } else {
            // Create new product
            let pricePerUnit = totalPrice / quantity
            product = Product(
                normalizedName: trimmedProductName,
                bestPricePerQuantity: pricePerUnit,
                bestPriceStore: trimmedShopName,
                highestPricePerQuantity: pricePerUnit,
                highestPriceStore: trimmedShopName,
                unit: unit
            )
            modelContext.insert(product)
        }
        
        let purchase = Purchase(
            shopName: trimmedShopName,
            date: purchaseDate,
            totalPrice: totalPrice,
            quantity: quantity,
            actualProductName: trimmedActualProductName,
            unit: unit
        )
        
        // Set the product relationship
        purchase.product = product
        
        modelContext.insert(purchase)
        
        // Update product's price information if this is a new best/worst price
        let pricePerUnit = totalPrice / quantity
        if pricePerUnit < product.bestPricePerQuantity {
            product.bestPricePerQuantity = pricePerUnit
            product.bestPriceStore = trimmedShopName
        }
        if pricePerUnit > product.highestPricePerQuantity {
            product.highestPricePerQuantity = pricePerUnit
            product.highestPriceStore = trimmedShopName
        }
        
        // Update product's last updated date
        product.lastUpdated = Date()
        
        try? modelContext.save()
        dismiss()
    }
}

#Preview {
    AddPurchaseSheet()
        .modelContainer(for: [Product.self, Purchase.self], inMemory: true)
}