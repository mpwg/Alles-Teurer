import SwiftUI

struct ProductRowView: View {
    let productName: String
    let items: [Rechnungszeile]

    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = Locale(identifier: "de_AT")
        return formatter
    }()

    private var latestItem: Rechnungszeile? {
        items.max(by: { $0.Datum < $1.Datum })
    }

    private var priceRange: (min: Decimal, max: Decimal)? {
        guard !items.isEmpty else { return nil }
        let prices = items.map { $0.Price }
        return (min: prices.min() ?? 0, max: prices.max() ?? 0)
    }

    private var priceChangeInfo: (change: Decimal, isIncrease: Bool)? {
        guard items.count >= 2 else { return nil }
        let sortedByDate = items.sorted { $0.Datum < $1.Datum }
        let oldest = sortedByDate.first!.Price
        let newest = sortedByDate.last!.Price
        let change = newest - oldest
        return (change: abs(change), isIncrease: change > 0)
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(productName)
                    .font(.headline)
                    .accessibilityLabel("Produkt: \(productName)")

                if let latest = latestItem {
                    Text(latest.Shop)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .accessibilityLabel("Letztes Geschäft: \(latest.Shop)")
                }

                Text("\(items.count) Einträge")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .accessibilityLabel("\(items.count) Einträge vorhanden")
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                if let latest = latestItem {
                    Text(currencyFormatter.string(from: latest.Price as NSDecimalNumber) ?? "€0,00")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .accessibilityLabel(
                            "Aktueller Preis: \(currencyFormatter.string(from: latest.Price as NSDecimalNumber) ?? "0 Euro")"
                        )
                }

                if let range = priceRange, range.min != range.max {
                    HStack(spacing: 4) {
                        Text(
                            currencyFormatter.string(from: range.min as NSDecimalNumber) ?? "€0,00")
                        Text("-")
                        Text(
                            currencyFormatter.string(from: range.max as NSDecimalNumber) ?? "€0,00")
                    }
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .accessibilityLabel(
                        "Preisspanne: von \(currencyFormatter.string(from: range.min as NSDecimalNumber) ?? "0 Euro") bis \(currencyFormatter.string(from: range.max as NSDecimalNumber) ?? "0 Euro")"
                    )
                }

                if let changeInfo = priceChangeInfo {
                    HStack(spacing: 2) {
                        Image(systemName: changeInfo.isIncrease ? "arrow.up" : "arrow.down")
                            .font(.caption)
                        Text(
                            currencyFormatter.string(from: changeInfo.change as NSDecimalNumber)
                                ?? "€0,00"
                        )
                        .font(.caption)
                    }
                    .foregroundStyle(changeInfo.isIncrease ? .red : .green)
                    .accessibilityLabel(
                        "Preisänderung: \(changeInfo.isIncrease ? "Anstieg" : "Rückgang") um \(currencyFormatter.string(from: changeInfo.change as NSDecimalNumber) ?? "0 Euro")"
                    )
                }
            }
        }
        .padding(.vertical, 2)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    List {
        ProductRowView(
            productName: "Milch",
            items: SampleData.groupedSampleData["Milch"] ?? []
        )

        ProductRowView(
            productName: "Brot",
            items: SampleData.groupedSampleData["Brot"] ?? []
        )

        ProductRowView(
            productName: "Äpfel",
            items: SampleData.groupedSampleData["Äpfel"] ?? []
        )
    }
}
