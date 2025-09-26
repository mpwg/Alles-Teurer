//
//  Item.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 25.09.25.
//

import Foundation
import SwiftData

@Model
final class Rechnungszeile: Identifiable {
    var Name: String
    var Price: Decimal
    var Category: String
    var Shop: String
    var Datum: Date
    var id: UUID
    
    init(Name: String, Price: Decimal, Category: String, Shop: String, Datum: Date) {
        self.Name = Name
        self.Price = Price
        self.Category = Category
        self.Shop = Shop
        self.Datum = Datum
        self.id = UUID()
    }
    
}
