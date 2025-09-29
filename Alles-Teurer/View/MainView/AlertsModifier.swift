//
//  AlertsModifier.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 29.09.25.
//


import SwiftData
import SwiftUI
import UniformTypeIdentifiers

struct AlertsModifier: ViewModifier {
    let viewModel: ContentViewModel?
    
    private var errorAlertBinding: Binding<Bool> {
        Binding(
            get: { viewModel?.errorMessage != nil },
            set: { _ in }
        )
    }
    
    func body(content: Content) -> some View {
        content
            .alert("Fehler", isPresented: errorAlertBinding) {
                Button("OK") {
                    viewModel?.errorMessage = nil
                }
            } message: {
                Text(viewModel?.errorMessage ?? "Unbekannter Fehler")
            }
    }
}