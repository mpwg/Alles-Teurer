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
    @State private var columnVisibility = NavigationSplitViewVisibility.all

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
            
            NavigationSplitView(columnVisibility: $columnVisibility) {
            if filteredProducts.isEmpty {
                ContentUnavailableView {
                    if products.isEmpty {
                        Label("Keine Produkte", systemImage: "cart")
                    } else {
                        Label("Keine Suchergebnisse", systemImage: "magnifyingglass")
                    }
                } description: {
                    if products.isEmpty {
                        Text("Fügen Sie Ihren ersten Einkauf hinzu oder laden Sie Beispieldaten in den Einstellungen.")
                    } else {
                        Text("Versuchen Sie es mit einem anderen Suchbegriff.")
                    }
                } actions: {
                    if products.isEmpty {
                        VStack(spacing: 12) {
                            Button {
                                showingAddPurchaseSheet = true
                            } label: {
                                Label("Ersten Einkauf hinzufügen", systemImage: "plus")
                            }
                            .buttonStyle(.borderedProminent)
                            
                            Button {
                                showingSettings = true
                            } label: {
                                Label("Zu den Einstellungen", systemImage: "gearshape")
                            }
                            .buttonStyle(.bordered)
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
                            
                            Button {
                                withAnimation {
                                    columnVisibility = columnVisibility == .all ? .doubleColumn : .all
                                }
                            } label: {
                                Label("Seitenleiste", systemImage: columnVisibility == .all ? "sidebar.right" : "sidebar.left")
                            }
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
                            withAnimation {
                                columnVisibility = columnVisibility == .all ? .doubleColumn : .all
                            }
                        } label: {
                            Label("Seitenleiste", systemImage: columnVisibility == .all ? "sidebar.right" : "sidebar.left")
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
            } else {
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
                        
                        Button {
                            withAnimation {
                                columnVisibility = columnVisibility == .all ? .doubleColumn : .all
                            }
                        } label: {
                            Label("Seitenleiste", systemImage: columnVisibility == .all ? "sidebar.right" : "sidebar.left")
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
                        withAnimation {
                            columnVisibility = columnVisibility == .all ? .doubleColumn : .all
                        }
                    } label: {
                        Label("Seitenleiste", systemImage: columnVisibility == .all ? "sidebar.right" : "sidebar.left")
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
            }
        } content: {
            if let selectedProduct = selectedProduct {
                ProductDetailView(product: selectedProduct)
            } else {
                ContentUnavailableView {
                    Label("Produkt auswählen", systemImage: "cart")
                } description: {
                    Text("Wählen Sie ein Produkt aus der Liste aus, um Details anzuzeigen.")
                }
            }
        } detail: {
            if let selectedProduct = selectedProduct {
                PurchaseListView(product: selectedProduct)
            } else {
                ContentUnavailableView {
                    Label("Einkaufshistorie", systemImage: "clock")
                } description: {
                    Text("Wählen Sie ein Produkt aus, um die Einkaufshistorie anzuzeigen.")
                }
            }
        }
        .navigationSplitViewColumnWidth(min: 250, ideal: 300, max: 400)
        .navigationSplitViewColumnWidth(min: 450, ideal: 550, max: 700)
        .navigationSplitViewColumnWidth(min: 350, ideal: 450, max: 600)
        .sheet(isPresented: $showingAddPurchaseSheet) {
            AddPurchaseSheet()
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
                .environment(familySharingSettings)
        }
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
