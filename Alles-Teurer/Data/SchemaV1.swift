//
//  SchemaV1.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 03.11.25.
//

import Foundation
import SwiftData

/// Schema Version 1: Original schema using Double for prices and quantities
enum SchemaV1: VersionedSchema {
    static let versionIdentifier = Schema.Version(1, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [ProductV1.self, PurchaseV1.self]
    }
    
    @Model
    final class ProductV1 {
        var normalizedName: String
        var bestPricePerQuantity: Double
        var bestPriceStore: String
        var highestPricePerQuantity: Double
        var highestPriceStore: String
        var unit: String
        var lastUpdated: Date
        
        @Relationship(deleteRule: .cascade, inverse: \PurchaseV1.product)
        var purchases: [PurchaseV1]?
        
        init(
            normalizedName: String,
            bestPricePerQuantity: Double,
            bestPriceStore: String,
            highestPricePerQuantity: Double,
            highestPriceStore: String,
            unit: String
        ) {
            self.normalizedName = normalizedName
            self.bestPricePerQuantity = bestPricePerQuantity
            self.bestPriceStore = bestPriceStore
            self.highestPricePerQuantity = highestPricePerQuantity
            self.highestPriceStore = highestPriceStore
            self.unit = unit
            self.lastUpdated = Date()
        }
    }
    
    @Model
    final class PurchaseV1 {
        var shopName: String
        var date: Date
        var totalPrice: Double
        var quantity: Double
        var actualProductName: String
        var unit: String
        
        var product: ProductV1?
        
        init(
            shopName: String,
            date: Date,
            totalPrice: Double,
            quantity: Double,
            actualProductName: String,
            unit: String
        ) {
            self.shopName = shopName
            self.date = date
            self.totalPrice = totalPrice
            self.quantity = quantity
            self.actualProductName = actualProductName
            self.unit = unit
        }
    }
}
