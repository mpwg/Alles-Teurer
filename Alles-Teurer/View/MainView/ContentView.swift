//
//  ContentView 2.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import SwiftData
import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Rechnungszeile.Datum, order: .reverse) private var items: [Rechnungszeile]
    @State private var viewModel: ContentViewModel?
    @State private var selectedProduct: String?

    var body: some View {
        splitView
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
            .alert("Fehler", isPresented: errorAlertBinding) {
                Button("OK") { viewModel?.errorMessage = nil }
            } message: {
                Text(viewModel?.errorMessage ?? "")
            }
            .sheet(isPresented: Binding(
                get: { viewModel?.showingAddSheet ?? false },
                set: { _ in viewModel?.showingAddSheet = false }
            )) {
                NavigationStack {
                    AddRechnungszeileView()
                }
            }
            .sheet(isPresented: Binding(
                get: { viewModel?.showingScanSheet ?? false },
                set: { _ in viewModel?.showingScanSheet = false }
            )) {
                ScanReceiptView()
            }
            .fileExporter(
                isPresented: Binding(
                    get: { viewModel?.showingExportSheet ?? false },
                    set: { _ in viewModel?.showingExportSheet = false }
                ),
                document: viewModel?.csvData.map { CSVDocument(data: $0) },
                contentType: .commaSeparatedText,
                defaultFilename: viewModel?.generateCSVFilename() ?? "export.csv"
            ) { result in
                switch result {
                case .success(let url):
                    print("CSV exported successfully to: \(url)")
                case .failure(let error):
                    viewModel?.errorMessage = "Export failed: \(error.localizedDescription)"
                }
            }
            .confirmationDialog(
                "Alle Einträge löschen?",
                isPresented: Binding(
                    get: { viewModel?.showingDeleteAllConfirmation ?? false },
                    set: { _ in viewModel?.showingDeleteAllConfirmation = false }
                ),
                titleVisibility: .visible
            ) {
                Button("Alle löschen", role: .destructive) {
                    Task {
                        await viewModel?.confirmDeleteAll()
                    }
                }
                Button("Abbrechen", role: .cancel) { }
            } message: {
                Text("Diese Aktion löscht alle gespeicherten Einträge unwiderruflich.")
            }
            .sheet(isPresented: Binding(
                get: { viewModel?.showingEditSheet ?? false },
                set: { _ in viewModel?.showingEditSheet = false }
            )) {
                if let viewModel = viewModel, let itemToEdit = viewModel.itemToEdit {
                    NavigationStack {
                        EditRechnungszeileView(item: itemToEdit) { updatedItem in
                            Task {
                                await viewModel.updateItem(updatedItem)
                            }
                        }
                    }
                }
            }
    }
    
    // MARK: - Split View
    private var splitView: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            mainContent
                .standardToolbar(viewModel ?? ContentViewModel(modelContext: modelContext))
        } detail: {
            detailContent
        }
    }
    
    @ViewBuilder
    var mainContent: some View {
        if let viewModel = viewModel {
            let productGroups = createProductGroups(from: viewModel)
            
            if items.isEmpty {
                // Onboarding screen when no data is stored
                ContentUnavailableView {
                    Label("Willkommen bei Alles Teurer", systemImage: "cart.fill")
                } description: {
                    VStack(spacing: 16) {
                        Text("Beginnen Sie mit der Verfolgung Ihrer Einkäufe und beobachten Sie Preisentwicklungen.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                        
                        VStack(spacing: 12) {
                            Button {
                                viewModel.showingScanSheet = true
                            } label: {
                                HStack {
                                    Image(systemName: "qrcode.viewfinder")
                                    Text("Rechnung scannen")
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.large)
                            
                            Button {
                                viewModel.showingAddSheet = true
                            } label: {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("Artikel hinzufügen")
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            
                            #if DEBUG
                            Button {
                                Task {
                                    await viewModel.generateTestData()
                                }
                            } label: {
                                HStack {
                                    Image(systemName: "testtube.2")
                                    Text("Testdaten generieren")
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.regular)
                            .foregroundColor(.orange)
                            #endif
                        }
                        .padding(.horizontal, 32)
                    }
                } actions: {
                    // Actions are handled in the description block above
                }
            } else {
                ZStack {
                    #if os(iOS)
                    let isEditingMode = viewModel.editMode == .active
                    #else
                    let isEditingMode = viewModel.isEditing
                    #endif
                    
                    if isEditingMode {
                        // Show individual items for editing
                        let individualItems = viewModel.items.map { item in
                            ListItem(
                                rechnungszeile: item,
                                isHighestPrice: viewModel.priceAnalysis.highest?.id == item.id,
                                isLowestPrice: viewModel.priceAnalysis.lowest?.id == item.id,
                                isSelected: false
                            )
                        }
                        
                        RechnungsZeilenListView(
                            individualItems: individualItems,
                            onItemToggleSelection: { _ in },
                            onItemEdit: { item in
                                viewModel.itemToEdit = item
                                viewModel.showingEditSheet = true
                            }
                        )
                    } else {
                        // Show product groups for navigation
                        RechnungsZeilenListView(
                            productGroups: productGroups,
                            selection: $selectedProduct,
                            onProductDelete: { productNames in
                                Task {
                                    let itemsToDelete = productNames.flatMap { viewModel.productGroups[$0] ?? [] }
                                    await viewModel.deleteItems(itemsToDelete)
                                    selectedProduct = nil
                                }
                            }
                        )
                    }
                }
                #if os(iOS)
                .environment(\.editMode, Binding(
                    get: { viewModel.editMode },
                    set: { viewModel.editMode = $0 }
                ))
                #endif
            }
        } else {
            // Loading state while ViewModel is being initialized
            ContentUnavailableView("Loading...", systemImage: "clock")
        }
        

    }
    
    // MARK: - Helper Methods
    
    private func createProductGroups(from viewModel: ContentViewModel) -> [ProductGroup] {
        return viewModel.uniqueProductNames.compactMap { productName in
            guard let items = viewModel.productGroups[productName],
                  let latestItem = items.max(by: { $0.Datum < $1.Datum }) else {
                return nil
            }
            
            return ProductGroup(
                productName: productName,
                items: items,
                latestItem: latestItem,
                isHighestPrice: viewModel.priceAnalysis.highest?.id == latestItem.id,
                isLowestPrice: viewModel.priceAnalysis.lowest?.id == latestItem.id
            )
        }
    }
    
    @ViewBuilder
    private var detailContent: some View {
        Group {
            if let selectedProduct = selectedProduct,
               let viewModel = viewModel,
               let items = viewModel.productGroups[selectedProduct] {
                ProductDetailView(
                    productName: selectedProduct,
                    items: items,
                    onDelete: { itemsToDelete in
                        await viewModel.deleteItems(itemsToDelete)
                        if viewModel.productGroups[selectedProduct]?.isEmpty != false {
                            self.selectedProduct = nil
                        }
                    }
                )
            } else {
                Text("Wählen Sie einen Artikel aus")
            }
        }
    }
    
    private var errorAlertBinding: Binding<Bool> {
        Binding(
            get: { viewModel?.errorMessage != nil },
            set: { _ in }
        )
    }
    
    private func toggleEditMode() {
        withAnimation {
            #if os(iOS)
            viewModel?.editMode = viewModel?.editMode == .active ? .inactive : .active
            #else
            viewModel?.isEditing.toggle()
            #endif
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        guard let viewModel = viewModel else { return }
        let itemsToDelete = offsets.map { viewModel.items[$0] }
        Task {
            await viewModel.deleteItems(itemsToDelete)
        }
    }
    

}
