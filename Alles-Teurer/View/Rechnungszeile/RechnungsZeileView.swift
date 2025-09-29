//
//  ItemRowView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//

import SwiftData
import SwiftUI

struct RechnungsZeileView: View {
    let item: Rechnungszeile
    let priceRange: (min: Decimal, max: Decimal)?

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
                    HStack {
                        
                        Text(CurrencyFormatter.format(item.Price, currency: item.Currency))
                            .font(.headline)
                            .foregroundColor(priceHighlight.color)
                        Text("\(item.NormalizedName)")
                            .font(.headline)
                            .foregroundColor(.primary)

                    }
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
        let priceString = CurrencyFormatter.format(item.Price, currency: item.Currency)
        let dateString = item.Datum.formatted(date: .abbreviated, time: .omitted)
        let highlightString =
            priceHighlight != .none ? ", \(priceHighlight.accessibilityDescription)" : ""

        return
            "Eintrag vom \(dateString), \(priceString)\(highlightString), gekauft bei \(item.Shop), Kategorie \(item.Category)"
    }
}

#Preview("Standard Item") {
    let sampleItem = Rechnungszeile(
        Name: "Milch 1L",
        Price: 1.49,
        Category: "Lebensmittel",
        Shop: "Billa",
        Datum: Date(),
        NormalizedName: "Milch",
        PricePerUnit: 1.49
    )

    return RechnungsZeileView(
        item: sampleItem,
        priceRange: nil
    )
    .padding()
}

#Preview("Cheapest Item") {
    let cheapItem = Rechnungszeile(
        Name: "Milch 1L",
        Price: 1.29,
        Category: "Lebensmittel",
        Shop: "Hofer",
        Datum: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(),
        NormalizedName: "Milch",
        PricePerUnit: 1.29
    )

    return RechnungsZeileView(
        item: cheapItem,
        priceRange: (min: 1.29, max: 1.89)
    )
    .padding()
}

#Preview("Most Expensive Item") {
    let expensiveItem = Rechnungszeile(
        Name: "Bio-Milch 1L",
        Price: 1.89,
        Category: "Bio-Lebensmittel",
        Shop: "Merkur",
        Datum: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(),
        NormalizedName: "Milch",
        PricePerUnit: 1.89
    )

    return RechnungsZeileView(
        item: expensiveItem,
        priceRange: (min: 1.29, max: 1.89)
    )
    .padding()
}

#Preview("All States in List") {
    let items = [
        Rechnungszeile(
            Name: "Milch 1L", Price: 1.29, Category: "Lebensmittel", Shop: "Hofer", Datum: Date(), NormalizedName: "Milch", PricePerUnit: 1.29
        ),
        Rechnungszeile(
            Name: "Milch 1L", Price: 1.49, Category: "Lebensmittel", Shop: "Billa", Datum: Date(), NormalizedName: "Milch", PricePerUnit: 1.49
        ),
        Rechnungszeile(
            Name: "Bio-Milch 1L", Price: 1.89, Category: "Bio", Shop: "Merkur", Datum: Date(), NormalizedName: "Milch", PricePerUnit: 1.89
        ),
    ]

    return List(items, id: \.id) { item in
        RechnungsZeileView(
            item: item,
            priceRange: (min: 1.29, max: 1.89)
        )
    }
}
