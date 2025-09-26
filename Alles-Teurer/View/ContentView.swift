//
//  ContentView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 25.09.25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel: ContentViewModel?

    var body: some View {
        NavigationSplitView {
            Group {
                if let viewModel = viewModel {
                    List {
                        ForEach(viewModel.items) { item in
                            RechnungszeileRow(
                                item: item,
                                isHighestPrice: viewModel.priceAnalysis.highest?.id == item.id,
                                isLowestPrice: viewModel.priceAnalysis.lowest?.id == item.id
                            )
                        }
                        .onDelete { indexSet in
                            let itemsToDelete = indexSet.map { viewModel.items[$0] }
                            Task {
                                await viewModel.deleteItems(itemsToDelete)
                            }
                        }
                    }
                    .refreshable {
                        await viewModel.loadItems()
                    }
                } else if viewModel?.isLoading == true {
                    ProgressView("Laden...")
                } else {
                    ProgressView("Initialisierung...")
                }
            }
            .navigationTitle("Rechnungen")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Bearbeiten") {
                        // Handle edit mode toggle - Mac Catalyst compatible
                        // This is a placeholder for edit functionality
                    }
                }
                ToolbarItem {
                    Button {
                        Task {
                            await viewModel?.addItem()
                        }
                    } label: {
                        Label("Artikel hinzufügen", systemImage: "plus")
                    }
                    .disabled(viewModel?.isLoading == true)
                }
            }
        } detail: {
            Text("Wählen Sie einen Artikel aus")
        }
        .task {
            if viewModel == nil {
                viewModel = ContentViewModel(modelContext: modelContext)
            }
        }
        .alert("Fehler", isPresented: .constant(viewModel?.errorMessage != nil)) {
            Button("OK") {
                viewModel?.errorMessage = nil
            }
        } message: {
            Text(viewModel?.errorMessage ?? "Unbekannter Fehler")
        }
    }
}





#Preview {
    ContentView()
        .modelContainer(for: Rechnungszeile.self, inMemory: true)
}
