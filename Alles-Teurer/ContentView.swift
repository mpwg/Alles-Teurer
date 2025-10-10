//
//  ContentView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(FamilySharingSettings.self) private var familySharingSettings
    @Query(sort: \Product.normalizedName) private var products: [Product]
    @State private var searchText = ""
    @State private var selectedProduct: Product?
    @State private var showingAddPurchaseSheet = false
    @State private var showingSettings = false

    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { $0.normalizedName.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Restart notification banner
            if familySharingSettings.restartRequired {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.orange)
                    Text("Neustart erforderlich")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    Spacer()
                    Button("Später") {
                        familySharingSettings.restartRequired = false
                    }
                    .font(.caption)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.orange.opacity(0.1))
                .border(Color.orange.opacity(0.3), width: 1)
            }
            
            NavigationSplitView {
            List(filteredProducts, selection: $selectedProduct) { product in
                ProductRowView(product: product)
                    .tag(product)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("Löschen", role: .destructive) {
                            deleteProduct(product)
                        }
                    }
                    .contextMenu {
                        Button("Löschen", role: .destructive) {
                            deleteProduct(product)
                        }
                    }
            }
            .navigationTitle("Alles Teurer 🛒")
            .searchable(text: $searchText, prompt: "Produkt suchen...")
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button {
                            showingSettings = true
                        } label: {
                            Label("Einstellungen", systemImage: "gearshape")
                        }
                        EditButton()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingAddPurchaseSheet = true
                    } label: {
                        Label("Einkauf hinzufügen", systemImage: "plus")
                    }
                }
                #else
                ToolbarItem(placement: .automatic) {
                    Button {
                        showingAddPurchaseSheet = true
                    } label: {
                        Label("Einkauf hinzufügen", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .automatic) {
                    Button {
                        showingSettings = true
                    } label: {
                        Label("Einstellungen", systemImage: "gearshape")
                    }
                }
                #endif
            }
            .onAppear {
                if products.isEmpty {
                    addSampleData()
                }
            }
        } detail: {
            if let selectedProduct = selectedProduct {
                ProductDetailView(product: selectedProduct)
            } else {
                ContentUnavailableView {
                    Label("Produkt auswählen", systemImage: "cart")
                } description: {
                    Text("Wählen Sie ein Produkt aus der Liste aus, um Details und Einkaufshistorie anzuzeigen.")
                }
            }
        }
        .sheet(isPresented: $showingAddPurchaseSheet) {
            AddPurchaseSheet()
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
        }
    }

    private func addSampleData() {
        withAnimation {
            TestData.createSampleData(in: modelContext)
        }
    }

    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            let productsToDelete = filteredProducts
            for index in offsets {
                modelContext.delete(productsToDelete[index])
            }
        }
    }
    
    private func deleteProduct(_ product: Product) {
        withAnimation {
            // If this product is selected and we're deleting it, clear the selection
            if selectedProduct == product {
                selectedProduct = nil
            }
            modelContext.delete(product)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Product.self, inMemory: true)
}
