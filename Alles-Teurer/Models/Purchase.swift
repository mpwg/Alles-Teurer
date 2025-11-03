//
//  Purchase.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import Foundation
import SwiftData

@Model
final class Purchase {
    var shopName: String = ""
    var date: Date = Date()
    var totalPrice: Decimal = 0.0 // Total price paid
    var quantity: Decimal = 0.0 // Quantity purchased
    var actualProductName: String = "" // Name as it appears in the shop
    var unit: String = ""
    var product: Product?
    
    init(shopName: String, date: Date, totalPrice: Decimal, quantity: Decimal, actualProductName: String, unit: String) {
        self.shopName = shopName
        self.date = date
        self.totalPrice = totalPrice
        self.quantity = quantity
        self.actualProductName = actualProductName
        self.unit = unit
    }
    
    var pricePerQuantity: Decimal {
        return quantity > 0 ? totalPrice / quantity : 0
    }
    
    var totalPriceFormatted: String {
        return String(format: "€%.2f", NSDecimalNumber(decimal: totalPrice).doubleValue)
    }
    
    var pricePerQuantityFormatted: String {
        return String(format: "€%.2f/%@", NSDecimalNumber(decimal: pricePerQuantity).doubleValue, unit)
    }
    
    var quantityFormatted: String {
        let doubleValue = NSDecimalNumber(decimal: quantity).doubleValue
        if doubleValue.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f %@", doubleValue, unit)
        } else {
            return String(format: "%.2f %@", doubleValue, unit)
        }
    }
    
    var dateFormatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "de_AT")
        return formatter.string(from: date)
    }
}