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
    
    #if os(macOS)
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif
    
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
            // SwiftData autosaves, but we'll save explicitly on backgrounding for safety
            if newPhase == .inactive || newPhase == .background {
                saveIfNeeded()
            }
        }
        
        #if os(macOS)
        Settings {
            if let container = modelContainer {
                SettingsView()
                    .environment(familySharingSettings)
                    .modelContainer(container)
            } else {
                ProgressView("Lade Daten...")
                    .frame(minWidth: 500, minHeight: 600)
                    .task {
                        await createModelContainer()
                    }
            }
        }
        #endif
    }
    
    @MainActor
    private func createModelContainer() async {
        let modelConfiguration = familySharingSettings.getModelConfiguration()
        
        // Try to create container without migration plan first (for fresh installs or V2 databases)
        do {
            modelContainer = try ModelContainer(
                for: Product.self, Purchase.self,
                configurations: modelConfiguration
            )
            familySharingSettings.restartRequired = false
            print("✅ ModelContainer created successfully")
        } catch {
            print("⚠️ Standard container creation failed: \(error)")
            print("🔄 Attempting to create container with migration support...")
            
            // If that fails, try with migration plan (for V1 databases that need migration)
            do {
                modelContainer = try ModelContainer(
                    for: Product.self, Purchase.self,
                    migrationPlan: AllesTeurerMigrationPlan.self,
                    configurations: modelConfiguration
                )
                familySharingSettings.restartRequired = false
                print("✅ ModelContainer created successfully with migration support")
            } catch {
                print("❌ Could not create ModelContainer with migration: \(error)")
                
                // Final fallback: Local storage without CloudKit
                let fallbackConfig = ModelConfiguration(isStoredInMemoryOnly: false)
                do {
                    modelContainer = try ModelContainer(
                        for: Product.self, Purchase.self,
                        configurations: fallbackConfig
                    )
                    familySharingSettings.isFamilySharingEnabled = false
                    print("⚠️ Fallback ModelContainer created (family sharing disabled)")
                } catch {
                    fatalError("❌ Could not create fallback ModelContainer: \(error)")
                }
            }
        }
    }
    
    private func saveIfNeeded() {
        guard let container = modelContainer else { return }
        let context = container.mainContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving: \(error)")
            }
        }
    }
}

#if os(macOS)
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
#endif
