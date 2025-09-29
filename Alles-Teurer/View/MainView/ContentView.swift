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
    @State private var showingExportSheet = false
    @State private var csvData: Data?

    var body: some View {
        splitView
            .modifier(ViewModelSetupModifier(viewModel: $viewModel, items: items, modelContext: modelContext))
            .modifier(AlertsModifier(viewModel: viewModel))
            .modifier(SheetsModifier(viewModel: viewModel))
            .modifier(FileExporterModifier(viewModel: viewModel, showingExportSheet: $showingExportSheet, csvData: $csvData))
            .modifier(ConfirmationDialogModifier(viewModel: viewModel))
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
                .toolbar {
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button("Rechnung scannen", systemImage: "qrcode.viewfinder") {
                            viewModel.showingScanSheet = true
                        }
                        
                        Button("Hinzufügen", systemImage: "plus") {
                            viewModel.showingAddSheet = true
                        }
                        
                        #if DEBUG
                        Button("Testdaten", systemImage: "testtube.2") {
                            Task {
                                await viewModel.generateTestData()
                            }
                        }
                        #endif
                    }
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
                .toolbar {
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button("CSV Export", systemImage: "square.and.arrow.up") {
                            Task {
                                csvData = await viewModel.exportCSV()
                                if csvData != nil {
                                    showingExportSheet = true
                                }
                            }
                        }
                        
                        Button("Hinzufügen", systemImage: "plus") {
                            viewModel.showingAddSheet = true
                        }
                        
                        Button("Rechnung scannen", systemImage: "qrcode.viewfinder") {
                            viewModel.showingScanSheet = true
                        }
                        
                        #if DEBUG
                        Button("Testdaten", systemImage: "testtube.2") {
                            Task {
                                await viewModel.generateTestData()
                            }
                        }
                        #endif
                    }
                    
                    ToolbarItemGroup(placement: .secondaryAction) {
                        #if os(iOS)
                        Button(viewModel.editMode == .active ? "Fertig" : "Bearbeiten") {
                            toggleEditMode()
                        }
                        #else
                        Button(viewModel.isEditing ? "Fertig" : "Bearbeiten") {
                            toggleEditMode()
                        }
                        #endif
                        
                        Button("Alle löschen", systemImage: "trash.fill") {
                            viewModel.showingDeleteAllConfirmation = true
                        }
                        .foregroundColor(.red)
                    }
                }
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
