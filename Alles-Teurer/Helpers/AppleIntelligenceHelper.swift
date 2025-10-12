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
    /// - Returns: SystemLanguageModel.Availability enum value
    func getModelStatus() -> SystemLanguageModel.Availability {
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
        case .unavailable(.deviceNotEligible):
            return "Gerät unterstützt Apple Intelligence nicht"
        case .unavailable(.appleIntelligenceNotEnabled):
            return "Apple Intelligence ist nicht aktiviert"
        case .unavailable(.modelNotReady):
            return "Modell wird geladen..."
        case .unavailable:
            return "Nicht verfügbar"
        @unknown default:
            return "Status unbekannt"
        }
    }
}
