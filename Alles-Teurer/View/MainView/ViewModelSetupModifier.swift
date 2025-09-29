//
//  ViewModelSetupModifier.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 29.09.25.
//


import SwiftData
import SwiftUI
import UniformTypeIdentifiers

struct ViewModelSetupModifier: ViewModifier {
    @Binding var viewModel: ContentViewModel?
    let items: [Rechnungszeile]
    let modelContext: ModelContext
    
    func body(content: Content) -> some View {
        content
            .task {
                // Initialize ViewModel and load initial data
                if viewModel == nil {
                    viewModel = ContentViewModel(modelContext: modelContext)
                }
                // Always update with current items from @Query
                viewModel?.updateItems(items)
            }
            .onChange(of: items) { _, newItems in
                viewModel?.updateItems(newItems)
            }
    }
}