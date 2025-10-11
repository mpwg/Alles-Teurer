//
//  Alles_TeurerApp.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI
import SwiftData

@main
struct Alles_TeurerApp: App {
    @State private var familySharingSettings = FamilySharingSettings.shared
    @State private var modelContainer: ModelContainer?
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            if let container = modelContainer {
                ContentView()
                    .environment(familySharingSettings)
                    .modelContainer(container)
            } else {
                ProgressView("Lade Daten...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .task {
                        await createModelContainer()
                    }
            }
        }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            handleScenePhaseChange(from: oldPhase, to: newPhase)
        }
    }
    
    @MainActor
    private func createModelContainer() async {
        let schema = Schema([
            Product.self,
            Purchase.self,
        ])
        
        // Use family sharing settings to determine configuration
        let modelConfiguration = familySharingSettings.getModelConfiguration()
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            // Clear restart required flag if container was created successfully
            familySharingSettings.restartRequired = false
            
            // Setup termination handlers
            setupTerminationHandlers()
        } catch {
            print("Could not create ModelContainer: \(error)")
            // Fallback to local storage if CloudKit fails
            let fallbackConfig = ModelConfiguration(
                schema: schema,
                isStoredInMemoryOnly: false
            )
            do {
                modelContainer = try ModelContainer(for: schema, configurations: [fallbackConfig])
                // Disable family sharing if CloudKit setup failed
                familySharingSettings.isFamilySharingEnabled = false
                
                // Setup termination handlers
                setupTerminationHandlers()
            } catch {
                fatalError("Could not create fallback ModelContainer: \(error)")
            }
        }
    }
    
    // MARK: - App Lifecycle Management
    
    /// Handle scene phase changes (foreground, background, inactive)
    private func handleScenePhaseChange(from oldPhase: ScenePhase, to newPhase: ScenePhase) {
        switch newPhase {
        case .active:
            // App is in the foreground and receiving events
            handleAppBecameActive()
            
        case .inactive:
            // App is in the foreground but not receiving events (e.g., Control Center pulled down)
            handleAppBecameInactive()
            
        case .background:
            // App is in the background
            handleAppMovedToBackground()
            
        @unknown default:
            break
        }
    }
    
    /// Called when app becomes active
    private func handleAppBecameActive() {
        print("📱 App became active")
        // Refresh data if needed
        // Check for CloudKit changes
    }
    
    /// Called when app becomes inactive (brief state)
    private func handleAppBecameInactive() {
        print("📱 App became inactive")
        // Prepare for potential background transition
        saveAllPendingChanges()
    }
    
    /// Called when app moves to background
    private func handleAppMovedToBackground() {
        print("📱 App moved to background")
        
        // Save all data immediately
        saveAllPendingChanges()
        
        // Persist user defaults
        UserDefaults.standard.synchronize()
        
        // Log for debugging
        print("📱 All data saved to disk")
    }
    
    /// Save all pending changes to disk
    private func saveAllPendingChanges() {
        guard let container = modelContainer else { return }
        
        let context = container.mainContext
        
        // Check if there are unsaved changes
        if context.hasChanges {
            do {
                try context.save()
                print("💾 Successfully saved pending changes")
            } catch {
                print("❌ Error saving context: \(error.localizedDescription)")
                // Attempt to rollback and save again
                context.rollback()
            }
        }
        
        // Save family sharing settings
        familySharingSettings.saveSettings()
    }
    
    /// Setup handlers for SIGTERM and other termination signals
    private func setupTerminationHandlers() {
        // Handle SIGTERM (graceful shutdown request)
        signal(SIGTERM) { signal in
            print("⚠️ Received SIGTERM - performing graceful shutdown")
            // Note: We can't call Swift methods from signal handler
            // Data should already be saved via scenePhase changes
            exit(0)
        }
        
        // Setup notification observer for app termination
        NotificationCenter.default.addObserver(
            forName: UIApplication.willTerminateNotification,
            object: nil,
            queue: .main
        ) { _ in
            // Call handler without capturing self (struct)
            Task { @MainActor in
                await Self.handleAppWillTerminateStatic()
            }
        }
        
        // Setup observer for memory warnings
        NotificationCenter.default.addObserver(
            forName: UIApplication.didReceiveMemoryWarningNotification,
            object: nil,
            queue: .main
        ) { _ in
            Task { @MainActor in
                Self.handleMemoryWarningStatic()
            }
        }
    }
    
    /// Handle app termination (last chance to save)
    @MainActor
    private static func handleAppWillTerminateStatic() async {
        print("⚠️ App will terminate - final save")
        // Note: Can't easily access instance state from static context
        // Important data should already be saved via scenePhase changes
        UserDefaults.standard.synchronize()
    }
    
    /// Handle memory warnings
    @MainActor
    private static func handleMemoryWarningStatic() {
        print("⚠️ Memory warning received")
        
        // Clear caches
        URLCache.shared.removeAllCachedResponses()
        
        // Force synchronize UserDefaults
        UserDefaults.standard.synchronize()
    }
    
    /// Handle app termination (instance method for manual cleanup)
    private func handleAppWillTerminate() {
        print("⚠️ App will terminate - final save")
        
        // Perform final save
        saveAllPendingChanges()
        
        // Clean up resources
        cleanup()
    }
    
    /// Handle memory warnings (instance method)
    private func handleMemoryWarning() {
        print("⚠️ Memory warning received")
        
        // Save data to prevent loss
        saveAllPendingChanges()
        
        // Clear caches if needed
        URLCache.shared.removeAllCachedResponses()
    }
    
    /// Cleanup resources
    private func cleanup() {
        print("🧹 Cleaning up resources")
        
        // Final synchronization
        UserDefaults.standard.synchronize()
    }
}
