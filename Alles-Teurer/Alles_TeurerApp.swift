//
//  Alles_TeurerApp.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 25.09.25.
//

import Foundation
import SwiftData
import SwiftUI

@main
struct Alles_TeurerApp: App {
    var sharedModelContainer: ModelContainer = {
        let modelConfiguration = ModelConfiguration(
            isStoredInMemoryOnly: false
        )

        do {
            let container = try ModelContainer(for: Rechnungszeile.self)

            // Print the database location on launch (only in debug builds and not in previews)
            #if DEBUG
                if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" {
                    print("📁 SwiftData Database Location Information:")

                    // Get the app's documents directory (where SwiftData typically stores databases)
                    if let documentsPath = FileManager.default.urls(
                        for: .documentDirectory, in: .userDomainMask
                    ).first {
                        print("📁 Documents Directory: \(documentsPath.path)")

                        // SwiftData typically creates a subdirectory with the app's bundle identifier
                        if let bundleID = Bundle.main.bundleIdentifier {
                            let swiftDataPath = documentsPath.appendingPathComponent(
                                "\(bundleID)_SwiftData")
                            print("📁 Expected SwiftData Directory: \(swiftDataPath.path)")
                        }

                        // The default database file is usually named "default.store"
                        let defaultStorePath = documentsPath.appendingPathComponent("default.store")
                        print("📁 Default Store Path: \(defaultStorePath.path)")
                    }
                }
            #endif

            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    setupAppearanceAndLogging()
                }
        }
        .modelContainer(sharedModelContainer)
    }

    private func setupAppearanceAndLogging() {
        #if DEBUG
            // This helps reduce CloudKit-related debug noise
            if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
                // Running in SwiftUI previews - skip additional setup
                return
            }

            // Additional setup to reduce system log noise
            UserDefaults.standard.set(false, forKey: "NSToolbarItemGroup.selectionMode.debug")
        #endif
    }
}
