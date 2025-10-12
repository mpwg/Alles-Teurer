//
//  ReceiptScanViewModel.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 12.10.25.
//

import SwiftUI
import SwiftData
import PhotosUI

/// Represents a detected purchase item from a receipt scan
struct DetectedPurchaseItem: Identifiable {
    let id = UUID()
    var productName: String
    var quantity: Double
    var unit: String
    var totalPrice: Double
    var pricePerUnit: Double {
        guard quantity > 0 else { return 0 }
        return totalPrice / quantity
    }
}

/// View model for receipt scanning and purchase extraction
@Observable
class ReceiptScanViewModel {
    // MARK: - Receipt Information
    var shopName: String = ""
    var receiptDate: Date = Date()
    
    // MARK: - Detected Items
    var detectedItems: [DetectedPurchaseItem] = []
    
    // MARK: - UI State
    var isProcessing: Bool = false
    var errorMessage: String?
    var selectedPhotoItem: PhotosPickerItem?
    var scannedImage: UIImage?
    
    // MARK: - Photo Selection
    
    /// Handle photo selection from PhotosPicker
    @MainActor
    func loadSelectedPhoto() async {
        guard let item = selectedPhotoItem else { return }
        
        isProcessing = true
        errorMessage = nil
        
        do {
            if let data = try await item.loadTransferable(type: Data.self),
               let image = UIImage(data: data) {
                scannedImage = image
                await processReceiptImage(image)
            }
        } catch {
            errorMessage = "Fehler beim Laden des Fotos: \(error.localizedDescription)"
        }
        
        isProcessing = false
    }
    
    // MARK: - Receipt Processing
    
    /// Process receipt image using Visual Intelligence
    /// TODO: Implement actual Visual Intelligence API integration
    @MainActor
    private func processReceiptImage(_ image: UIImage) async {
        // Simulate processing delay
        try? await Task.sleep(for: .seconds(2))
        
        // Mock data for UI development
        // In production, this would call Visual Intelligence API
        shopName = "Hofer"
        receiptDate = Date()
        
        detectedItems = [
            DetectedPurchaseItem(
                productName: "Milch 3,5%",
                quantity: 1.0,
                unit: "l",
                totalPrice: 1.29
            ),
            DetectedPurchaseItem(
                productName: "Vollkornbrot",
                quantity: 500,
                unit: "g",
                totalPrice: 2.49
            ),
            DetectedPurchaseItem(
                productName: "Bio Eier",
                quantity: 10,
                unit: "Stk",
                totalPrice: 3.99
            ),
            DetectedPurchaseItem(
                productName: "Bananen",
                quantity: 1.2,
                unit: "kg",
                totalPrice: 2.16
            )
        ]
    }
    
    // MARK: - Item Management
    
    /// Remove an item from the detected items list
    func removeItem(at offsets: IndexSet) {
        detectedItems.remove(atOffsets: offsets)
    }
    
    /// Remove a specific item
    func removeItem(_ item: DetectedPurchaseItem) {
        detectedItems.removeAll { $0.id == item.id }
    }
    
    /// Update an item's details
    func updateItem(_ item: DetectedPurchaseItem, 
                   name: String? = nil,
                   quantity: Double? = nil,
                   unit: String? = nil,
                   totalPrice: Double? = nil) {
        guard let index = detectedItems.firstIndex(where: { $0.id == item.id }) else { return }
        
        if let name = name {
            detectedItems[index].productName = name
        }
        if let quantity = quantity {
            detectedItems[index].quantity = quantity
        }
        if let unit = unit {
            detectedItems[index].unit = unit
        }
        if let totalPrice = totalPrice {
            detectedItems[index].totalPrice = totalPrice
        }
    }
    
    // MARK: - Save to Database
    
    /// Save all detected items as purchases to the database
    func savePurchases(to context: ModelContext) throws {
        guard !shopName.isEmpty else {
            throw ValidationError.missingShopName
        }
        
        guard !detectedItems.isEmpty else {
            throw ValidationError.noItems
        }
        
        for item in detectedItems {
            // Find or create product
            let itemName = item.productName
            let descriptor = FetchDescriptor<Product>(
                predicate: #Predicate { product in
                    product.normalizedName == itemName
                }
            )
            
            var product: Product
            let products = try context.fetch(descriptor)
            
            if let existingProduct = products.first {
                product = existingProduct
            } else {
                // Create new product with initial price data
                product = Product(
                    normalizedName: item.productName,
                    bestPricePerQuantity: item.pricePerUnit,
                    bestPriceStore: shopName,
                    highestPricePerQuantity: item.pricePerUnit,
                    highestPriceStore: shopName,
                    unit: item.unit
                )
                context.insert(product)
            }
            
            // Create purchase
            let purchase = Purchase(
                shopName: shopName,
                date: receiptDate,
                totalPrice: item.totalPrice,
                quantity: item.quantity,
                actualProductName: item.productName,
                unit: item.unit
            )
            
            // Link purchase to product
            purchase.product = product
            
            context.insert(purchase)
        }
        
        try context.save()
    }
    
    // MARK: - Reset
    
    /// Reset the view model to initial state
    func reset() {
        shopName = ""
        receiptDate = Date()
        detectedItems = []
        isProcessing = false
        errorMessage = nil
        selectedPhotoItem = nil
        scannedImage = nil
    }
    
    // MARK: - Validation
    
    enum ValidationError: LocalizedError {
        case missingShopName
        case noItems
        
        var errorDescription: String? {
            switch self {
            case .missingShopName:
                return "Bitte Geschäftsname eingeben"
            case .noItems:
                return "Keine Artikel erkannt"
            }
        }
    }
}
