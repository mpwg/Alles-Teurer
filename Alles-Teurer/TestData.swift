//
//  TestData.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import Foundation
import SwiftData

struct TestData {
    static let sampleProducts: [Product] = [
        Product(
            normalizedName: "Milch",
            bestPricePerQuantity: 1.19,
            bestPriceStore: "Hofer",
            highestPricePerQuantity: 1.79,
            highestPriceStore: "Billa",
            unit: "l"
        ),
        Product(
            normalizedName: "Butter",
            bestPricePerQuantity: 9.96,
            bestPriceStore: "Lidl",
            highestPricePerQuantity: 13.16,
            highestPriceStore: "Spar",
            unit: "kg"
        ),
        Product(
            normalizedName: "Brot",
            bestPricePerQuantity: 3.78,
            bestPriceStore: "Bäckerei Ströck",
            highestPricePerQuantity: 5.98,
            highestPriceStore: "Merkur",
            unit: "kg"
        ),
        Product(
            normalizedName: "Bananen",
            bestPricePerQuantity: 1.99,
            bestPriceStore: "Hofer",
            highestPricePerQuantity: 2.79,
            highestPriceStore: "Billa Plus",
            unit: "kg"
        ),
        Product(
            normalizedName: "Eier",
            bestPricePerQuantity: 0.279,
            bestPriceStore: "Penny",
            highestPricePerQuantity: 0.349,
            highestPriceStore: "Interspar",
            unit: "Stück"
        ),
        Product(
            normalizedName: "Kartoffeln",
            bestPricePerQuantity: 1.49,
            bestPriceStore: "Lidl",
            highestPricePerQuantity: 2.29,
            highestPriceStore: "Billa",
            unit: "kg"
        ),
        Product(
            normalizedName: "Joghurt",
            bestPricePerQuantity: 1.78,
            bestPriceStore: "Hofer",
            highestPricePerQuantity: 2.78,
            highestPriceStore: "Spar",
            unit: "kg"
        ),
        Product(
            normalizedName: "Käse",
            bestPricePerQuantity: 12.90,
            bestPriceStore: "Metro",
            highestPricePerQuantity: 18.50,
            highestPriceStore: "Interspar",
            unit: "kg"
        ),
        Product(
            normalizedName: "Äpfel",
            bestPricePerQuantity: 2.49,
            bestPriceStore: "Lidl",
            highestPricePerQuantity: 3.99,
            highestPriceStore: "Merkur",
            unit: "kg"
        ),
        Product(
            normalizedName: "Reis",
            bestPricePerQuantity: 1.89,
            bestPriceStore: "Hofer",
            highestPricePerQuantity: 2.99,
            highestPriceStore: "Billa Plus",
            unit: "kg"
        ),
        Product(
            normalizedName: "Olivenöl",
            bestPricePerQuantity: 9.98,
            bestPriceStore: "Lidl",
            highestPricePerQuantity: 14.98,
            highestPriceStore: "Spar",
            unit: "l"
        ),
        Product(
            normalizedName: "Nudeln",
            bestPricePerQuantity: 1.58,
            bestPriceStore: "Penny",
            highestPricePerQuantity: 2.98,
            highestPriceStore: "Interspar",
            unit: "kg"
        ),
        Product(
            normalizedName: "Fleisch",
            bestPricePerQuantity: 8.99,
            bestPriceStore: "Hofer",
            highestPricePerQuantity: 14.99,
            highestPriceStore: "Merkur",
            unit: "kg"
        ),
        Product(
            normalizedName: "Fisch",
            bestPricePerQuantity: 12.90,
            bestPriceStore: "Metro",
            highestPricePerQuantity: 19.90,
            highestPriceStore: "Interspar",
            unit: "kg"
        ),
        Product(
            normalizedName: "Zucker",
            bestPricePerQuantity: 0.99,
            bestPriceStore: "Penny",
            highestPricePerQuantity: 1.59,
            highestPriceStore: "Spar",
            unit: "kg"
        ),
        Product(
            normalizedName: "Mehl",
            bestPricePerQuantity: 0.89,
            bestPriceStore: "Lidl",
            highestPricePerQuantity: 1.49,
            highestPriceStore: "Billa Plus",
            unit: "kg"
        ),
        Product(
            normalizedName: "Tomaten",
            bestPricePerQuantity: 2.99,
            bestPriceStore: "Hofer",
            highestPricePerQuantity: 4.99,
            highestPriceStore: "Merkur",
            unit: "kg"
        ),
        Product(
            normalizedName: "Zwiebeln",
            bestPricePerQuantity: 1.29,
            bestPriceStore: "Lidl",
            highestPricePerQuantity: 1.99,
            highestPriceStore: "Billa",
            unit: "kg"
        ),
        Product(
            normalizedName: "Salat",
            bestPricePerQuantity: 0.99,
            bestPriceStore: "Penny",
            highestPricePerQuantity: 1.79,
            highestPriceStore: "Interspar",
            unit: "Stück"
        ),
        Product(
            normalizedName: "Gurken",
            bestPricePerQuantity: 0.79,
            bestPriceStore: "Hofer",
            highestPricePerQuantity: 1.29,
            highestPriceStore: "Spar",
            unit: "Stück"
        ),
        Product(
            normalizedName: "Paprika",
            bestPricePerQuantity: 3.49,
            bestPriceStore: "Lidl",
            highestPricePerQuantity: 5.99,
            highestPriceStore: "Merkur",
            unit: "kg"
        ),
        Product(
            normalizedName: "Wurst",
            bestPricePerQuantity: 6.99,
            bestPriceStore: "Penny",
            highestPricePerQuantity: 12.90,
            highestPriceStore: "Interspar",
            unit: "kg"
        ),
        Product(
            normalizedName: "Schinken",
            bestPricePerQuantity: 14.90,
            bestPriceStore: "Metro",
            highestPricePerQuantity: 24.90,
            highestPriceStore: "Merkur",
            unit: "kg"
        ),
        Product(
            normalizedName: "Kaffee",
            bestPricePerQuantity: 8.99,
            bestPriceStore: "Hofer",
            highestPricePerQuantity: 15.99,
            highestPriceStore: "Spar",
            unit: "kg"
        ),
        Product(
            normalizedName: "Tee",
            bestPricePerQuantity: 12.50,
            bestPriceStore: "Lidl",
            highestPricePerQuantity: 22.90,
            highestPriceStore: "Interspar",
            unit: "kg"
        )
    ]
    
    static func createSampleData(in modelContext: ModelContext) {
        for product in sampleProducts {
            modelContext.insert(product)
        }
        
        // Add sample purchases after products are inserted
        addSamplePurchases(to: sampleProducts, in: modelContext)
    }
    
    private static func addSamplePurchases(to products: [Product], in modelContext: ModelContext) {
        let stores = ["Hofer", "Billa", "Lidl", "Spar", "Penny", "Merkur", "Interspar", "Billa Plus", "Metro"]
        
        // Milch - 30 purchases
        if let product = products.first(where: { $0.normalizedName == "Milch" }) {
            let productNames = ["Ja! Natürlich Bio Vollmilch", "NÖM Frische Vollmilch", "SPAR Natur*pur Bio Vollmilch", "Berglandmilch Vollmilch", "Tirol Milch Heumilch", "Lidl Milbona Vollmilch"]
            for i in 1...30 {
                let quantity = Double.random(in: 0.5...3.0) // 0.5L to 3L
                let pricePerL = Double.random(in: 1.19...1.89)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...90), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerL,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "l"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Butter - 15 purchases
        if let product = products.first(where: { $0.normalizedName == "Butter" }) {
            let productNames = ["Milbona Deutsche Markenbutter", "Tirol Milch Butter ungesalzen", "Lurpak Butter", "SPAR Natur*pur Butter", "Ja! Natürlich Bio Butter"]
            for i in 1...15 {
                let quantity = Double.random(in: 0.25...1.0) // 0.25kg to 1kg
                let pricePerKg = Double.random(in: 9.96...13.16) // Convert 250g prices to per kg
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...60), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Brot - 25 purchases
        if let product = products.first(where: { $0.normalizedName == "Brot" }) {
            let productNames = ["Kornspitz Vollkornbrot", "Ströck Hausbrot", "SPAR Naturbäckerei Brot", "Harry Vollkorn Toast", "Mein Bestes Bauernbrot", "Anker Brot Klassik"]
            for i in 1...25 {
                let quantity = Double.random(in: 0.4...1.5) // 0.4kg to 1.5kg
                let pricePerKg = Double.random(in: 3.78...5.98) // Convert 500g prices to per kg
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...45), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Bananen - 20 purchases
        if let product = products.first(where: { $0.normalizedName == "Bananen" }) {
            let productNames = ["Bananen Ecuador", "Premium Bananen", "Fairtrade Bananen", "Bio Bananen", "Bananen Kolumbien"]
            for i in 1...20 {
                let quantity = Double.random(in: 0.5...2.5) // 0.5kg to 2.5kg
                let pricePerKg = Double.random(in: 1.99...2.79)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...30), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Eier - 18 purchases
        if let product = products.first(where: { $0.normalizedName == "Eier" }) {
            let productNames = ["Penny Freilandeier Gr. M", "Landfrisch Bio Eier Gr. L", "Ja! Natürlich Bio Eier", "SPAR Freilandeier", "Toni's Freilandeier"]
            for i in 1...18 {
                let quantity = Double(Int.random(in: 6...30)) // 6 to 30 eggs
                let pricePerEgg = Double.random(in: 0.279...0.349) // Price per egg
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...40), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerEgg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "Stück"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Kartoffeln - 12 purchases
        if let product = products.first(where: { $0.normalizedName == "Kartoffeln" }) {
            let productNames = ["Österreichische Kartoffeln", "Bio Kartoffeln", "Festkochende Kartoffeln", "Mehlige Kartoffeln", "Neue Kartoffeln"]
            for i in 1...12 {
                let quantity = Double.random(in: 1.0...5.0) // 1kg to 5kg
                let pricePerKg = Double.random(in: 1.49...2.29)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...50), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Joghurt - 22 purchases
        if let product = products.first(where: { $0.normalizedName == "Joghurt" }) {
            let productNames = ["Ja! Natürlich Bio Joghurt", "Danone Activia", "SPAR Natur*pur Joghurt", "Berglandmilch Joghurt", "Gmundner Milch Joghurt"]
            for i in 1...22 {
                let quantity = Double.random(in: 0.15...1.0) // 0.15kg to 1kg
                let pricePerKg = Double.random(in: 1.78...2.78) // Convert 500g prices to per kg
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...35), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Käse - 8 purchases
        if let product = products.first(where: { $0.normalizedName == "Käse" }) {
            let productNames = ["Bergkäse", "Gouda Käse", "Emmentaler", "Schärdinger Käse", "Tirol Milch Bergkäse", "Bio Käse Natur"]
            for i in 1...8 {
                let quantity = Double.random(in: 0.2...0.8) // 0.2kg to 0.8kg
                let pricePerKg = Double.random(in: 12.90...18.50)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...70), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Äpfel - 16 purchases
        if let product = products.first(where: { $0.normalizedName == "Äpfel" }) {
            let productNames = ["Gala Äpfel", "Golden Delicious", "Bio Äpfel", "Steiermark Äpfel", "Braeburn Äpfel", "Granny Smith"]
            for i in 1...16 {
                let quantity = Double.random(in: 0.8...3.0) // 0.8kg to 3kg
                let pricePerKg = Double.random(in: 2.49...3.99)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...25), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Reis - 10 purchases
        if let product = products.first(where: { $0.normalizedName == "Reis" }) {
            let productNames = ["Jasmin Reis", "Basmati Reis", "Risotto Reis", "Bio Reis", "Parboiled Reis", "Vollkorn Reis"]
            for i in 1...10 {
                let quantity = Double.random(in: 0.5...2.0) // 0.5kg to 2kg
                let pricePerKg = Double.random(in: 1.89...2.99)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...80), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Olivenöl - 7 purchases
        if let product = products.first(where: { $0.normalizedName == "Olivenöl" }) {
            let productNames = ["Extra Virgin Olivenöl", "Bertolli Olivenöl", "SPAR Premium Olivenöl", "Bio Olivenöl", "Griechisches Olivenöl"]
            for i in 1...7 {
                let quantity = Double.random(in: 0.25...1.0) // 0.25L to 1L
                let pricePerL = Double.random(in: 9.98...14.98) // Convert 500ml prices to per liter
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...100), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerL,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "l"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Nudeln - 14 purchases
        if let product = products.first(where: { $0.normalizedName == "Nudeln" }) {
            let productNames = ["Barilla Spaghetti", "Recheis Nudeln", "SPAR Penne", "Bio Vollkorn Nudeln", "Buitoni Tagliatelle", "De Cecco Fusilli"]
            for i in 1...14 {
                let quantity = Double.random(in: 0.5...2.0) // 0.5kg to 2kg
                let pricePerKg = Double.random(in: 1.58...2.98) // Convert 500g prices to per kg
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...60), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Fleisch - 6 purchases
        if let product = products.first(where: { $0.normalizedName == "Fleisch" }) {
            let productNames = ["Rinderschnitzel", "Schweineschnitzel", "Bio Rindfleisch", "Hühnerschnitzel", "Faschiertes", "Rindergulasch"]
            for i in 1...6 {
                let quantity = Double.random(in: 0.3...1.5) // 0.3kg to 1.5kg
                let pricePerKg = Double.random(in: 8.99...14.99)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...15), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Fisch - 4 purchases
        if let product = products.first(where: { $0.normalizedName == "Fisch" }) {
            let productNames = ["Lachs Filet", "Forelle", "Bio Lachs", "Thunfisch Filet", "Saibling", "Zander Filet"]
            for i in 1...4 {
                let quantity = Double.random(in: 0.2...0.8) // 0.2kg to 0.8kg
                let pricePerKg = Double.random(in: 12.90...19.90)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...20), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Zucker - 5 purchases
        if let product = products.first(where: { $0.normalizedName == "Zucker" }) {
            let productNames = ["Kristallzucker", "Bio Rohrzucker", "Feiner Zucker", "SPAR Zucker", "Agrana Zucker"]
            for i in 1...5 {
                let quantity = Double.random(in: 0.5...2.0) // 0.5kg to 2kg
                let pricePerKg = Double.random(in: 0.99...1.59)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...120), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Mehl - 6 purchases
        if let product = products.first(where: { $0.normalizedName == "Mehl" }) {
            let productNames = ["Wiener Griess Mehl", "Bio Vollkornmehl", "Weizenmehl Type 480", "Dinkelmehl", "SPAR Mehl"]
            for i in 1...6 {
                let quantity = Double.random(in: 0.5...2.0) // 0.5kg to 2kg
                let pricePerKg = Double.random(in: 0.89...1.49)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...90), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Tomaten - 13 purchases
        if let product = products.first(where: { $0.normalizedName == "Tomaten" }) {
            let productNames = ["Rispentomaten", "Cherry Tomaten", "Bio Tomaten", "Fleischtomaten", "Cocktailtomaten"]
            for i in 1...13 {
                let quantity = Double.random(in: 0.3...1.5) // 0.3kg to 1.5kg
                let pricePerKg = Double.random(in: 2.99...4.99)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...21), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Zwiebeln - 9 purchases
        if let product = products.first(where: { $0.normalizedName == "Zwiebeln" }) {
            let productNames = ["Gelbe Zwiebeln", "Rote Zwiebeln", "Bio Zwiebeln", "Österreichische Zwiebeln", "Schalotten"]
            for i in 1...9 {
                let quantity = Double.random(in: 0.5...2.0) // 0.5kg to 2kg
                let pricePerKg = Double.random(in: 1.29...1.99)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...40), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Salat - 11 purchases
        if let product = products.first(where: { $0.normalizedName == "Salat" }) {
            let productNames = ["Kopfsalat", "Eisbergsalat", "Bio Salat", "Römersalat", "Eichblattsalat", "Rucola Salat"]
            for i in 1...11 {
                let quantity = Double(Int.random(in: 1...3)) // 1 to 3 pieces
                let pricePerPiece = Double.random(in: 0.99...1.79)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...14), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerPiece,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "Stück"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Gurken - 8 purchases
        if let product = products.first(where: { $0.normalizedName == "Gurken" }) {
            let productNames = ["Salatgurken", "Bio Gurken", "Mini Gurken", "Österreichische Gurken", "Gewächshaus Gurken"]
            for i in 1...8 {
                let quantity = Double(Int.random(in: 1...4)) // 1 to 4 pieces
                let pricePerPiece = Double.random(in: 0.79...1.29)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...18), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerPiece,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "Stück"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Paprika - 7 purchases
        if let product = products.first(where: { $0.normalizedName == "Paprika" }) {
            let productNames = ["Rote Paprika", "Gelbe Paprika", "Grüne Paprika", "Bio Paprika", "Spitzpaprika", "Mini Paprika"]
            for i in 1...7 {
                let quantity = Double.random(in: 0.2...1.0) // 0.2kg to 1kg
                let pricePerKg = Double.random(in: 3.49...5.99)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...25), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Wurst - 10 purchases
        if let product = products.first(where: { $0.normalizedName == "Wurst" }) {
            let productNames = ["Leberkäse", "Frankfurter", "Debreziner", "Bio Wurst", "Tiroler Speck", "Salami"]
            for i in 1...10 {
                let quantity = Double.random(in: 0.2...0.8) // 0.2kg to 0.8kg
                let pricePerKg = Double.random(in: 6.99...12.90)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...30), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Schinken - 5 purchases
        if let product = products.first(where: { $0.normalizedName == "Schinken" }) {
            let productNames = ["Tiroler Speck", "Prosciutto", "Bio Schinken", "Kochschinken", "Schwarzwälder Schinken"]
            for i in 1...5 {
                let quantity = Double.random(in: 0.1...0.5) // 0.1kg to 0.5kg
                let pricePerKg = Double.random(in: 14.90...24.90)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...35), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Kaffee - 3 purchases
        if let product = products.first(where: { $0.normalizedName == "Kaffee" }) {
            let productNames = ["Julius Meinl Kaffee", "Jacobs Krönung", "Tchibo Kaffee", "SPAR Premium Kaffee", "Bio Kaffee"]
            for i in 1...3 {
                let quantity = Double.random(in: 0.25...1.0) // 0.25kg to 1kg
                let pricePerKg = Double.random(in: 8.99...15.99)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...60), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
        
        // Tee - 2 purchases
        if let product = products.first(where: { $0.normalizedName == "Tee" }) {
            let productNames = ["Earl Grey Tee", "Grüner Tee", "Kräutertee", "Bio Tee", "Früchtetee", "Pfefferminztee"]
            for i in 1...2 {
                let quantity = Double.random(in: 0.05...0.2) // 0.05kg to 0.2kg (50g to 200g)
                let pricePerKg = Double.random(in: 12.50...22.90)
                let purchase = Purchase(
                    shopName: stores.randomElement()!,
                    date: Calendar.current.date(byAdding: .day, value: -Int.random(in: 1...90), to: Date()) ?? Date(),
                    totalPrice: quantity * pricePerKg,
                    quantity: quantity,
                    actualProductName: productNames.randomElement()!,
                    unit: "kg"
                )
                purchase.product = product
                modelContext.insert(purchase)
            }
        }
    }
}