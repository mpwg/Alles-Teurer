//
//  Alles_TeurerApp.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 25.09.25.
//

import SwiftData
import SwiftUI

@main
struct Alles_TeurerApp: App {
    var sharedModelContainer: ModelContainer = {

        let modelConfiguration = ModelConfiguration(
            isStoredInMemoryOnly: false,

        )

        do {
            let container = try ModelContainer()
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
