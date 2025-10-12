//
//  ReceiptScanView.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 12.10.25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct ReceiptScanView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var viewModel = ReceiptScanViewModel()
    @State private var showingEditSheet = false
    @State private var editingItem: DetectedPurchaseItem?
    @State private var showingCamera = false
    @State private var showingSaveConfirmation = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Photo Selection Section
                photoSelectionSection
                
                if viewModel.isProcessing {
                    processingView
                } else if !viewModel.detectedItems.isEmpty {
                    // Receipt Header
                    receiptHeaderSection
                    
                    Divider()
                    
                    // Detected Items List
                    detectedItemsList
                } else if viewModel.scannedImage != nil {
                    emptyStateView
                }
            }
            .navigationTitle("Beleg scannen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Abbrechen") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Speichern") {
                        saveAllPurchases()
                    }
                    .disabled(viewModel.detectedItems.isEmpty)
                }
            }
            .sheet(isPresented: $showingEditSheet) {
                if let item = editingItem {
                    EditDetectedItemSheet(
                        item: item,
                        onSave: { updatedItem in
                            viewModel.updateItem(
                                updatedItem,
                                name: updatedItem.productName,
                                quantity: updatedItem.quantity,
                                unit: updatedItem.unit,
                                totalPrice: updatedItem.totalPrice
                            )
                        }
                    )
                }
            }
            .alert("Fehler", isPresented: .constant(viewModel.errorMessage != nil)) {
                Button("OK") {
                    viewModel.errorMessage = nil
                }
            } message: {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
            .alert("Gespeichert", isPresented: $showingSaveConfirmation) {
                Button("OK") {
                    dismiss()
                }
            } message: {
                Text("\(viewModel.detectedItems.count) Einkäufe wurden gespeichert")
            }
        }
    }
    
    // MARK: - Photo Selection Section
    
    private var photoSelectionSection: some View {
        VStack(spacing: 16) {
            if let image = viewModel.scannedImage {
                // Show selected image
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 200)
                    .cornerRadius(12)
                    .shadow(radius: 4)
            } else {
                // Photo selection buttons
                VStack(spacing: 12) {
                    Image(systemName: "doc.text.viewfinder")
                        .font(.system(size: 60))
                        .foregroundStyle(.secondary)
                    
                    Text("Beleg fotografieren oder auswählen")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 12) {
                        // Camera Button (iOS only)
                        #if os(iOS)
                        Button {
                            showingCamera = true
                        } label: {
                            Label("Foto aufnehmen", systemImage: "camera")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        #endif
                        
                        // Photo Library Button
                        PhotosPicker(
                            selection: $viewModel.selectedPhotoItem,
                            matching: .images
                        ) {
                            Label("Foto wählen", systemImage: "photo")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                }
                .padding()
            }
        }
        .padding()
        .onChange(of: viewModel.selectedPhotoItem) { _, _ in
            Task {
                await viewModel.loadSelectedPhoto()
            }
        }
    }
    
    // MARK: - Processing View
    
    private var processingView: some View {
        VStack(spacing: 20) {
            ProgressView()
                .scaleEffect(1.5)
            
            Text("Beleg wird analysiert...")
                .font(.headline)
            
            Text("Artikel werden erkannt und extrahiert")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - Receipt Header Section
    
    private var receiptHeaderSection: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Geschäft")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    TextField("Geschäftsname", text: $viewModel.shopName)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .textFieldStyle(.plain)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Datum")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    DatePicker(
                        "",
                        selection: $viewModel.receiptDate,
                        displayedComponents: .date
                    )
                    .labelsHidden()
                }
            }
            
            // Summary
            HStack {
                Text("\(viewModel.detectedItems.count) Artikel")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                let total = viewModel.detectedItems.reduce(0.0) { $0 + $1.totalPrice }
                Text("Gesamt: \(total, format: .currency(code: "EUR"))")
                    .font(.headline)
            }
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - Detected Items List
    
    private var detectedItemsList: some View {
        List {
            ForEach(viewModel.detectedItems) { item in
                DetectedItemRow(item: item)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        editingItem = item
                        showingEditSheet = true
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            viewModel.removeItem(item)
                        } label: {
                            Label("Löschen", systemImage: "trash")
                        }
                    }
            }
            .onDelete(perform: viewModel.removeItem)
        }
        .listStyle(.plain)
    }
    
    // MARK: - Empty State
    
    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 50))
                .foregroundStyle(.secondary)
            
            Text("Keine Artikel erkannt")
                .font(.headline)
            
            Text("Bitte versuchen Sie ein anderes Foto oder fügen Sie Artikel manuell hinzu")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: - Actions
    
    private func saveAllPurchases() {
        do {
            try viewModel.savePurchases(to: modelContext)
            showingSaveConfirmation = true
        } catch {
            viewModel.errorMessage = "Fehler beim Speichern: \(error.localizedDescription)"
        }
    }
}

// MARK: - Detected Item Row

struct DetectedItemRow: View {
    let item: DetectedPurchaseItem
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.productName)
                    .font(.body)
                    .fontWeight(.medium)
                
                HStack(spacing: 8) {
                    Text("\(item.quantity.formatted()) \(item.unit)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text("•")
                        .foregroundStyle(.secondary)
                    
                    Text("\(item.pricePerUnit, format: .currency(code: "EUR"))/\(item.unit)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            
            Spacer()
            
            Text(item.totalPrice, format: .currency(code: "EUR"))
                .font(.headline)
                .foregroundStyle(.primary)
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Edit Detected Item Sheet

struct EditDetectedItemSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var editedItem: DetectedPurchaseItem
    let onSave: (DetectedPurchaseItem) -> Void
    
    init(item: DetectedPurchaseItem, onSave: @escaping (DetectedPurchaseItem) -> Void) {
        _editedItem = State(initialValue: item)
        self.onSave = onSave
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Produktinformation") {
                    TextField("Produktname", text: $editedItem.productName)
                }
                
                Section("Menge & Preis") {
                    HStack {
                        Text("Menge")
                        Spacer()
                        TextField("Menge", value: $editedItem.quantity, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 100)
                    }
                    
                    TextField("Einheit", text: $editedItem.unit)
                    
                    HStack {
                        Text("Gesamtpreis")
                        Spacer()
                        TextField("Preis", value: $editedItem.totalPrice, format: .currency(code: "EUR"))
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 100)
                    }
                }
                
                Section {
                    HStack {
                        Text("Preis pro Einheit")
                        Spacer()
                        Text(editedItem.pricePerUnit, format: .currency(code: "EUR"))
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Artikel bearbeiten")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Abbrechen") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Speichern") {
                        onSave(editedItem)
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        ReceiptScanView()
            .modelContainer(for: [Product.self, Purchase.self], inMemory: true)
    }
}
