//
//  PriceIndicatorBadge.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import SwiftData
import SwiftUI

struct PriceIndicatorBadge: View {
    enum PriceType {
        case highest
        case lowest

        var color: Color {
            switch self {
            case .highest: return .red
            case .lowest: return .green
            }
        }

        var systemImage: String {
            switch self {
            case .highest: return "arrow.up.circle.fill"
            case .lowest: return "arrow.down.circle.fill"
            }
        }

        var label: String {
            switch self {
            case .highest: return "Höchster"
            case .lowest: return "Niedrigster"
            }
        }
    }

    let type: PriceType
    let shop: String

    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: type.systemImage)
                .font(.caption2)
                .foregroundColor(type.color)

            Text(shop)
                .font(.caption2)
                .fontWeight(.medium)
                .foregroundColor(type.color)
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(type.color.opacity(0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(type.color.opacity(0.3), lineWidth: 0.5)
        )
        .accessibilityLabel("\(type.label) Preis bei \(shop)")
    }
}