//
//  EditProductSheet.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI
import SwiftData

struct EditProductSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    let product: Product
    @State private var editingName: String
    
    init(product: Product) {
        self.product = product
        self._editingName = State(initialValue: product.normalizedName)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Produkt bearbeiten")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Produktname")
                    .font(.headline)
                
                TextField("Produktname eingeben", text: $editingName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.body)
                    #if os(macOS)
                    .frame(minWidth: 300)
                    #endif
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
                    saveProductName()
                }
                .buttonStyle(.borderedProminent)
                #if os(macOS)
                .keyboardShortcut(.defaultAction)
                #endif
                .disabled(editingName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding(24)
        #if os(macOS)
        .frame(minWidth: 400, minHeight: 250)
        #endif
    }
    
    private func saveProductName() {
        let trimmedName = editingName.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedName.isEmpty {
            product.normalizedName = trimmedName
            try? modelContext.save()
        }
        dismiss()
    }
}

#Preview {
    EditProductSheet(product: TestData.sampleProducts[0])
}