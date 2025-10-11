//
//  MetricCardView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 11.10.25.
//

import SwiftUI

/// A reusable card component for displaying primary price metrics
struct PrimaryMetricCard: View {
    let title: String
    let value: String
    let subtitle: String
    let color: Color
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.title2)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(value)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(color)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 110, alignment: .leading)
        .padding()
        #if os(iOS)
        .background(Color(.systemGray6))
        #else
        .background(Color(NSColor.controlBackgroundColor))
        #endif
        .cornerRadius(12)
    }
}

/// A reusable card component for displaying secondary metrics
struct SecondaryMetricCard: View {
    let title: String
    let value: String
    let subtitle: String
    let color: Color
    let icon: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title2)
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(color)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 110, alignment: .leading)
        .padding()
        #if os(iOS)
        .background(Color(.systemGray6))
        #else
        .background(Color(NSColor.controlBackgroundColor))
        #endif
        .cornerRadius(12)
    }
}

/// A reusable card component for displaying statistical metrics
struct StatisticCard: View {
    let title: String
    let value: Double
    let isPercentage: Bool
    let color: Color
    
    init(title: String, value: Double, isPercentage: Bool = false, color: Color) {
        self.title = title
        self.value = value
        self.isPercentage = isPercentage
        self.color = color
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
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
        .frame(maxWidth: .infinity, minHeight: 90, alignment: .leading)
        .padding()
        #if os(iOS)
        .background(Color(.systemGray6))
        #else
        .background(Color(NSColor.controlBackgroundColor))
        #endif
        .cornerRadius(12)
    }
}

// MARK: - Previews

#Preview("Primary Metric Card") {
    VStack(spacing: 12) {
        HStack(spacing: 12) {
            PrimaryMetricCard(
                title: "Bester Preis",
                value: "€2,49/kg",
                subtitle: "bei Lidl",
                color: .green,
                icon: "arrow.down.circle.fill"
            )
            
            PrimaryMetricCard(
                title: "Teuerster Preis",
                value: "€3,99/kg",
                subtitle: "bei Merkur",
                color: .red,
                icon: "arrow.up.circle.fill"
            )
        }
    }
    .padding()
}

#Preview("Secondary Metric Card") {
    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 12) {
        SecondaryMetricCard(
            title: "Mögliche Ersparnis",
            value: "€1,50",
            subtitle: "60%",
            color: .orange,
            icon: "minus.circle.fill"
        )
        
        SecondaryMetricCard(
            title: "Einkäufe",
            value: "16",
            subtitle: "Transaktionen",
            color: .blue,
            icon: "cart.fill"
        )
    }
    .padding()
}

#Preview("Statistic Card") {
    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
        StatisticCard(title: "Durchschnitt", value: 3.33, color: .orange)
        StatisticCard(title: "Median", value: 3.39, color: .purple)
        StatisticCard(title: "Standardabweichung", value: 0.45, color: .indigo)
        StatisticCard(title: "Variationskoeffizient", value: 13.5, isPercentage: true, color: .pink)
    }
    .padding()
}
