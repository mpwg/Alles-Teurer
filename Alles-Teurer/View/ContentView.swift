//
//  ContentView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 25.09.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Rechnungszeile]
    
    @State private var viewModel: ContentViewModel?
    
    var body: some View {
        NavigationSplitView {
            // Master: List of unique product names
            if let viewModel = viewModel {
                ProductNamesListView(
                    productNames: viewModel.uniqueProductNames(from: items),
                    selectedProductName: Binding(
                        get: { viewModel.selectedProductName },
                        set: { viewModel.selectedProductName = $0 }
                    )
                )
                .navigationTitle("Produkte")
                .toolbar {
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button("Test Daten", action: viewModel.generateTestData)
                        Button("Hinzufügen", action: viewModel.addItem)
                    }
                }
            } else {
                ProgressView("Loading...")
                    .navigationTitle("Produkte")
            }
        } detail: {
            // Detail: List of all items for selected product
            if let viewModel = viewModel,
               let selectedName = viewModel.selectedProductName {
                ProductDetailView(
                    productName: selectedName,
                    items: viewModel.items(for: selectedName, from: items),
                    onDelete: viewModel.deleteItems
                )
            } else {
                ContentUnavailableView(
                    "Kein Produkt ausgewählt",
                    systemImage: "list.bullet.rectangle",
                    description: Text("Wählen Sie ein Produkt aus der Liste, um Details anzuzeigen.")
                )
            }
        }
        .onAppear {
            // Initialize viewModel with the actual modelContext when view appears
            if viewModel == nil {
                viewModel = ContentViewModel(modelContext: modelContext)
            }
        }
    }
}

struct ProductNamesListView: View {
    let productNames: [String]
    @Binding var selectedProductName: String?
    
    var body: some View {
        List(productNames, id: \.self, selection: $selectedProductName) { productName in
            Text(productName)
                .accessibilityLabel("Produkt: \(productName)")
        }
        .listStyle(.sidebar)
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
                        Text(currencyFormatter.string(from: item.Price as NSDecimalNumber) ?? "€0,00")
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
                .accessibilityLabel("Eintrag vom \(item.Datum.formatted(date: .abbreviated, time: .omitted)), \(currencyFormatter.string(from: item.Price as NSDecimalNumber) ?? "unbekannter Preis"), gekauft bei \(item.Shop)")
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
