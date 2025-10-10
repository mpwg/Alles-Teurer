//
//  ProductDetailView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
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
                
                // Additional Product Information
                VStack(alignment: .leading, spacing: 16) {
                    // Statistics Section
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "chart.bar.fill")
                                .foregroundColor(.blue)
                                .font(.title2)
                            
                            Text("Statistiken")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        
                        VStack(spacing: 12) {
                            HStack {
                                Text("Anzahl Einkäufe:")
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("\(product.purchases?.count ?? 0)")
                                    .fontWeight(.medium)
                            }
                            
                            if let purchases = product.purchases, !purchases.isEmpty {
                                Divider()
                                
                                HStack {
                                    Text("Durchschnittspreis:")
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    let avgPrice = purchases.map(\.pricePerQuantity).reduce(0, +) / Double(purchases.count)
                                    Text("\(avgPrice, format: .currency(code: "EUR"))")
                                        .fontWeight(.medium)
                                }
                                
                                HStack {
                                    Text("Gesamtausgaben:")
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    let totalSpent = purchases.map(\.totalPrice).reduce(0, +)
                                    Text("\(totalSpent, format: .currency(code: "EUR"))")
                                        .fontWeight(.medium)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .padding()
                        #if os(iOS)
                        .background(Color(.systemGray6))
                        #else
                        .background(Color(NSColor.controlBackgroundColor))
                        #endif
                        .cornerRadius(12)
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



#Preview {
    NavigationStack {
        ProductDetailView(product: TestData.sampleProducts[0])
    }
}