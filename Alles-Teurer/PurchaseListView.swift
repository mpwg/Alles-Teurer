//
//  PurchaseListView.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 10.10.25.
//

import SwiftUI

struct PurchaseListView: View {
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
        VStack(alignment: .leading, spacing: 12) {
            if !(product.purchases?.isEmpty ?? true) {
                // Header
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundColor(.blue)
                        .font(.title2)
                    
                    Text("Einkaufshistorie")
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
                .padding(.horizontal)
                
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
                .padding(.horizontal)
                
                // Purchase List
                List(sortedPurchases, id: \.self) { purchase in
                    PurchaseRowView(purchase: purchase)
                        .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                }
                .listStyle(PlainListStyle())
            } else {
                ContentUnavailableView {
                    Label("Keine Einkäufe", systemImage: "cart.badge.minus")
                } description: {
                    Text("Für dieses Produkt sind noch keine Einkäufe gespeichert.")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationTitle("Einkäufe")
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
        PurchaseListView(product: TestData.sampleProducts[0])
    }
}