//
//  ProductDetailView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI
import SwiftData
import Charts

extension Calendar {
    func startOfMonth(for date: Date) -> Date {
        let components = dateComponents([.year, .month], from: date)
        return self.date(from: components) ?? date
    }
}

struct ProductDetailView: View {
    let product: Product
    let viewModel: ProductViewModel
    
    private var purchases: [Purchase] {
        viewModel.purchases(for: product)
    }
    
    private var priceStats: (min: Double, max: Double, avg: Double, median: Double) {
        viewModel.priceStats(for: product)
    }
    
    private var shopAnalysis: [(shop: String, count: Int, avgPrice: Double, minPrice: Double, maxPrice: Double)] {
        viewModel.shopAnalysis(for: product)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header with Key Metrics
                headerSection
                
                if !purchases.isEmpty {
                    // Price Trend Chart
                    priceTimelineChart
                    
                    // Statistical Analysis
                    statisticalAnalysisSection
                    
                    // Shop Comparison Chart
                    shopComparisonChart
                    
                    // Price Distribution Chart
                    priceDistributionChart
                    
                    // Monthly Spending Analysis
                    monthlySpendingChart
                }
            }
            .padding()
        }
        .navigationTitle(product.normalizedName)
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
        .toolbar {
            #if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: PurchaseListView(product: product, productViewModel: viewModel, modelContext: viewModel.modelContext)) {
                    Image(systemName: "list.bullet")
                        .accessibilityLabel("Einkaufsliste anzeigen")
                }
            }
            #else
            ToolbarItem(placement: .primaryAction) {
                NavigationLink(destination: PurchaseListView(product: product, productViewModel: viewModel, modelContext: viewModel.modelContext)) {
                    Image(systemName: "list.bullet")
                        .accessibilityLabel("Einkaufsliste anzeigen")
                }
            }
            #endif
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Primary Price Cards (Prominent)
            HStack(spacing: 12) {
                PrimaryMetricCard(
                    title: "Bester Preis", 
                    value: product.bestPriceFormatted, 
                    subtitle: "bei \(product.bestPriceStore)", 
                    color: .green, 
                    icon: "arrow.down.circle.fill"
                )
                
                PrimaryMetricCard(
                    title: "Teuerster Preis", 
                    value: product.highestPriceFormatted, 
                    subtitle: "bei \(product.highestPriceStore)", 
                    color: .red, 
                    icon: "arrow.up.circle.fill"
                )
            }
            
            // Secondary Metrics Grid (2 columns for better mobile layout)
            let savingsAmount = product.priceDifference
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 12) {
                SecondaryMetricCard(
                    title: "Mögliche Ersparnis", 
                    value: savingsAmount.formatted(.currency(code: "EUR")), 
                    subtitle: "\(Int((savingsAmount / product.bestPricePerQuantity) * 100))%", 
                    color: .orange, 
                    icon: "minus.circle.fill"
                )
                
                SecondaryMetricCard(
                    title: "Einkäufe", 
                    value: "\(purchases.count)", 
                    subtitle: "Transaktionen", 
                    color: .blue, 
                    icon: "cart.fill"
                )
            }
        }
    }
    
    private var priceTimelineChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            chartHeader("Preisentwicklung", icon: "chart.line.uptrend.xyaxis", color: .blue)
            
            Chart(purchases) { purchase in
                LineMark(
                    x: .value("Datum", purchase.date),
                    y: .value("Preis", purchase.pricePerQuantity)
                )
                .foregroundStyle(.blue)
                .lineStyle(StrokeStyle(lineWidth: 3))
                
                PointMark(
                    x: .value("Datum", purchase.date),
                    y: .value("Preis", purchase.pricePerQuantity)
                )
                .foregroundStyle(purchase.pricePerQuantity == priceStats.min ? .green : 
                               purchase.pricePerQuantity == priceStats.max ? .red : .blue)
                .symbolSize(100)
                
                // Best price line
                RuleMark(y: .value("Bester Preis", priceStats.min))
                    .foregroundStyle(.green)
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5, 3]))
                
                // Worst price line
                RuleMark(y: .value("Teuerster Preis", priceStats.max))
                    .foregroundStyle(.red)
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5, 3]))
                
                // Average line
                RuleMark(y: .value("Durchschnitt", priceStats.avg))
                    .foregroundStyle(.orange)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [2, 2]))
            }
            .frame(height: 200)
            .chartYAxis {
                AxisMarks(position: .leading) { value in
                    AxisGridLine()
                    AxisValueLabel {
                        if let price = value.as(Double.self) {
                            Text(price.formatted(.currency(code: "EUR")))
                        }
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
    
    private var statisticalAnalysisSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            chartHeader("Statistische Analyse", icon: "function", color: .purple)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                StatisticCard(title: "Durchschnitt", value: priceStats.avg, color: .orange)
                StatisticCard(title: "Median", value: priceStats.median, color: .purple)
                StatisticCard(title: "Standardabweichung", 
                           value: viewModel.calculateStandardDeviation(for: product), color: .indigo)
                StatisticCard(title: "Variationskoeffizient", 
                           value: (viewModel.calculateStandardDeviation(for: product) / priceStats.avg) * 100, 
                           isPercentage: true, color: .pink)
            }
        }
    }
    
    private var shopComparisonChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            chartHeader("Shop-Vergleich", icon: "storefront.fill", color: .green)
            
            Chart(shopAnalysis, id: \.shop) { shopData in
                BarMark(
                    x: .value("Shop", shopData.shop),
                    y: .value("Durchschnittspreis", shopData.avgPrice)
                )
                .foregroundStyle(shopData.shop == product.bestPriceStore ? .green :
                               shopData.shop == product.highestPriceStore ? .red : .blue)
                .opacity(0.8)
                
                BarMark(
                    x: .value("Shop", shopData.shop),
                    yStart: .value("Min", shopData.minPrice),
                    yEnd: .value("Max", shopData.maxPrice)
                )
                .foregroundStyle(.gray)
                .opacity(0.3)
            }
            .frame(height: 180)
            .chartYAxis {
                AxisMarks(position: .leading) { value in
                    AxisGridLine()
                    AxisValueLabel {
                        if let price = value.as(Double.self) {
                            Text(price.formatted(.currency(code: "EUR")))
                        }
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
    
    private var priceDistributionChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            chartHeader("Preisverteilung", icon: "chart.bar.fill", color: .teal)
            
            let priceRanges = viewModel.createPriceRanges(for: product)
            
            Chart(priceRanges, id: \.range) { rangeData in
                BarMark(
                    x: .value("Preisbereich", rangeData.range),
                    y: .value("Anzahl", rangeData.count)
                )
                .foregroundStyle(.teal)
                .opacity(0.8)
            }
            .frame(height: 150)
            .chartXAxis {
                AxisMarks { value in
                    AxisValueLabel()
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
    
    private var monthlySpendingChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            chartHeader("Monatliche Ausgaben", icon: "calendar", color: .mint)
            
            let monthlyData = viewModel.createMonthlyData(for: product)
            
            Chart(monthlyData, id: \.month) { monthData in
                AreaMark(
                    x: .value("Monat", monthData.month),
                    y: .value("Ausgaben", monthData.totalSpent)
                )
                .foregroundStyle(.mint.gradient)
                .opacity(0.6)
                
                LineMark(
                    x: .value("Monat", monthData.month),
                    y: .value("Ausgaben", monthData.totalSpent)
                )
                .foregroundStyle(.mint)
                .lineStyle(StrokeStyle(lineWidth: 3))
            }
            .frame(height: 160)
            .chartYAxis {
                AxisMarks(position: .leading) { value in
                    AxisGridLine()
                    AxisValueLabel {
                        if let spent = value.as(Double.self) {
                            Text(spent.formatted(.currency(code: "EUR")))
                        }
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
    
    private func chartHeader(_ title: String, icon: String, color: Color) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title2)
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    let config = SwiftData.ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! SwiftData.ModelContainer(for: Product.self, configurations: config)
    let context = container.mainContext
    let viewModel = ProductViewModel(modelContext: context)
    
    NavigationStack {
        ProductDetailView(product: TestData.sampleProducts[0], viewModel: viewModel)
    }
}