//
//  ProductDetailView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var sortOption: PurchaseSortOption = .dateNewest
    
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
    
    var sortedPurchases: [Purchase] {
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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header Section
                VStack(alignment: .leading, spacing: 12) {
                    Text(product.normalizedName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // Price Overview Row
                    HStack(spacing: 16) {
                        // Best Price
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                    .font(.caption)
                                Text("Bester Preis")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Text(product.bestPriceFormatted)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                            Text("bei \(product.bestPriceStore)")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        // Price Difference
                        VStack(alignment: .center, spacing: 4) {
                            Text("Unterschied")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(product.priceDifferenceFormatted)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.orange)
                            let percentage = (product.priceDifference / product.bestPricePerQuantity) * 100
                            Text("\(Int(percentage))%")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        // Highest Price
                        VStack(alignment: .trailing, spacing: 4) {
                            HStack {
                                Text("Teuerster Preis")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .foregroundColor(.red)
                                    .font(.caption)
                            }
                            Text(product.highestPriceFormatted)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                            Text("bei \(product.highestPriceStore)")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    #if os(iOS)
                    .background(Color(.systemGray6))
                    #else
                    .background(Color(NSColor.controlBackgroundColor))
                    #endif
                    .cornerRadius(12)
                    
                    Text("Letzte Aktualisierung: \(product.lastUpdated, format: Date.FormatStyle(date: .abbreviated, time: .shortened))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                // Purchase History Section
                if !(product.purchases?.isEmpty ?? true) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.blue)
                                .font(.title2)
                            
                            Text("Einkaufshistorie & Preise")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text("\(product.purchases?.count ?? 0)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.secondary.opacity(0.2))
                                .cornerRadius(8)
                        }
                        
                        // Sort Picker
                        HStack {
                            Text("Sortieren:")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Picker("Sortierung", selection: $sortOption) {
                                ForEach(PurchaseSortOption.allCases, id: \.self) { option in
                                    Text(option.rawValue).tag(option)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .font(.subheadline)
                        }
                        
                        LazyVStack(spacing: 8) {
                            ForEach(sortedPurchases, id: \.self) { purchase in
                                PurchaseRowView(purchase: purchase)
                            }
                        }
                    }
                } else {
                    ContentUnavailableView {
                        Label("Keine Einkäufe", systemImage: "cart.badge.minus")
                    } description: {
                        Text("Für dieses Produkt sind noch keine Einkäufe gespeichert.")
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(product.normalizedName)
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

struct PurchaseRowView: View {
    let purchase: Purchase
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Product name and shop
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(purchase.actualProductName)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .lineLimit(2)
                    
                    HStack {
                        Image(systemName: "storefront")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                        
                        Text(purchase.shopName)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(purchase.dateFormatted)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
            
            // Purchase details
            HStack {
                // Quantity
                VStack(alignment: .leading, spacing: 2) {
                    Text("Menge")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(purchase.quantityFormatted)
                        .font(.caption)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                // Total price
                VStack(alignment: .center, spacing: 2) {
                    Text("Gesamtpreis")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(purchase.totalPriceFormatted)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                // Price per quantity
                VStack(alignment: .trailing, spacing: 2) {
                    Text("Preis/Einheit")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(purchase.pricePerQuantityFormatted)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(product: TestData.sampleProducts[0])
    }
}