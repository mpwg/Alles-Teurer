//
//  ContentView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 25.09.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Rechnungszeile]
    @State private var viewModel: ContentViewModel
    
    init() {
        // ViewModel will be initialized in the view's body using the environment
        _viewModel = State(wrappedValue: ContentViewModel(modelContext: ModelContext(try! ModelContainer(for: Rechnungszeile.self))))
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        ItemDetailView(item: item)
                    } label: {
                        ItemRowView(item: item)
                    }
                }
                .onDelete { offsets in
                    withAnimation {
                        viewModel.deleteItems(at: offsets, from: items)
                    }
                }
            }
            .navigationTitle("Rechnungen")
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: {
                        withAnimation {
                            viewModel.addItem()
                        }
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                    .accessibilityLabel("Neue Rechnung hinzufügen")
                }
                
                ToolbarItem {
                    Button(action: {
                        withAnimation {
                            viewModel.generateTestData()
                        }
                    }) {
                        Label("Test Data", systemImage: "testtube.2")
                    }
                    .accessibilityLabel("Testdaten generieren")
                }
            }
        } detail: {
            Text("Wählen Sie eine Rechnung aus")
                .foregroundStyle(.secondary)
        }
        .onAppear {
            // Reinitialize viewModel with the actual modelContext from environment
            viewModel = ContentViewModel(modelContext: modelContext)
        }
    }
}

struct ItemRowView: View {
    let item: Rechnungszeile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(item.Name)
                    .font(.headline)
                Spacer()
                Text(item.Price, format: .currency(code: "EUR"))
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            
            HStack {
                Text(item.Shop)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(item.Datum, format: Date.FormatStyle(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(item.Name), \(item.Price.formatted(.currency(code: "EUR"))), \(item.Shop), \(item.Datum.formatted(date: .abbreviated, time: .omitted))")
    }
}

struct ItemDetailView: View {
    let item: Rechnungszeile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(item.Name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            DetailRowView(label: "Preis", value: item.Price.formatted(.currency(code: "EUR")))
            DetailRowView(label: "Kategorie", value: item.Category)
            DetailRowView(label: "Geschäft", value: item.Shop)
            DetailRowView(label: "Datum", value: item.Datum.formatted(date: .complete, time: .shortened))
            
            Spacer()
        }
        .padding()
        .navigationTitle("Rechnung Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRowView: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .font(.body)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(label): \(value)")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Rechnungszeile.self, inMemory: true)
}
