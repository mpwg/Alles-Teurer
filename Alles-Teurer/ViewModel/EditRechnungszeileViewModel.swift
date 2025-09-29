//
//  EditRechnungszeileViewModel.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 29.09.25.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
@Observable
final class EditRechnungszeileViewModel: FormToolbarViewModelProtocol {
    private let originalItem: Rechnungszeile
    
    // Form fields
    var name: String
    var priceText: String
    var category: String
    var shop: String
    var datum: Date
    var normalizedName: String
    var pricePerUnit: Decimal
    var currency: String
    
    // State management
    var isLoading = false
    var errorMessage: String?
    var showingAlert = false
    var showingDeleteConfirmation = false
    
    // Callbacks
    var onSave: ((Rechnungszeile) -> Void)?
    var onCancel: (() -> Void)?
    var onDelete: (() -> Void)?
    
    init(item: Rechnungszeile) {
        self.originalItem = item
        
        // Initialize with current values
        self.name = item.Name
        self.priceText = CurrencyFormatter.decimalToString(item.Price)
        self.category = item.Category
        self.shop = item.Shop
        self.datum = item.Datum
        self.normalizedName = item.NormalizedName
        self.pricePerUnit = item.PricePerUnit
        self.currency = item.Currency
    }
    
    var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !priceText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        CurrencyFormatter.stringToDecimal(priceText) != nil
    }
    
    // MARK: - FormToolbarViewModelProtocol Implementation
    
    func save() async -> Bool {
        guard isFormValid else {
            errorMessage = "Bitte füllen Sie alle Pflichtfelder aus und geben Sie einen gültigen Preis ein."
            showingAlert = true
            return false
        }
        
        isLoading = true
        defer { isLoading = false }
        
        // Update the original item with new values
        originalItem.Name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        originalItem.Category = category.trimmingCharacters(in: .whitespacesAndNewlines)
        originalItem.Shop = shop.trimmingCharacters(in: .whitespacesAndNewlines)
        originalItem.Datum = datum
        originalItem.NormalizedName = normalizedName.trimmingCharacters(in: .whitespacesAndNewlines)
        originalItem.Currency = currency
        
        if let price = CurrencyFormatter.stringToDecimal(priceText) {
            originalItem.Price = price
            originalItem.PricePerUnit = pricePerUnit
        }
        
        onSave?(originalItem)
        return true
    }
    
    func cancel() {
        onCancel?()
    }
    
    // MARK: - Custom toolbar configuration with delete action
    
    var toolbarConfiguration: ToolbarConfiguration {
        ToolbarConfiguration.mixed([
            ToolbarActionConfiguration(action: .cancel, placement: .cancellationAction, isEnabled: !isLoading),
            ToolbarActionConfiguration(action: .save, placement: .primaryAction, isEnabled: isFormValid && !isLoading),
            ToolbarActionConfiguration(action: .delete, placement: .secondaryAction, isEnabled: !isLoading)
        ])
    }
    
    func handleToolbarAction(_ action: ToolbarAction) async {
        switch action {
        case .save:
            _ = await save()
        case .cancel:
            cancel()
        case .delete:
            showingDeleteConfirmation = true
        default:
            break
        }
    }
    
    func confirmDelete() {
        onDelete?()
    }
}