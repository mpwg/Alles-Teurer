//
//  SortOption.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//

import Foundation
import SwiftData
import SwiftUI

enum SortOption: String, CaseIterable {
    case price = "price"
    case date = "date"
    case shop = "shop"

    var displayName: String {
        switch self {
        case .price:
            return "Preis"
        case .date:
            return "Datum"
        case .shop:
            return "Geschäft"
        }
    }
}

