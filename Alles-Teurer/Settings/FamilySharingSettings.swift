//
//  FamilySharingSettings.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import Foundation
import SwiftData
import CloudKit

@Observable
class FamilySharingSettings {
    static let shared = FamilySharingSettings()
    
    private let userDefaults = UserDefaults.standard
    private let familySharingKey = "isFamilySharingEnabled"
    private let restartRequiredKey = "restartRequiredForFamilySharing"
    
    var isFamilySharingEnabled: Bool {
        get {
            userDefaults.bool(forKey: familySharingKey)
        }
        set {
            let oldValue = userDefaults.bool(forKey: familySharingKey)
            userDefaults.set(newValue, forKey: familySharingKey)
            // Mark restart as required if setting changed
            if oldValue != newValue {
                userDefaults.set(true, forKey: restartRequiredKey)
            }
        }
    }
    
    var restartRequired: Bool {
        get {
            userDefaults.bool(forKey: restartRequiredKey)
        }
        set {
            userDefaults.set(newValue, forKey: restartRequiredKey)
        }
    }
    
    private init() {}
    
    // Helper to identify current build configuration
    var isDebugBuild: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    var buildTypeDescription: String {
        #if DEBUG
        return "Debug Build"
        #else
        return "Release Build"
        #endif
    }
    
    // Check if CloudKit is available and user is signed in
    func checkCloudKitAvailability() async -> Bool {
        do {
            let container = CKContainer.default()
            let accountStatus = try await container.accountStatus()
            return accountStatus == .available
        } catch {
            print("CloudKit availability check failed: \(error)")
            return false
        }
    }
    
    // Get the appropriate model configuration based on family sharing settings
    func getModelConfiguration() -> ModelConfiguration {
        #if DEBUG
        let containerSuffix = "-debug"
        #else
        let containerSuffix = ""
        #endif
        
        if isFamilySharingEnabled {
            // CloudKit configuration for family sharing
            return ModelConfiguration(
                isStoredInMemoryOnly: false,
                cloudKitDatabase: .automatic
            )
        } else {
            // Local storage only with different database files for debug/release
            return ModelConfiguration(
                "AllesTeurer\(containerSuffix)",
                isStoredInMemoryOnly: false
            )
        }
    }
    
    // MARK: - Persistence
    
    /// Explicitly save all settings to UserDefaults
    func saveSettings() {
        userDefaults.synchronize()
        print("💾 Family sharing settings saved")
    }
}