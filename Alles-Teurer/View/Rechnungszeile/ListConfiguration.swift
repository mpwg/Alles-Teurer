//
//  ListConfiguration.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 28.09.25.
//


import SwiftUI
import SwiftData

struct ListConfiguration {
    let displayMode: ListDisplayMode
    let interactionMode: ListInteractionMode
    let allowsEditing: Bool
    let allowsSelection: Bool
    let showsPriceHighlights: Bool
    
    static let productNavigation = ListConfiguration(
        displayMode: .productGroups,
        interactionMode: .navigation,
        allowsEditing: false,
        allowsSelection: false,
        showsPriceHighlights: true
    )
    
    static let itemSelection = ListConfiguration(
        displayMode: .individualItems,
        interactionMode: .selection,
        allowsEditing: true,
        allowsSelection: true,
        showsPriceHighlights: true
    )
}