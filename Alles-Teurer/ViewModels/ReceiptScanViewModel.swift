//
//  ReceiptScanViewModel.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 12.10.25.
//

import SwiftUI
import SwiftData
import PhotosUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Represents a detected purchase item from a receipt scan
struct DetectedPurchaseItem: Identifiable {
    let id = UUID()
    var productName: String
    var normalizedName: String? // For LLM-normalized names
    var quantity: Double
    var unit: String
    var totalPrice: Double
    var shopName: String? // Store shop name per item for flexibility
    var date: Date? // Store date per item for flexibility
    
    var pricePerUnit: Double {
        guard quantity > 0 else { return 0 }
        return totalPrice / quantity
    }
}

/// View model for receipt scanning and purchase extraction
@Observable
class ReceiptScanViewModel {
    // MARK: - Dependencies
    var modelContext: ModelContext?
    var purchaseViewModel: PurchaseViewModel?
    
    // MARK: - Receipt Information
    var shopName: String = ""
    var receiptDate: Date = Date()
    
    // MARK: - Detected Items
    var detectedItems: [DetectedPurchaseItem] = []
    
    // MARK: - UI State
    var isProcessing: Bool = false
    var errorMessage: String?
    var selectedPhotoItem: PhotosPickerItem?
    var saveSuccessful: Bool = false
    
    // MARK: - Photo Selection
    
    /// Handle photo selection from PhotosPicker
    @MainActor
    func loadSelectedPhoto() async {
        guard let item = selectedPhotoItem else { return }
        
        isProcessing = true
        errorMessage = nil
        
        do {
            // Extract the image data
            guard let imageData = try await item.loadTransferable(type: Data.self) else {
                throw ReceiptScanError.invalidImage
            }
            
            // Process the receipt with the recognition service
            try await processReceiptImage(imageData: imageData)
            
        } catch let error as ReceiptRecognitionError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "Fehler beim Laden des Bildes: \(error.localizedDescription)"
        }
        
        isProcessing = false
    }
    
    // MARK: - Receipt Processing
    
    /// Process receipt image using Vision + Foundation Models
    @MainActor
    private func processReceiptImage(imageData: Data) async throws {
        // Convert Data to CGImage
        guard let cgImage = createCGImage(from: imageData) else {
            throw ReceiptScanError.invalidImage
        }
        
        // Get product suggestions from PurchaseViewModel for better mapping
        let productSuggestions = purchaseViewModel?.productSuggestions ?? []
        
        // Create recognition service with ModelContext for database access
        let service = ReceiptRecognitionService(modelContext: modelContext)
        
        // Extract purchases from the receipt with product suggestions
        let extractedItems = try await service.extractPurchases(
            from: cgImage,
            existingProductSuggestions: productSuggestions
        )
        
        // Update UI with extracted data
        if let firstItem = extractedItems.first {
            shopName = firstItem.shopName ?? "Unbekannt"
            receiptDate = firstItem.date ?? Date()
        }
        
        detectedItems = extractedItems
    }
    
    /// Create a CGImage from image data (cross-platform)
    private func createCGImage(from data: Data) -> CGImage? {
        #if canImport(UIKit)
        guard let uiImage = UIKit.UIImage(data: data) else { return nil }
        return uiImage.cgImage
        #elseif canImport(AppKit)
        guard let nsImage = AppKit.NSImage(data: data) else { return nil }
        var imageRect = CGRect(x: 0, y: 0, width: nsImage.size.width, height: nsImage.size.height)
        return nsImage.cgImage(forProposedRect: &imageRect, context: nil, hints: nil)
        #else
        return nil
        #endif
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
        
        // Each detected item represents one line from the receipt = one Purchase
        for item in detectedItems {
            // Use normalized name from LLM (which was mapped to existing products if possible)
            let normalizedName = item.normalizedName ?? item.productName
            
            // Find or create product using the LLM-normalized name
            let descriptor = FetchDescriptor<Product>(
                predicate: #Predicate { product in
                    product.normalizedName == normalizedName
                }
            )
            
            var product: Product
            let products = try context.fetch(descriptor)
            
            if let existingProduct = products.first {
                // Use existing product that LLM matched
                product = existingProduct
            } else {
                // Create new product with initial price data
                product = Product(
                    normalizedName: normalizedName,
                    bestPricePerQuantity: item.pricePerUnit,
                    bestPriceStore: shopName,
                    highestPricePerQuantity: item.pricePerUnit,
                    highestPriceStore: shopName,
                    unit: item.unit
                )
                context.insert(product)
            }
            
            // Create purchase for this receipt line
            let purchase = Purchase(
                shopName: shopName,
                date: receiptDate,
                totalPrice: item.totalPrice,
                quantity: item.quantity,
                actualProductName: item.productName, // Original name from receipt
                unit: item.unit
            )
            
            // Link purchase to product
            purchase.product = product
            
            // Update product's best/worst prices
            updateProductPrices(product, newPurchase: purchase)
            
            context.insert(purchase)
        }
        
        try context.save()
        saveSuccessful = true
    }
    
    /// Update product's best and worst prices when adding a new purchase
    private func updateProductPrices(_ product: Product, newPurchase: Purchase) {
        let pricePerUnit = newPurchase.pricePerQuantity
        
        // Check if this is a new best price
        if pricePerUnit < product.bestPricePerQuantity {
            product.bestPricePerQuantity = pricePerUnit
            product.bestPriceStore = newPurchase.shopName
        }
        
        // Check if this is a new worst price
        if pricePerUnit > product.highestPricePerQuantity {
            product.highestPricePerQuantity = pricePerUnit
            product.highestPriceStore = newPurchase.shopName
        }
        
        product.lastUpdated = Date()
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

// MARK: - ReceiptScanError

enum ReceiptScanError: LocalizedError {
    case invalidImage
    
    var errorDescription: String? {
        switch self {
        case .invalidImage:
            return "Das Bild konnte nicht geladen werden"
        }
    }
}
