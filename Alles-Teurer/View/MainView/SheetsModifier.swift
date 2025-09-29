//
//  SheetsModifier.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 29.09.25.
//


import SwiftData
import SwiftUI
import UniformTypeIdentifiers

struct SheetsModifier: ViewModifier {
    let viewModel: ContentViewModel?
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: Binding(
                get: { viewModel?.showingAddSheet ?? false },
                set: { viewModel?.showingAddSheet = $0 }
            )) {
                AddRechnungszeileView()
            }
            .fullScreenCover(isPresented: Binding(
                get: { viewModel?.showingScanSheet ?? false },
                set: { viewModel?.showingScanSheet = $0 }
            )) {
                ScanReceiptView()
            }
    }
}