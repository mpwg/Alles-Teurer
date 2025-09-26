//
//  ItemRowView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import SwiftData
import SwiftUI

 struct ItemRowView: View {
    let item: Rechnungszeile
    let priceRange: (min: Decimal, max: Decimal)?
    let currencyFormatter: NumberFormatter

    private var priceHighlight: PriceHighlight {
        guard let range = priceRange, range.min != range.max else { return .none }

        if item.Price == range.min {
            return .cheapest
        } else if item.Price == range.max {
            return .expensive
        }
        return .none
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                HStack(spacing: 4) {
                    if priceHighlight != .none {
                        Image(systemName: priceHighlight.iconName)
                            .foregroundColor(priceHighlight.color)
                            .accessibilityLabel(priceHighlight.accessibilityLabel)
                    }

                    Text(currencyFormatter.string(from: item.Price as NSNumber) ?? "€0,00")
                        .font(.headline)
                        .foregroundColor(priceHighlight.color)
                }

                Spacer()

                Text(item.Datum.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            HStack {
                Text(item.Shop)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                Text(item.Category)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color.secondary.opacity(0.2))
                    .clipShape(Capsule())
            }
        }
        .padding(.vertical, 2)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityDescription)
    }

    private var accessibilityDescription: String {
        let priceString =
            currencyFormatter.string(from: item.Price as NSDecimalNumber) ?? "unbekannter Preis"
        let dateString = item.Datum.formatted(date: .abbreviated, time: .omitted)
        let highlightString =
            priceHighlight != .none ? ", \(priceHighlight.accessibilityDescription)" : ""

        return
            "Eintrag vom \(dateString), \(priceString)\(highlightString), gekauft bei \(item.Shop), Kategorie \(item.Category)"
    }
}
