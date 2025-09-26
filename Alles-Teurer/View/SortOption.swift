//
//  SortOption.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import SwiftData
import SwiftUI

enum SortOption: CaseIterable {
    case price, date, shop

    var title: String {
        switch self {
        case .price: return "Preis"
        case .date: return "Datum"
        case .shop: return "Geschäft"
        }
    }
}