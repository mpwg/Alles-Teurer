//
//  ProductDetailView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI
import Charts

extension Calendar {
    func startOfMonth(for date: Date) -> Date {
        let components = dateComponents([.year, .month], from: date)
        return self.date(from: components) ?? date
    }
}

struct ProductDetailView: View {
    let product: Product
    
    private var purchases: [Purchase] {
        product.purchases?.sorted(by: { $0.date < $1.date }) ?? []
    }
    
    private var priceStats: (min: Double, max: Double, avg: Double, median: Double) {
        guard !purchases.isEmpty else { return (0, 0, 0, 0) }
        let prices = purchases.map(\.pricePerQuantity).sorted()
        let min = prices.first ?? 0
        let max = prices.last ?? 0
        let avg = prices.reduce(0, +) / Double(prices.count)
        let median = prices.count % 2 == 0 
            ? (prices[prices.count/2-1] + prices[prices.count/2]) / 2
            : prices[prices.count/2]
        return (min, max, avg, median)
    }
    
    private var shopAnalysis: [(shop: String, count: Int, avgPrice: Double, minPrice: Double, maxPrice: Double)] {
        let shopGroups = Dictionary(grouping: purchases, by: \.shopName)
        return shopGroups.map { shop, purchaseList in
            let prices = purchaseList.map(\.pricePerQuantity)
            return (
                shop: shop,
                count: purchaseList.count,
                avgPrice: prices.reduce(0, +) / Double(prices.count),
                minPrice: prices.min() ?? 0,
                maxPrice: prices.max() ?? 0
            )
        }.sorted(by: { $0.avgPrice < $1.avgPrice })
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
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(product.normalizedName)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Key Metrics Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 16) {
                metricCard("Bester Preis", value: product.bestPriceFormatted, 
                          subtitle: "bei \(product.bestPriceStore)", color: .green, icon: "arrow.down.circle.fill")
                
                metricCard("Teuerster Preis", value: product.highestPriceFormatted, 
                          subtitle: "bei \(product.highestPriceStore)", color: .red, icon: "arrow.up.circle.fill")
                
                let savingsAmount = product.priceDifference
                metricCard("Mögliche Ersparnis", value: savingsAmount.formatted(.currency(code: "EUR")), 
                          subtitle: "\(Int((savingsAmount / product.bestPricePerQuantity) * 100))%", color: .orange, icon: "minus.circle.fill")
                
                metricCard("Einkäufe", value: "\(purchases.count)", 
                          subtitle: "Transaktionen", color: .blue, icon: "cart.fill")
            }
        }
    }
    
    private func metricCard(_ title: String, value: String, subtitle: String, color: Color, icon: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.title3)
                Spacer()
            }
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.primary)
            
            Text(subtitle)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
        .padding()
        #if os(iOS)
        .background(Color(.systemGray6))
        #else
        .background(Color(NSColor.controlBackgroundColor))
        #endif
        .cornerRadius(12)
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
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(12)
        }
    }
    
    private var statisticalAnalysisSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            chartHeader("Statistische Analyse", icon: "function", color: .purple)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                statisticBox("Durchschnitt", value: priceStats.avg, color: .orange)
                statisticBox("Median", value: priceStats.median, color: .purple)
                statisticBox("Standardabweichung", 
                           value: calculateStandardDeviation(), color: .indigo)
                statisticBox("Variationskoeffizient", 
                           value: (calculateStandardDeviation() / priceStats.avg) * 100, 
                           isPercentage: true, color: .pink)
            }
        }
    }
    
    private func statisticBox(_ title: String, value: Double, isPercentage: Bool = false, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            
            if isPercentage {
                Text("\(value, format: .number.precision(.fractionLength(1)))%")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            } else {
                Text(value.formatted(.currency(code: "EUR")))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }
        }
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(8)
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
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(12)
        }
    }
    
    private var priceDistributionChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            chartHeader("Preisverteilung", icon: "chart.bar.fill", color: .teal)
            
            let priceRanges = createPriceRanges()
            
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
            .background(Color(NSColor.controlBackgroundColor))
            .cornerRadius(12)
        }
    }
    
    private var monthlySpendingChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            chartHeader("Monatliche Ausgaben", icon: "calendar", color: .mint)
            
            let monthlyData = createMonthlyData()
            
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
            .background(Color(NSColor.controlBackgroundColor))
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
    
    private func calculateStandardDeviation() -> Double {
        guard !purchases.isEmpty else { return 0 }
        let prices = purchases.map(\.pricePerQuantity)
        let mean = priceStats.avg
        let squaredDiffs = prices.map { pow($0 - mean, 2) }
        let variance = squaredDiffs.reduce(0, +) / Double(prices.count)
        return sqrt(variance)
    }
    
    private func createPriceRanges() -> [(range: String, count: Int)] {
        guard !purchases.isEmpty else { return [] }
        
        let prices = purchases.map(\.pricePerQuantity)
        let minPrice = prices.min() ?? 0
        let maxPrice = prices.max() ?? 0
        let rangeSize = (maxPrice - minPrice) / 5
        
        var ranges: [(range: String, count: Int)] = []
        
        for i in 0..<5 {
            let start = minPrice + Double(i) * rangeSize
            let end = minPrice + Double(i + 1) * rangeSize
            let count = prices.filter { $0 >= start && $0 < (i == 4 ? end + 0.01 : end) }.count
            
            ranges.append((
                range: "\(start.formatted(.currency(code: "EUR"))) - \(end.formatted(.currency(code: "EUR")))",
                count: count
            ))
        }
        
        return ranges
    }
    
    private func createMonthlyData() -> [(month: Date, totalSpent: Double)] {
        let calendar = Calendar.current
        let monthlyGroups = Dictionary(grouping: purchases) { purchase in
            calendar.startOfMonth(for: purchase.date)
        }
        
        return monthlyGroups.map { month, purchaseList in
            let totalSpent = purchaseList.map { $0.totalPrice }.reduce(0, +)
            return (month: month, totalSpent: totalSpent)
        }.sorted(by: { $0.month < $1.month })
    }
}



#Preview {
    NavigationStack {
        ProductDetailView(product: TestData.sampleProducts[0])
    }
}