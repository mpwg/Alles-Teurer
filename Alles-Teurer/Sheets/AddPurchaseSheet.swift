//
//  AddPurchaseSheet.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI
import SwiftData

struct AddPurchaseSheet: View {
    @Environment(\.dismiss) private var dismiss
    let productViewModel: ProductViewModel
    @State private var purchaseViewModel: PurchaseViewModel
    
    init(productViewModel: ProductViewModel, modelContext: ModelContext) {
        self.productViewModel = productViewModel
        _purchaseViewModel = State(initialValue: PurchaseViewModel(modelContext: modelContext, productViewModel: productViewModel))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Einkauf hinzufügen")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 16) {
                // Product Name Entry
                VStack(alignment: .leading, spacing: 8) {
                    Text("Produkt")
                        .font(.headline)
                    
                    TextField("Produktname eingeben", text: $purchaseViewModel.productName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: purchaseViewModel.productName) { _, newValue in
                            // Update actualProductName if it's empty or was auto-filled
                            if purchaseViewModel.actualProductName.isEmpty || purchaseViewModel.actualProductName == purchaseViewModel.selectedProduct?.normalizedName {
                                purchaseViewModel.actualProductName = newValue
                            }
                            // Clear selected product if user is typing
                            purchaseViewModel.selectedProduct = nil
                        }
                    
                    // Static product suggestions (always visible)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(purchaseViewModel.productSuggestions, id: \.self) { product in
                                Button(product) {
                                    purchaseViewModel.selectProductByName(product)
                                }
                                .buttonStyle(.bordered)
                                .font(.caption)
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    
                    // Autocomplete suggestions (when typing)
                    if !purchaseViewModel.productName.isEmpty {
                        let filteredProducts = purchaseViewModel.filteredProducts(matching: purchaseViewModel.productName)
                        
                        if !filteredProducts.isEmpty {
                            Text("Vorschläge aus der Datenbank:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.top, 4)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(filteredProducts.prefix(8), id: \.self) { product in
                                        Button(product.normalizedName) {
                                            purchaseViewModel.selectProduct(product)
                                        }
                                        .buttonStyle(.borderedProminent)
                                        .font(.caption)
                                    }
                                }
                                .padding(.horizontal, 4)
                            }
                        }
                    }
                }
                
                // Shop Name
                VStack(alignment: .leading, spacing: 8) {
                    Text("Geschäft")
                        .font(.headline)
                    
                    TextField("Geschäft eingeben", text: $purchaseViewModel.shopName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Static shop suggestions (always visible)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(purchaseViewModel.shopSuggestions, id: \.self) { shop in
                                Button(shop) {
                                    purchaseViewModel.shopName = shop
                                }
                                .buttonStyle(.bordered)
                                .font(.caption)
                            }
                        }
                        .padding(.horizontal, 4)
                    }
                    
                    // Autocomplete suggestions for shops (when typing)
                    if !purchaseViewModel.shopName.isEmpty {
                        // Get unique shop names from all purchases
                        let allShopNames = Set(productViewModel.products.flatMap { ($0.purchases ?? []).map { $0.shopName } })
                        let filteredShops = allShopNames.filter {
                            $0.localizedCaseInsensitiveContains(purchaseViewModel.shopName) &&
                            $0.lowercased() != purchaseViewModel.shopName.lowercased()
                        }.sorted()
                        
                        if !filteredShops.isEmpty {
                            Text("Vorschläge aus der Datenbank:")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.top, 4)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(filteredShops.prefix(8), id: \.self) { shop in
                                        Button(shop) {
                                            purchaseViewModel.shopName = shop
                                        }
                                        .buttonStyle(.borderedProminent)
                                        .font(.caption)
                                    }
                                }
                                .padding(.horizontal, 4)
                            }
                        }
                    }
                }
                
                // Actual Product Name
                VStack(alignment: .leading, spacing: 8) {
                    Text("Produktname im Geschäft")
                        .font(.headline)
                    
                    TextField("Wie das Produkt im Geschäft heißt", text: $purchaseViewModel.actualProductName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Price, Quantity, and Unit
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Gesamtpreis")
                            .font(.headline)
                        
                        TextField("0.00", value: $purchaseViewModel.totalPrice, format: .currency(code: "EUR"))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            #if os(iOS)
                            .keyboardType(.decimalPad)
                            #endif
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Menge")
                            .font(.headline)
                        
                        TextField("1.0", value: $purchaseViewModel.quantity, format: .number.precision(.fractionLength(0...2)))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            #if os(iOS)
                            .keyboardType(.decimalPad)
                            #endif
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Einheit")
                            .font(.headline)
                        
                        Picker("Einheit", selection: $purchaseViewModel.unit) {
                            Text("Stk").tag("Stk")
                            Text("kg").tag("kg")
                            Text("g").tag("g")
                            Text("l").tag("l")
                            Text("ml").tag("ml")
                            Text("m").tag("m")
                            Text("cm").tag("cm")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                
                // Date
                VStack(alignment: .leading, spacing: 8) {
                    Text("Datum")
                        .font(.headline)
                    
                    DatePicker("Kaufdatum", selection: $purchaseViewModel.purchaseDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                }
                
                // Price per unit calculation
                if purchaseViewModel.totalPrice > 0 && purchaseViewModel.quantity > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Preis pro \(purchaseViewModel.unit)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text((purchaseViewModel.totalPrice / purchaseViewModel.quantity).formatted(.currency(code: "EUR")))
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .padding(.top, 8)
                }
            }
            
            Spacer()
            
            HStack {
                Button("Abbrechen") {
                    dismiss()
                }
                #if os(macOS)
                .keyboardShortcut(.cancelAction)
                #endif
                
                Spacer()
                
                Button("Speichern") {
                    purchaseViewModel.addPurchase()
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                #if os(macOS)
                .keyboardShortcut(.defaultAction)
                #endif
                .disabled(!purchaseViewModel.isValidPurchase)
            }
        }
        .padding(24)
        #if os(macOS)
        .frame(minWidth: 500, minHeight: 600)
        #endif
    }
}

#Preview {
    let config = SwiftData.ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! SwiftData.ModelContainer(for: Product.self, configurations: config)
    let context = container.mainContext
    let productViewModel = ProductViewModel(modelContext: context)
    
    return AddPurchaseSheet(productViewModel: productViewModel, modelContext: context)
        .modelContainer(container)
}