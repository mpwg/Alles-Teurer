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

                    Text(currencyFormatter.string(from: item.Price as NSNumber) ?? "€?,??")
                        .font(.headline)
                        .foregroundColor(priceHighlight.color)
                }

                Spacer()

                Image(systemName: "calendar")
                Text(item.Datum.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            HStack {
                Image(systemName: "storefront")
                Text(item.Shop)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                
                Text("(\(item.Name))")
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

#Preview("Standard Item") {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "EUR"
    formatter.locale = Locale(identifier: "de_AT")

    let sampleItem = Rechnungszeile(
        Name: "Milch 1L",
        Price: 1.49,
        Category: "Lebensmittel",
        Shop: "Billa",
        Datum: Date()
    )

    return ItemRowView(
        item: sampleItem,
        priceRange: nil,
        currencyFormatter: formatter
    )
    .padding()
}

#Preview("Cheapest Item") {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "EUR"
    formatter.locale = Locale(identifier: "de_AT")

    let cheapItem = Rechnungszeile(
        Name: "Milch 1L",
        Price: 1.29,
        Category: "Lebensmittel",
        Shop: "Hofer",
        Datum: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()
    )

    return ItemRowView(
        item: cheapItem,
        priceRange: (min: 1.29, max: 1.89),
        currencyFormatter: formatter
    )
    .padding()
}

#Preview("Most Expensive Item") {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "EUR"
    formatter.locale = Locale(identifier: "de_AT")

    let expensiveItem = Rechnungszeile(
        Name: "Bio-Milch 1L",
        Price: 1.89,
        Category: "Bio-Lebensmittel",
        Shop: "Merkur",
        Datum: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
    )

    return ItemRowView(
        item: expensiveItem,
        priceRange: (min: 1.29, max: 1.89),
        currencyFormatter: formatter
    )
    .padding()
}

#Preview("All States in List") {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "EUR"
    formatter.locale = Locale(identifier: "de_AT")

    let items = [
        Rechnungszeile(
            Name: "Milch 1L", Price: 1.29, Category: "Lebensmittel", Shop: "Hofer", Datum: Date()),
        Rechnungszeile(
            Name: "Milch 1L", Price: 1.49, Category: "Lebensmittel", Shop: "Billa", Datum: Date()),
        Rechnungszeile(
            Name: "Bio-Milch 1L", Price: 1.89, Category: "Bio", Shop: "Merkur", Datum: Date()),
    ]

    return List(items, id: \.id) { item in
        ItemRowView(
            item: item,
            priceRange: (min: 1.29, max: 1.89),
            currencyFormatter: formatter
        )
    }
}
