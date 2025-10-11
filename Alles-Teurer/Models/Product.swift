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
    var bestPricePerQuantity: Double = 0.0
    var bestPriceStore: String = ""
    var highestPricePerQuantity: Double = 0.0
    var highestPriceStore: String = ""
    var unit: String = "" // "l", "kg", "stück", etc.
    var lastUpdated: Date = Date()
    
    @Relationship(deleteRule: .cascade, inverse: \Purchase.product)
    var purchases: [Purchase]? = []
    
    init(normalizedName: String, bestPricePerQuantity: Double, bestPriceStore: String, highestPricePerQuantity: Double, highestPriceStore: String, unit: String) {
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
        return String(format: "€%.2f/%@", bestPricePerQuantity, unit)
    }
    
    var highestPriceFormatted: String {
        return String(format: "€%.2f/%@", highestPricePerQuantity, unit)
    }
    
    var priceDifference: Double {
        return highestPricePerQuantity - bestPricePerQuantity
    }
    
    var priceDifferenceFormatted: String {
        return String(format: "+€%.2f/%@", priceDifference, unit)
    }
}