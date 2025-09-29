//
//  RechnungsZeilenListView 2.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 28.09.25.
//


import SwiftUI
import SwiftData

struct RechnungsZeilenListView: View {
    let configuration: ListConfiguration
    let productGroups: [ProductGroup]
    let individualItems: [ListItem]
    let onProductSelected: ((String) -> Void)?
    let onItemToggleSelection: ((Rechnungszeile) -> Void)?
    let onItemEdit: ((Rechnungszeile) -> Void)?
    let onProductDelete: (([String]) -> Void)?
    let onItemsDelete: (([Rechnungszeile]) -> Void)?
    
    @Binding var selection: String?
    
    init(
        configuration: ListConfiguration,
        productGroups: [ProductGroup] = [],
        individualItems: [ListItem] = [],
        selection: Binding<String?> = .constant(nil),
        onProductSelected: ((String) -> Void)? = nil,
        onItemToggleSelection: ((Rechnungszeile) -> Void)? = nil,
        onItemEdit: ((Rechnungszeile) -> Void)? = nil,
        onProductDelete: (([String]) -> Void)? = nil,
        onItemsDelete: (([Rechnungszeile]) -> Void)? = nil
    ) {
        self.configuration = configuration
        self.productGroups = productGroups
        self.individualItems = individualItems
        self._selection = selection
        self.onProductSelected = onProductSelected
        self.onItemToggleSelection = onItemToggleSelection
        self.onItemEdit = onItemEdit
        self.onProductDelete = onProductDelete
        self.onItemsDelete = onItemsDelete
    }
    
    var body: some View {
        switch configuration.displayMode {
        case .productGroups:
            productGroupsList
        case .individualItems:
            individualItemsList
        }
    }
    
    // MARK: - Product Groups List
    
    @ViewBuilder
    private var productGroupsList: some View {
        List(selection: configuration.interactionMode == .navigation ? $selection : .constant(nil)) {
            ForEach(productGroups) { productGroup in
                if configuration.interactionMode == .navigation {
                    NavigationLink(value: productGroup.productName) {
                        ProduktRow(
                            item: productGroup.latestItem,
                            isHighestPrice: productGroup.isHighestPrice,
                            isLowestPrice: productGroup.isLowestPrice
                        )
                    }
                } else {
                    ProduktRow(
                        item: productGroup.latestItem,
                        isHighestPrice: productGroup.isHighestPrice,
                        isLowestPrice: productGroup.isLowestPrice
                    )
                    .onTapGesture {
                        onProductSelected?(productGroup.productName)
                    }
                }
            }
            .onDelete { indexSet in
                if let onProductDelete = onProductDelete {
                    let productNames = indexSet.map { productGroups[$0].productName }
                    onProductDelete(productNames)
                }
            }
        }
    }
    
    // MARK: - Individual Items List
    
    @ViewBuilder
    private var individualItemsList: some View {
        if individualItems.isEmpty {
            Text("Keine Rechnungszeilen erkannt")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        } else {
            LazyVStack(spacing: 8) {
                ForEach(individualItems, id: \.id) { listItem in
                    individualItemRow(listItem)
                }
            }
        }
    }
    
    @ViewBuilder
    private func individualItemRow(_ listItem: ListItem) -> some View {
        HStack(spacing: 12) {
            // Selection checkbox
            if configuration.allowsSelection {
                selectionButton(for: listItem)
            }
            
            // Main item view with integrated edit button
            RechnungsZeileView(
                item: listItem.rechnungszeile,
                priceRange: priceRangeForItems,
                onEdit: configuration.allowsEditing ? onItemEdit : nil
            )
        }
        .padding(12)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    listItem.isSelected ? Color.blue : Color(.systemGray4),
                    lineWidth: listItem.isSelected ? 2 : 1
                )
        )
        .contentShape(Rectangle())
        .onTapGesture {
            if configuration.allowsSelection {
                onItemToggleSelection?(listItem.rechnungszeile)
            }
        }
    }
    
    @ViewBuilder
    private func selectionButton(for listItem: ListItem) -> some View {
        Button {
            onItemToggleSelection?(listItem.rechnungszeile)
        } label: {
            Image(systemName: listItem.isSelected ? "checkmark.circle.fill" : "circle")
                .font(.title2)
                .foregroundStyle(listItem.isSelected ? .blue : .secondary)
        }
        .accessibilityLabel(listItem.isSelected ? "Abwählen" : "Auswählen")
    }
    

    
    // MARK: - Helper Properties
    
    private var priceRangeForItems: (min: Decimal, max: Decimal)? {
        guard !individualItems.isEmpty else { return nil }
        
        let prices = individualItems.map { $0.rechnungszeile.Price }
        guard let minPrice = prices.min(), let maxPrice = prices.max() else { return nil }
        
        return (min: minPrice, max: maxPrice)
    }
}

extension RechnungsZeilenListView {
    
    // For ContentView usage (product groups with navigation)
    init(
        productGroups: [ProductGroup],
        selection: Binding<String?>,
        onProductSelected: ((String) -> Void)? = nil,
        onProductDelete: (([String]) -> Void)? = nil
    ) {
        self.init(
            configuration: .productNavigation,
            productGroups: productGroups,
            selection: selection,
            onProductSelected: onProductSelected,
            onProductDelete: onProductDelete
        )
    }
    
    // For ScanReceiptView usage (individual items with selection)
    init(
        individualItems: [ListItem],
        onItemToggleSelection: @escaping (Rechnungszeile) -> Void,
        onItemEdit: ((Rechnungszeile) -> Void)? = nil
    ) {
        self.init(
            configuration: .itemSelection,
            individualItems: individualItems,
            onItemToggleSelection: onItemToggleSelection,
            onItemEdit: onItemEdit
        )
    }
}

#Preview("Product Groups") {
    let sampleDate = Date()
    let sampleRechnungszeile = Rechnungszeile(
        Name: "Milch",
        Price: 1.29,
        Category: "Molkereiprodukte",
        Shop: "Spar",
        Datum: sampleDate,
        NormalizedName: "Milch",
        PricePerUnit: 1.29
    )
    
    let productGroups = [
        ProductGroup(
            productName: "Milch",
            items: [sampleRechnungszeile],
            latestItem: sampleRechnungszeile,
            isHighestPrice: true,
            isLowestPrice: false
        )
    ]
    
    NavigationView {
        RechnungsZeilenListView(
            productGroups: productGroups,
            selection: .constant(nil)
        )
    }
}

#Preview("Individual Items") {
    let sampleDate = Date()
    let sampleRechnungszeile = Rechnungszeile(
        Name: "Milch",
        Price: 1.29,
        Category: "Molkereiprodukte",
        Shop: "Spar",
        Datum: sampleDate,
        NormalizedName: "Milch",
        PricePerUnit: 1.29
    )
    
    let listItems = [
        ListItem(
            rechnungszeile: sampleRechnungszeile,
            isHighestPrice: false,
            isLowestPrice: true,
            isSelected: true
        )
    ]
    
    RechnungsZeilenListView(
        individualItems: listItems,
        onItemToggleSelection: { _ in }
    )
}
