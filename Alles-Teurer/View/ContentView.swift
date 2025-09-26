//
//  ContentView 2.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel: ContentViewModel?
    @State private var selectedProduct: String?
    
    private var showingAddSheetBinding: Binding<Bool> {
        Binding(
            get: { viewModel?.showingAddSheet ?? false },
            set: { viewModel?.showingAddSheet = $0 }
        )
    }
    
    private var editModeBinding: Binding<EditMode> {
        Binding(
            get: { viewModel?.editMode ?? .inactive },
            set: { viewModel?.editMode = $0 }
        )
    }
    
    private var showingScanSheetBinding: Binding<Bool> {
        Binding(
            get: { viewModel?.showingScanSheet ?? false },
            set: { viewModel?.showingScanSheet = $0 }
        )
    }

    var body: some View {
        NavigationSplitView {
            mainContent
        } detail: {
            detailContent
        }
        .task {
            if viewModel == nil {
                viewModel = ContentViewModel(modelContext: modelContext)
            }
        }
        .alert("Fehler", isPresented: errorAlertBinding) {
            Button("OK") {
                viewModel?.errorMessage = nil
            }
        } message: {
            Text(viewModel?.errorMessage ?? "Unbekannter Fehler")
        }
        .sheet(isPresented: showingAddSheetBinding) {
            AddItemView()
        }
        .fullScreenCover(isPresented: showingScanSheetBinding) {
            ScanReceiptView()
            
        }
        
    }
    
        @ViewBuilder
     var mainContent: some View {
        if let viewModel = viewModel {
            ZStack {
                productList(viewModel: viewModel)
                .environment(\.editMode, editModeBinding)
            }
            .toolbar {
                ToolbarItemGroup {
  /*                  Button("Bearbeiten", systemImage: "plus")
                    {
                        viewModel.editMode = viewModel.editMode == .active ? .inactive : .active
                    }
    */
                    
                    Button("Alle löschen", systemImage: "trash.fill") {
                        Task {
                            await viewModel.deleteAllItems()
                        }
                    }
                    .foregroundColor(.red)
                    
                    Button("Testdaten generieren", systemImage: "testtube.2") {
                        Task {
                            await viewModel.generateTestData()
                        }
                    }
                    
                    
                    Button ("hinzufügen", systemImage: "plus"){
                        viewModel.showingAddSheet = true
                    }
                    
                    Button ("Rechnung scannen", systemImage: "qrcode.viewfinder"){
                        viewModel.showingScanSheet = true
                    }
                }
            }
        } else {
            ContentUnavailableView("Loading...", systemImage: "clock")
        }
    }
    
    @ViewBuilder
    private func productList(viewModel: ContentViewModel) -> some View {
        List(selection: $selectedProduct) {
            ForEach(viewModel.uniqueProductNames, id: \.self) { productName in
                NavigationLink(value: productName) {
                    productRow(productName: productName, viewModel: viewModel)
                }
            }
            .onDelete { indexSet in
                deleteProducts(at: indexSet, viewModel: viewModel)
            }
        }
        .refreshable {
            await viewModel.loadItems()
        }
    }
    
    @ViewBuilder
    private func productRow(productName: String, viewModel: ContentViewModel) -> some View {
        if let items = viewModel.productGroups[productName],
           let latestItem = items.max(by: { $0.Datum < $1.Datum }) {
            RechnungszeileRow(
                item: latestItem,
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
            viewModel?.editMode = viewModel?.editMode == .active ? .inactive : .active
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        guard let viewModel = viewModel else { return }
        let itemsToDelete = offsets.map { viewModel.items[$0] }
        Task {
            await viewModel.deleteItems(itemsToDelete)
        }
    }
    
    private func deleteProducts(at indexSet: IndexSet, viewModel: ContentViewModel) {
        let productNames = indexSet.map { viewModel.uniqueProductNames[$0] }
        let itemsToDelete = productNames.flatMap { viewModel.productGroups[$0] ?? [] }
        Task {
            await viewModel.deleteItems(itemsToDelete)
            selectedProduct = nil
        }
    }
}
