//
//  AddItemViewModel.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 26.09.25.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
@Observable
final class AddItemViewModel: FormToolbarViewModelProtocol {
    private let modelContext: ModelContext

    // Form fields
    var name = ""
    var priceText = ""
    var category = ""
    var shop = ""
    var datum = Date()
    var currency = CurrencyFormatter.defaultCurrency

    // State management
    var isLoading = false
    var errorMessage: String?
    var showingAlert = false
    
    // Callback for form completion
    var onSave: (() -> Void)?
    var onCancel: (() -> Void)?

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !priceText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !shop.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && Decimal(string: priceText.replacingOccurrences(of: ",", with: ".")) != nil
    }

    var alertMessage: String {
        errorMessage ?? "Unknown error"
    }

    // MARK: - FormToolbarViewModelProtocol Implementation
    
    func save() async -> Bool {
        let success = await saveItem()
        if success {
            onSave?()
        }
        return success
    }
    
    func cancel() {
        onCancel?()
    }
    
    func saveItem() async -> Bool {
        guard isFormValid else {
            errorMessage =
                "Bitte füllen Sie alle Pflichtfelder aus und geben Sie einen gültigen Preis ein."
            showingAlert = true
            return false
        }

        isLoading = true
        defer { isLoading = false }

        do {
            let priceDecimal =
                Decimal(string: priceText.replacingOccurrences(of: ",", with: ".")) ?? 0

            let newItem = Rechnungszeile(
                Name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                Price: priceDecimal,
                Category: category.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    ? "Allgemein" : category.trimmingCharacters(in: .whitespacesAndNewlines),
                Shop: shop.trimmingCharacters(in: .whitespacesAndNewlines),
                Datum: datum,
                NormalizedName: name.trimmingCharacters(in: .whitespacesAndNewlines),
                PricePerUnit: priceDecimal,
                Currency: currency
            )

            modelContext.insert(newItem)
            try modelContext.save()

            resetForm()
            return true

        } catch {
            errorMessage = "Fehler beim Speichern: \(error.localizedDescription)"
            showingAlert = true
            return false
        }
    }

    private func resetForm() {
        name = ""
        priceText = ""
        category = ""
        shop = ""
        datum = Date()
        currency = CurrencyFormatter.defaultCurrency
        errorMessage = nil
    }

    func dismissAlert() {
        showingAlert = false
        errorMessage = nil
    }
}
