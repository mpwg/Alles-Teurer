//
//  ConfirmationDialogModifier.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 29.09.25.
//


import SwiftData
import SwiftUI
import UniformTypeIdentifiers

struct ConfirmationDialogModifier: ViewModifier {
    let viewModel: ContentViewModel?
    
    func body(content: Content) -> some View {
        content
            .confirmationDialog(
                "Alle Artikel löschen?",
                isPresented: Binding(
                    get: { viewModel?.showingDeleteAllConfirmation ?? false },
                    set: { viewModel?.showingDeleteAllConfirmation = $0 }
                ),
                titleVisibility: .visible
            ) {
                Button("Alle löschen", role: .destructive) {
                    Task {
                        await viewModel?.deleteAllItems()
                    }
                }
                Button("Abbrechen", role: .cancel) { }
            } message: {
                Text("Diese Aktion kann nicht rückgängig gemacht werden. Alle gespeicherten Artikel werden unwiderruflich gelöscht.")
            }
    }
}