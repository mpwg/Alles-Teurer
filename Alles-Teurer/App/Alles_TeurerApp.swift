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
            } catch {
                fatalError("Could not create fallback ModelContainer: \(error)")
            }
        }
    }
}
