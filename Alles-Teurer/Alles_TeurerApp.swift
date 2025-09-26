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

            // Print the database location on launch
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

            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
