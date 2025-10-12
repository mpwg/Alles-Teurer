//
//  AppleIntelligenceHelper.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 12.10.25.
//

import Foundation
import FoundationModels

/// Helper for checking Apple Intelligence (Foundation Models) availability status
@MainActor
final class AppleIntelligenceHelper {
    
    // MARK: - Shared Instance
    
    static let shared = AppleIntelligenceHelper()
    
    // MARK: - Properties
    
    private let systemModel = SystemLanguageModel.default
    
    // MARK: - Initialization
    
    private init() {}
    
    // MARK: - Public Methods
    
    /// Returns the current availability status of Foundation Models
    /// - Returns: ModelAvailabilityStatus enum value
    func getModelStatus() -> ModelAvailabilityStatus {
        return systemModel.availability
    }
    
    /// Checks if Foundation Models are currently available for use
    /// - Returns: true if models are available, false otherwise
    func isAvailable() -> Bool {
        return systemModel.availability == .available
    }
    
    /// Returns a user-friendly description of the current model status
    /// - Returns: Localized status description string
    func statusDescription() -> String {
        switch systemModel.availability {
        case .available:
            return "Apple Intelligence ist verfügbar"
        case .unavailable(let reason):
            return statusDescription(for: reason)
        @unknown default:
            return "Status unbekannt"
        }
    }
    
    // MARK: - Private Methods
    
    private func statusDescription(for reason: ModelAvailabilityStatus.UnavailabilityReason) -> String {
        switch reason {
        case .deviceNotCapable:
            return "Gerät unterstützt Apple Intelligence nicht"
        case .notEnabled:
            return "Apple Intelligence ist nicht aktiviert"
        case .notLoaded:
            return "Modell wird geladen..."
        case .internalError:
            return "Interner Fehler beim Laden des Modells"
        @unknown default:
            return "Nicht verfügbar (Unbekannter Grund)"
        }
    }
}
