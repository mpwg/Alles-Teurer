//
//  PriceHighlight.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import SwiftData
import SwiftUI

enum PriceHighlight {
    case none, cheapest, expensive

    var color: Color {
        switch self {
        case .none: return .primary
        case .cheapest: return .green
        case .expensive: return .red
        }
    }

    var iconName: String {
        switch self {
        case .none: return ""
        case .cheapest: return "arrow.down.circle.fill"
        case .expensive: return "arrow.up.circle.fill"
        }
    }

    var accessibilityLabel: String {
        switch self {
        case .none: return ""
        case .cheapest: return "günstigster Preis"
        case .expensive: return "teuerster Preis"
        }
    }

    var accessibilityDescription: String {
        switch self {
        case .none: return ""
        case .cheapest: return "günstigster Preis für dieses Produkt"
        case .expensive: return "teuerster Preis für dieses Produkt"
        }
    }
}