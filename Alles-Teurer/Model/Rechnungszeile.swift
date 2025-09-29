//
//  Rechnungszeile.swift
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
    var NormalizedName: String
    var PricePerUnit: Decimal
    var Currency: String

    init(
        Name: String, Price: Decimal, Category: String, Shop: String, Datum: Date,
        NormalizedName:String, PricePerUnit: Decimal = 0, Currency: String = "EUR"
    ) {
        self.Name = Name
        self.Price = Price
        self.Category = Category
        self.Shop = Shop
        self.Datum = Datum
        self.NormalizedName = NormalizedName
        self.PricePerUnit = PricePerUnit
        self.Currency = Currency
        self.id = UUID()
    }

}
