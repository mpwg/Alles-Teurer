//
//  Alles_TeurerApp.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 25.09.25.
//

import SwiftUI
import SwiftData

@main
struct Alles_TeurerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Rechnungszeile.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
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
