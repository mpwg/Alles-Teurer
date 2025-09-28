//
//  RechnungszeileRow.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import SwiftData
import SwiftUI

struct RechnungszeileRow: View {
    let item: Rechnungszeile
    let isHighestPrice: Bool
    let isLowestPrice: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                // Product name with price indicators
                HStack {
                    Text(item.NormalizedName)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Spacer()

                    // Price indicator badges
                    if isHighestPrice {
                        PriceIndicatorBadge(
                            type: .highest,
                            shop: item.Shop
                        )
                    }

                    if isLowestPrice {
                        PriceIndicatorBadge(
                            type: .lowest,
                            shop: item.Shop
                        )
                    }
                }

                // Category and shop information
                HStack {
                    Label(item.Category, systemImage: "tag")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Spacer()

                    Label(item.Shop, systemImage: "storefront")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                // Date and price
                HStack {
                    Text(item.Datum, format: .dateTime.day().month().year())
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Spacer()

                    Text(CurrencyFormatter.format(item.Price))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.vertical, 2)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(
            "\(item.NormalizedName), \(item.Category), \(item.Shop), \(CurrencyFormatter.format(item.Price))"
        )
        .accessibilityHint(accessibilityHint)
    }

    private var accessibilityHint: String {
        var hints: [String] = []

        if isHighestPrice {
            hints.append("Höchster Preis bei \(item.Shop)")
        }

        if isLowestPrice {
            hints.append("Niedrigster Preis bei \(item.Shop)")
        }

        return hints.isEmpty ? "" : hints.joined(separator: ", ")
    }
}