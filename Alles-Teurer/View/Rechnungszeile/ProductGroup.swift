//
//  ProductGroup.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 28.09.25.
//


import SwiftUI
import SwiftData

struct ProductGroup: Identifiable {
    let id = UUID()
    let productName: String
    let items: [Rechnungszeile]
    let latestItem: Rechnungszeile
    let isHighestPrice: Bool
    let isLowestPrice: Bool
}