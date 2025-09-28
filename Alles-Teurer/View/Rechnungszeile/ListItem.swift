//
//  ListItem.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 28.09.25.
//


import SwiftUI
import SwiftData

struct ListItem: Identifiable {
    let id = UUID()
    let rechnungszeile: Rechnungszeile
    let isHighestPrice: Bool
    let isLowestPrice: Bool
    let isSelected: Bool
}