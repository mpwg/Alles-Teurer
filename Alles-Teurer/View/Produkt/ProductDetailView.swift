//
//  ProductDetailView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//

import Charts
import SwiftData
import SwiftUI

struct ProductDetailView: View {
    let productName: String
    let items: [Rechnungszeile]
    let onDelete: ([Rechnungszeile]) async -> Void

    @Environment(\.modelContext) private var modelContext
    @State private var viewModel: ProductDetailViewModel?



    var body: some View {
        Group {
            if let viewModel = viewModel {
                if viewModel.isLoading {
                    ProgressView("Daten werden geladen...")
                } else if viewModel.sortedItems.isEmpty {
                    ContentUnavailableView(
                        "Keine Einträge",
                        systemImage: "cart",
                        description: Text("Für dieses Produkt wurden noch keine Einkäufe erfasst.")
                    )
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            // Price Trend Chart Section
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Preisverlauf")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                if viewModel.sortedItems.count > 1 {
                                    Chart {
                                        ForEach(viewModel.chartData) { dataPoint in
                                            BarMark(
                                                x: .value("Datum", dataPoint.date),
                                                y: .value("Preis", dataPoint.price)
                                            )
                                            .foregroundStyle(Color.accentColor)
                                            .cornerRadius(4)
                                        }
                                    }
                                    .frame(height: 200)
                                    .chartYAxis {
                                        AxisMarks(position: .leading) { value in
                                            AxisGridLine()
                                            AxisTick()
                                            AxisValueLabel {
                                                if let price = value.as(Decimal.self) {
                                                    Text(CurrencyFormatter.format(price))
                                                        .font(.caption)
                                                }
                                            }
                                        }
                                    }
                                    .chartXAxis {
                                        AxisMarks(position: .bottom) { value in
                                            AxisGridLine()
                                            AxisTick()
                                            AxisValueLabel {
                                                if let date = value.as(Date.self) {
                                                    Text(date, format: .dateTime.day().month())
                                                        .font(.caption)
                                                }
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                } else {
                                    Text("Mindestens 2 Einträge benötigt für Diagramm")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                        .padding(.horizontal)
                                }
                            }
                            .padding(.vertical)
                            .background(Color(.systemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                            .padding(.horizontal)
                            
                            // Statistics Section
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Statistiken")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                LazyVGrid(columns: [
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                                ], spacing: 12) {
                                    StatisticCard(
                                        title: "Durchschnitt",
                                        value: CurrencyFormatter.format(viewModel.averagePrice),
                                        icon: "chart.bar",
                                        color: .blue
                                    )
                                    
                                    StatisticCard(
                                        title: "Niedrigster",
                                        value: CurrencyFormatter.format(viewModel.lowestPrice),
                                        icon: "arrow.down.circle.fill",
                                        color: .green
                                    )
                                    
                                    StatisticCard(
                                        title: "Höchster",
                                        value: CurrencyFormatter.format(viewModel.highestPrice),
                                        icon: "arrow.up.circle.fill",
                                        color: .red
                                    )
                                }
                                .padding(.horizontal)
                            }
                            .padding(.vertical)
                            
                            // Purchase History List
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Kaufhistorie")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                LazyVStack(spacing: 8) {
                                    ForEach(viewModel.sortedItems) { item in
                                        RechnungsZeileView(
                                            item: item,
                                            priceRange: viewModel.priceRange,
                                            onEdit: { editItem in
                                                viewModel.showingEditSheet = true
                                                viewModel.itemToEdit = editItem
                                            }
                                        )
                                        .padding(.horizontal)
                                    }
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                }
            } else {
                ProgressView("Initialisierung...")
            }
        }
        .navigationTitle(productName)
        .toolbar {
            if let viewModel = viewModel {
                SortToolbar(
                    viewModel: viewModel,
                    sortOption: Binding(
                        get: { viewModel.sortOption },
                        set: { viewModel.setSortOption($0) }
                    ),
                    sortOrder: Binding(
                        get: { viewModel.sortOrder },
                        set: { viewModel.setSortOrder($0) }
                    )
                )
            }
        }
        .task {
            // Initialize viewModel immediately without delay
            viewModel = ProductDetailViewModel(
                productName: productName,
                items: items,
                modelContext: modelContext
            )
        }
        .onChange(of: items) { _, newItems in
            viewModel?.updateItems(newItems)
        }
        .onChange(of: productName) { _, newProductName in
            viewModel = ProductDetailViewModel(
                productName: newProductName,
                items: items,
                modelContext: modelContext
            )
        }
        .sheet(isPresented: Binding(
            get: { viewModel?.showingEditSheet ?? false },
            set: { _ in viewModel?.showingEditSheet = false }
        )) {
            if let viewModel = viewModel, let itemToEdit = viewModel.itemToEdit {
                NavigationStack {
                    EditRechnungszeileView(item: itemToEdit) { updatedItem in
                        Task {
                            await viewModel.updateItem(updatedItem)
                        }
                    }
                }
            }
        }
        .alert("Fehler", isPresented: .constant(viewModel?.errorMessage != nil)) {
            Button("OK") {
                viewModel?.dismissError()
            }
        } message: {
            if let errorMessage = viewModel?.errorMessage {
                Text(errorMessage)
            }
        }
    }
}

// MARK: - Supporting Views



#Preview("Mit Einträgen") {
    NavigationStack {
        ProductDetailView(
            productName: "Milch",
            items: SampleData.sampleRechnungszeilen,
            onDelete: { _ in }
        )
    }
}

#Preview("Leer") {
    NavigationStack {
        ProductDetailView(
            productName: "Brot",
            items: [],
            onDelete: { _ in }
        )
    }
}
