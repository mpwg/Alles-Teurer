//
//  Product.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import Foundation
import SwiftData

@Model
final class Product {
    var normalizedName: String = ""
    var bestPricePerQuantity: Decimal = 0.0
    var bestPriceStore: String = ""
    var highestPricePerQuantity: Decimal = 0.0
    var highestPriceStore: String = ""
    var unit: String = "" // "l", "kg", "stück", etc.
    var lastUpdated: Date = Date()
    
    @Relationship(deleteRule: .cascade, inverse: \Purchase.product)
    var purchases: [Purchase]? = []
    
    init(normalizedName: String, bestPricePerQuantity: Decimal, bestPriceStore: String, highestPricePerQuantity: Decimal, highestPriceStore: String, unit: String) {
        self.normalizedName = normalizedName
        self.bestPricePerQuantity = bestPricePerQuantity
        self.bestPriceStore = bestPriceStore
        self.highestPricePerQuantity = highestPricePerQuantity
        self.highestPriceStore = highestPriceStore
        self.unit = unit
        self.lastUpdated = Date()
        self.purchases = []
    }
    
    var bestPriceFormatted: String {
        return String(format: "€%.2f/%@", NSDecimalNumber(decimal: bestPricePerQuantity).doubleValue, unit)
    }
    
    var highestPriceFormatted: String {
        return String(format: "€%.2f/%@", NSDecimalNumber(decimal: highestPricePerQuantity).doubleValue, unit)
    }
    
    var priceDifference: Decimal {
        return highestPricePerQuantity - bestPricePerQuantity
    }
    
    var priceDifferenceFormatted: String {
        return String(format: "+€%.2f/%@", NSDecimalNumber(decimal: priceDifference).doubleValue, unit)
    }
}