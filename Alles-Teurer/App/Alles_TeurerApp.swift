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
            SettingsView()
                .environment(familySharingSettings)
                .modelContainer(modelContainer ?? createEmptyContainer())
        }
        #endif
    }
    
    @MainActor
    private func createModelContainer() async {
        let schema = Schema([
            Product.self,
            Purchase.self,
        ])
        
        let modelConfiguration = familySharingSettings.getModelConfiguration()
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            familySharingSettings.restartRequired = false
        } catch {
            print("Could not create ModelContainer: \(error)")
            // Fallback to local storage if CloudKit fails
            let fallbackConfig = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            do {
                modelContainer = try ModelContainer(for: schema, configurations: [fallbackConfig])
                familySharingSettings.isFamilySharingEnabled = false
            } catch {
                fatalError("Could not create fallback ModelContainer: \(error)")
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
    
    private func createEmptyContainer() -> ModelContainer {
        let schema = Schema([
            Product.self,
            Purchase.self,
        ])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        return try! ModelContainer(for: schema, configurations: [config])
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
