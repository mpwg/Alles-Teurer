//
//  ContentView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 25.09.25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Rechnungszeile]

    @State private var viewModel: ContentViewModel?
    @State private var isGeneratingTestData = false
    @State private var showTestDataAlert = false

    var body: some View {
        NavigationSplitView {
            // Master: List of unique product names
            if let viewModel = viewModel {
                ProductNamesListView(
                    productNames: viewModel.uniqueProductNames(from: items),
                    selectedProductName: Binding(
                        get: { viewModel.selectedProductName },
                        set: { viewModel.selectedProductName = $0 }
                    ),
                    onGenerateTestData: {
                        print("Test data generation triggered from empty state")
                        isGeneratingTestData = true
                        generateTestDataDirectly()
                        isGeneratingTestData = false
                        showTestDataAlert = true
                    }
                )
                .navigationTitle("Produkte")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {

                            Button("Test Daten") {
                                print("Test Daten button tapped")
                                isGeneratingTestData = true
                                generateTestDataDirectly()
                                isGeneratingTestData = false
                                showTestDataAlert = true
                                print("Test data generation completed")
                        }
                    }
                }
            } else {
                ProgressView("Loading...")
                    .navigationTitle("Produkte")
            }
        } detail: {
            // Detail: List of all items for selected product
            if let viewModel = viewModel,
                let selectedName = viewModel.selectedProductName
            {
                ProductDetailView(
                    productName: selectedName,
                    items: viewModel.items(for: selectedName, from: items),
                    onDelete: viewModel.deleteItems
                )
            } else {
                ContentUnavailableView(
                    "Kein Produkt ausgewählt",
                    systemImage: "list.bullet.rectangle",
                    description: Text(
                        "Wählen Sie ein Produkt aus der Liste, um Details anzuzeigen.")
                )
            }
        }
        .onAppear {
            // Initialize viewModel with the actual modelContext when view appears
            if viewModel == nil {
                viewModel = ContentViewModel(modelContext: modelContext)
            }
        }
        .alert("Test Daten generiert!", isPresented: $showTestDataAlert) {
            Button("OK") {}
        } message: {
            Text(
                "Testdaten wurden erfolgreich erstellt. Sie können nun die Produkte in der Liste sehen."
            )
        }
    }

    private func generateTestDataDirectly() {
        print("generateTestDataDirectly() started")

        let testItems: [(String, String, Decimal)] = [
            ("Vollmilch 1L", "Milchprodukte", Decimal(1.29)),
            ("Semmel 6 Stück", "Backwaren", Decimal(2.40)),
            ("Leberkäse 200g", "Fleisch & Wurst", Decimal(3.99)),
            ("Erdäpfel 2kg", "Gemüse", Decimal(2.99)),
            ("Kaisersemmel", "Backwaren", Decimal(0.55)),
            ("Wiener Schnitzel 400g", "Fleisch & Wurst", Decimal(8.99)),
            ("Apfelmost 1L", "Getränke", Decimal(1.99)),
            ("Mozarella 125g", "Milchprodukte", Decimal(2.29)),
            ("Schwarzbrot", "Backwaren", Decimal(2.89)),
            ("Tomaten 500g", "Gemüse", Decimal(2.49)),
            ("Gurken 1 Stück", "Gemüse", Decimal(1.19)),
            ("Bergkäse 200g", "Milchprodukte", Decimal(4.99)),
            ("Speck 150g", "Fleisch & Wurst", Decimal(3.49)),
            ("Kaffee Melange", "Getränke", Decimal(4.20)),
            ("Sachertorte", "Süßwaren", Decimal(6.50)),
            ("Almdudler 0,5L", "Getränke", Decimal(1.79)),
            ("Leberwurst 100g", "Fleisch & Wurst", Decimal(2.69)),
            ("Topfen 250g", "Milchprodukte", Decimal(1.89)),
            ("Knödelbrot", "Backwaren", Decimal(1.99)),
            ("Paprika rot 1kg", "Gemüse", Decimal(3.99)),
        ]

        let austrianShops = [
            "Billa", "Spar", "Merkur", "Interspar", "Hofer", "Penny", "MPreis", "Nah&Frisch",
        ]

        // Generate 15-25 random items with some duplicates for better testing
        let numberOfItems = Int.random(in: 15...25)
        print("Generating \(numberOfItems) test items")

        for i in 0..<numberOfItems {
            let randomItem = testItems.randomElement()!
            let randomShop = austrianShops.randomElement()!

            // Generate random date within last 90 days
            let randomDays = Int.random(in: 0...90)
            let randomDate =
                Calendar.current.date(byAdding: .day, value: -randomDays, to: Date.now) ?? Date.now

            // Add some price variation (±20%)
            let basePrice = randomItem.2
            let variation = Decimal(Double.random(in: 0.8...1.2))
            let finalPrice = (basePrice * variation).rounded(2)

            let newItem = Rechnungszeile(
                Name: randomItem.0,
                Price: finalPrice,
                Category: randomItem.1,
                Shop: randomShop,
                Datum: randomDate,
                NormalizedName: randomItem.0,
                PricePerUnit: finalPrice
            )

            modelContext.insert(newItem)
            print("Created item \(i + 1): \(randomItem.0) - €\(finalPrice)")
        }

        do {
            try modelContext.save()
            print("Successfully saved \(numberOfItems) test items to database")
        } catch {
            print("Failed to save test data: \(error)")
        }
    }
}

// Extension to help with decimal rounding
extension Decimal {
    fileprivate func rounded(_ scale: Int) -> Decimal {
        var result = Decimal()
        var value = self
        NSDecimalRound(&result, &value, scale, .bankers)
        return result
    }
}

struct ProductNamesListView: View {
    let productNames: [String]
    @Binding var selectedProductName: String?
    let onGenerateTestData: () -> Void

    var body: some View {
        if productNames.isEmpty {
            VStack(spacing: 20) {
                ContentUnavailableView(
                    "Keine Produkte",
                    systemImage: "cart",
                    description: Text("Noch keine Einkäufe erfasst.")
                )

                Button("Test Daten generieren") {
                    onGenerateTestData()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .padding()
        } else {
            List(productNames, id: \.self, selection: $selectedProductName) { productName in
                Text(productName)
                    .accessibilityLabel("Produkt: \(productName)")
            }
            .listStyle(.sidebar)
        }
    }
}

struct ProductDetailView: View {
    let productName: String
    let items: [Rechnungszeile]
    let onDelete: ([Rechnungszeile]) -> Void

    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = Locale(identifier: "de_AT")
        return formatter
    }()

    var body: some View {
        List {
            ForEach(items) { item in
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(
                            currencyFormatter.string(from: item.Price as NSDecimalNumber) ?? "€0,00"
                        )
                        .font(.headline)
                        .foregroundColor(.primary)

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
                .accessibilityLabel(
                    "Eintrag vom \(item.Datum.formatted(date: .abbreviated, time: .omitted)), \(currencyFormatter.string(from: item.Price as NSDecimalNumber) ?? "unbekannter Preis"), gekauft bei \(item.Shop)"
                )
            }
            .onDelete { indexSet in
                let itemsToDelete = indexSet.map { items[$0] }
                onDelete(itemsToDelete)
            }
        }
        .navigationTitle(productName)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            if !items.isEmpty {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        .overlay {
            if items.isEmpty {
                ContentUnavailableView(
                    "Keine Einträge",
                    systemImage: "cart",
                    description: Text("Für dieses Produkt wurden noch keine Einkäufe erfasst.")
                )
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Rechnungszeile.self, inMemory: true)
}
