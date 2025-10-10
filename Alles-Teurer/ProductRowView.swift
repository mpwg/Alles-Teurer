//
//  ProductRowView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    @State private var showingEditSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(product.normalizedName)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Button(action: {
                    showingEditSheet = true
                }) {
                    Image(systemName: "pencil")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(4)
                }
                .buttonStyle(BorderlessButtonStyle())
                .sheet(isPresented: $showingEditSheet) {
                    EditProductSheet(product: product)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text(product.priceDifferenceFormatted)
                        .font(.caption)
                        .foregroundColor(.red)
                        .fontWeight(.medium)
                }
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .font(.caption)
                        
                        Text("Bester Preis:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text(product.bestPriceFormatted)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                        
                        Text("bei \(product.bestPriceStore)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    HStack {
                        Text("Teuerster Preis:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    
                    HStack {
                        Text("bei \(product.highestPriceStore)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text(product.highestPriceFormatted)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ProductRowView(product: TestData.sampleProducts[0])
        .padding()
}