//
//  BackupRestoreService.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 03.11.25.
//

import Foundation
import SwiftData
import UniformTypeIdentifiers
import Compression

/// Service for backing up and restoring data in compressed JSON5 format
@MainActor
class BackupRestoreService {
    
    // MARK: - Backup Data Models
    
    struct BackupData: Codable {
        let version: String
        let exportDate: Date
        let products: [ProductBackup]
        let purchases: [PurchaseBackup]
        
        struct ProductBackup: Codable {
            let normalizedName: String
            let bestPricePerQuantity: Decimal
            let bestPriceStore: String
            let highestPricePerQuantity: Decimal
            let highestPriceStore: String
            let unit: String
            let lastUpdated: Date
        }
        
        struct PurchaseBackup: Codable {
            let shopName: String
            let date: Date
            let totalPrice: Decimal
            let quantity: Decimal
            let actualProductName: String
            let unit: String
            let productNormalizedName: String
        }
    }
    
    // MARK: - Backup
    
    /// Creates a backup of all products and purchases
    static func createBackup(products: [Product], purchases: [Purchase]) throws -> Data {
        let backupProducts = products.map { product in
            BackupData.ProductBackup(
                normalizedName: product.normalizedName,
                bestPricePerQuantity: product.bestPricePerQuantity,
                bestPriceStore: product.bestPriceStore,
                highestPricePerQuantity: product.highestPricePerQuantity,
                highestPriceStore: product.highestPriceStore,
                unit: product.unit,
                lastUpdated: product.lastUpdated
            )
        }
        
        let backupPurchases = purchases.compactMap { purchase -> BackupData.PurchaseBackup? in
            guard let productName = purchase.product?.normalizedName else { return nil }
            return BackupData.PurchaseBackup(
                shopName: purchase.shopName,
                date: purchase.date,
                totalPrice: purchase.totalPrice,
                quantity: purchase.quantity,
                actualProductName: purchase.actualProductName,
                unit: purchase.unit,
                productNormalizedName: productName
            )
        }
        
        let backupData = BackupData(
            version: "1.0",
            exportDate: Date(),
            products: backupProducts,
            purchases: backupPurchases
        )
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.dateEncodingStrategy = .iso8601
        
        return try encoder.encode(backupData)
    }
    
    /// Exports backup to a file URL
    static func exportBackup(products: [Product], purchases: [Purchase]) throws -> URL {
        let backupData = try createBackup(products: products, purchases: purchases)
        
        // Compress the data
        let compressedData = try compress(data: backupData)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd_HHmmss"
        let dateString = dateFormatter.string(from: Date())
        let filename = "AllesTeurer_Backup_\(dateString).AllesTeurerBackup"
        
        let temporaryDirectory = FileManager.default.temporaryDirectory
        let fileURL = temporaryDirectory.appendingPathComponent(filename)
        
        try compressedData.write(to: fileURL)
        
        return fileURL
    }
    
    // MARK: - Compression
    
    /// Compresses data using LZFSE algorithm
    private static func compress(data: Data) throws -> Data {
        let sourceBuffer = [UInt8](data)
        let destinationBufferSize = data.count
        var destinationBuffer = [UInt8](repeating: 0, count: destinationBufferSize)
        
        let compressedSize = compression_encode_buffer(
            &destinationBuffer,
            destinationBufferSize,
            sourceBuffer,
            sourceBuffer.count,
            nil,
            COMPRESSION_LZFSE
        )
        
        guard compressedSize > 0 else {
            throw BackupError.compressionFailed
        }
        
        return Data(destinationBuffer.prefix(compressedSize))
    }
    
    /// Decompresses data using LZFSE algorithm
    private static func decompress(data: Data) throws -> Data {
        let sourceBuffer = [UInt8](data)
        // Estimate decompressed size (assuming max 10x compression ratio)
        let estimatedSize = data.count * 10
        var destinationBuffer = [UInt8](repeating: 0, count: estimatedSize)
        
        let decompressedSize = compression_decode_buffer(
            &destinationBuffer,
            estimatedSize,
            sourceBuffer,
            sourceBuffer.count,
            nil,
            COMPRESSION_LZFSE
        )
        
        guard decompressedSize > 0 else {
            throw BackupError.decompressionFailed
        }
        
        return Data(destinationBuffer.prefix(decompressedSize))
    }
    
    // MARK: - Restore
    
    /// Restores data from a backup file
    static func restoreBackup(from url: URL, modelContext: ModelContext, replaceExisting: Bool = false) throws {
        // Verify file extension (case-insensitive)
        let pathExtension = url.pathExtension.lowercased()
        let expectedExtension = "allesteurerbackup"
        
        guard pathExtension == expectedExtension else {
            print("❌ Invalid file extension: '\(url.pathExtension)' (expected '\(expectedExtension)')")
            print("   Full path: \(url.path)")
            throw BackupError.invalidFileFormat
        }
        
        let compressedData = try Data(contentsOf: url)
        
        // Decompress the data
        let data = try decompress(data: compressedData)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.allowsJSON5 = true
        
        let backupData = try decoder.decode(BackupData.self, from: data)
        
        // If replace existing, delete all current data first
        if replaceExisting {
            try deleteAllData(modelContext: modelContext)
        }
        
        // Create a mapping of product names to products
        var productMap: [String: Product] = [:]
        
        // Restore products
        for productBackup in backupData.products {
            let product = Product(
                normalizedName: productBackup.normalizedName,
                bestPricePerQuantity: productBackup.bestPricePerQuantity,
                bestPriceStore: productBackup.bestPriceStore,
                highestPricePerQuantity: productBackup.highestPricePerQuantity,
                highestPriceStore: productBackup.highestPriceStore,
                unit: productBackup.unit
            )
            product.lastUpdated = productBackup.lastUpdated
            
            modelContext.insert(product)
            productMap[product.normalizedName] = product
        }
        
        // Restore purchases
        for purchaseBackup in backupData.purchases {
            guard let product = productMap[purchaseBackup.productNormalizedName] else {
                continue
            }
            
            let purchase = Purchase(
                shopName: purchaseBackup.shopName,
                date: purchaseBackup.date,
                totalPrice: purchaseBackup.totalPrice,
                quantity: purchaseBackup.quantity,
                actualProductName: purchaseBackup.actualProductName,
                unit: purchaseBackup.unit
            )
            purchase.product = product
            
            modelContext.insert(purchase)
        }
        
        try modelContext.save()
    }
    
    /// Deletes all data from the model context
    private static func deleteAllData(modelContext: ModelContext) throws {
        let productDescriptor = FetchDescriptor<Product>()
        let products = try modelContext.fetch(productDescriptor)
        for product in products {
            modelContext.delete(product)
        }
        
        let purchaseDescriptor = FetchDescriptor<Purchase>()
        let purchases = try modelContext.fetch(purchaseDescriptor)
        for purchase in purchases {
            modelContext.delete(purchase)
        }
        
        try modelContext.save()
    }
    
    // MARK: - Errors
    
    enum BackupError: LocalizedError {
        case invalidFormat
        case invalidFileFormat
        case incompatibleVersion
        case noDataToBackup
        case compressionFailed
        case decompressionFailed
        
        var errorDescription: String? {
            switch self {
            case .invalidFormat:
                return "Die Backup-Datei hat ein ungültiges Format."
            case .invalidFileFormat:
                return "Nur .AllesTeurerBackup Dateien können wiederhergestellt werden."
            case .incompatibleVersion:
                return "Die Backup-Version ist nicht kompatibel."
            case .noDataToBackup:
                return "Keine Daten zum Sichern vorhanden."
            case .compressionFailed:
                return "Fehler beim Komprimieren der Backup-Datei."
            case .decompressionFailed:
                return "Fehler beim Dekomprimieren der Backup-Datei."
            }
        }
    }
}

// MARK: - UTType Extension for AllesTeurerBackup

extension UTType {
    nonisolated static var allesTeurerBackup: UTType {
        UTType(exportedAs: "eu.mpwg.alles-teurer.backup", conformingTo: .data)
        
    }
}
