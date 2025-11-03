//
//  ReceiptScanView.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 12.10.25.
//

import SwiftUI
import SwiftData
import PhotosUI

#if canImport(UIKit)
import UIKit
#endif

struct ReceiptScanView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let purchaseViewModel: PurchaseViewModel
    
    @State private var viewModel = ReceiptScanViewModel()
    @State private var showingEditSheet = false
    @State private var editingItem: DetectedPurchaseItem?
    @State private var showingCamera = false
    @State private var showingSaveConfirmation = false
    @State private var selectedImage: Image?
    
    #if os(iOS)
    @StateObject private var cameraPermission = CameraPermissionHelper()
    @State private var showingPermissionDeniedAlert = false
    #endif
    
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
                } else if selectedImage != nil {
                    emptyStateView
                }
            }
            .navigationTitle("Beleg scannen")
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
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
            #if os(iOS)
            .fullScreenCover(isPresented: $showingCamera) {
                ImagePicker(sourceType: .camera) { image in
                    handleCapturedImage(image)
                }
                .ignoresSafeArea()
            }
            .alert("Kamerazugriff benötigt", isPresented: $showingPermissionDeniedAlert) {
                Button("Einstellungen öffnen") {
                    cameraPermission.openSettings()
                }
                Button("Abbrechen", role: .cancel) {}
            } message: {
                Text("Um Belege zu fotografieren, benötigt die App Zugriff auf Ihre Kamera. Bitte aktivieren Sie den Kamerazugriff in den Einstellungen unter:\n\nEinstellungen → Alles Teurer → Kamera")
            }
            #endif
            .onAppear {
                // Inject dependencies when view appears
                viewModel.modelContext = modelContext
                viewModel.purchaseViewModel = purchaseViewModel
            }
        }
    }
    
    // MARK: - Photo Selection Section
    
    private var photoSelectionSection: some View {
        VStack(spacing: 16) {
            if let image = selectedImage {
                // Show selected image
                image
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
                            handleCameraButtonTap()
                        } label: {
                            Label("Foto aufnehmen", systemImage: "camera")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(!cameraPermission.isCameraAvailable)
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
        .onChange(of: viewModel.selectedPhotoItem) { oldValue, newValue in
            Task {
                // Load the image for display
                if let item = newValue {
                    selectedImage = try? await item.loadTransferable(type: Image.self)
                }
                // Process the receipt
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
                
                let total = viewModel.detectedItems.reduce(Decimal(0)) { $0 + $1.totalPrice }
                Text("Gesamt: \(NSDecimalNumber(decimal: total).doubleValue, format: .currency(code: "EUR"))")
                    .font(.headline)
            }
        }
        .padding()
        #if os(iOS)
        .background(Color(.systemGroupedBackground))
        #else
        .background(Color(nsColor: .controlBackgroundColor))
        #endif
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
    
    #if os(iOS)
    /// Handle camera button tap - check permissions first
    private func handleCameraButtonTap() {
        Task {
            // Check current status
            cameraPermission.checkPermissionStatus()
            
            switch cameraPermission.permissionStatus {
            case .authorized:
                // Permission already granted, show camera
                showingCamera = true
                
            case .notDetermined:
                // Request permission for the first time
                let granted = await cameraPermission.requestPermission()
                if granted {
                    showingCamera = true
                } else {
                    showingPermissionDeniedAlert = true
                }
                
            case .denied, .restricted:
                // Permission denied or restricted, show alert
                showingPermissionDeniedAlert = true
                
            @unknown default:
                showingPermissionDeniedAlert = true
            }
        }
    }
    
    private func handleCapturedImage(_ image: UIImage) {
        selectedImage = Image(uiImage: image)
        
        Task {
            viewModel.isProcessing = true
            
            do {
                guard let cgImage = image.cgImage else {
                    throw ReceiptScanError.invalidImage
                }
                
                let productSuggestions = purchaseViewModel.productSuggestions
                let service = ReceiptRecognitionService(modelContext: modelContext)
                
                let extractedItems = try await service.extractPurchases(
                    from: cgImage,
                    existingProductSuggestions: productSuggestions
                )
                
                if let firstItem = extractedItems.first {
                    viewModel.shopName = firstItem.shopName ?? "Unbekannt"
                    viewModel.receiptDate = firstItem.date ?? Date()
                }
                
                viewModel.detectedItems = extractedItems
            } catch {
                viewModel.errorMessage = "Fehler beim Verarbeiten: \(error.localizedDescription)"
            }
            
            viewModel.isProcessing = false
        }
    }
    #endif
    
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
            #if os(iOS)
            iosFormContent
            #else
            macosFormContent
            #endif
        }
    }
    
    // MARK: - iOS Content
    
    #if os(iOS)
    private var iosFormContent: some View {
        Form {
            Section("Produktinformation") {
                TextField("Produktname", text: $editedItem.productName)
                    .textFieldStyle(.plain)
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
                
                HStack {
                    Text("Einheit")
                    Spacer()
                    TextField("Einheit", text: $editedItem.unit)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 100)
                }
                
                HStack {
                    Text("Gesamtpreis")
                    Spacer()
                    TextField("Preis", value: $editedItem.totalPrice, format: .currency(code: "EUR"))
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 120)
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
                .buttonStyle(.borderedProminent)
            }
        }
    }
    #endif
    
    // MARK: - macOS Content
    
    #if os(macOS)
    private var macosFormContent: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Artikel bearbeiten")
                    .font(.headline)
                Spacer()
            }
            .padding()
            .background(Color(nsColor: .controlBackgroundColor))
            
            Divider()
            
            // Form Content
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Product Information
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Produktinformation")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Produktname")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            TextField("Produktname eingeben", text: $editedItem.productName)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                    
                    Divider()
                    
                    // Quantity & Price
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Menge & Preis")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                        
                        HStack(spacing: 16) {
                            // Quantity
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Menge")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                TextField("Menge", value: $editedItem.quantity, format: .number)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 100)
                            }
                            
                            // Unit
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Einheit")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                TextField("z.B. kg, l, Stk", text: $editedItem.unit)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 100)
                            }
                            
                            Spacer()
                        }
                        
                        // Total Price
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Gesamtpreis")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            TextField("Preis", value: $editedItem.totalPrice, format: .currency(code: "EUR"))
                                .textFieldStyle(.roundedBorder)
                                .frame(width: 150)
                        }
                    }
                    
                    Divider()
                    
                    // Calculated Price
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Berechnung")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                        
                        HStack {
                            Text("Preis pro Einheit:")
                                .font(.body)
                            Spacer()
                            Text(editedItem.pricePerUnit, format: .currency(code: "EUR"))
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundStyle(.blue)
                        }
                        .padding(12)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    }
                }
                .padding(20)
            }
            .frame(minWidth: 400, minHeight: 300)
            
            Divider()
            
            // Action Buttons
            HStack {
                Spacer()
                
                Button("Abbrechen") {
                    dismiss()
                }
                .keyboardShortcut(.cancelAction)
                
                Button("Speichern") {
                    onSave(editedItem)
                    dismiss()
                }
                .keyboardShortcut(.defaultAction)
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(Color(nsColor: .controlBackgroundColor))
        }
    }
    #endif
}

// MARK: - Image Picker (UIKit Wrapper)

#if os(iOS)
/// UIImagePickerController wrapper configured for highest quality image capture
/// - Uses rear camera for better resolution
/// - Captures at full resolution without compression (.current preset)
/// - No editing to preserve original image quality
struct ImagePicker: UIViewControllerRepresentable {
    enum SourceType {
        case camera
        case photoLibrary
        
        var uiKitType: UIImagePickerController.SourceType {
            switch self {
            case .camera: return .camera
            case .photoLibrary: return .photoLibrary
            }
        }
    }
    
    let sourceType: SourceType
    let onImagePicked: (UIImage) -> Void
    @Environment(\.dismiss) private var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType.uiKitType
        picker.delegate = context.coordinator
        
        // Configure for highest quality capture
        if sourceType.uiKitType == .camera {
            picker.cameraCaptureMode = .photo
            picker.cameraDevice = .rear // Use rear camera for better quality
            
            // Set highest quality - this affects the compression and resolution
            picker.imageExportPreset = .current  // Use original quality without compression

            // Allow editing to ensure proper framing if needed
            picker.allowsEditing = false // Keep original full resolution
        }
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.onImagePicked(image)
            }
            parent.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}
#endif

// MARK: - Preview

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Product.self, Purchase.self, configurations: config)
    let context = ModelContext(container)
    let productViewModel = ProductViewModel(modelContext: context)
    let purchaseViewModel = PurchaseViewModel(modelContext: context, productViewModel: productViewModel)
    
    return NavigationStack {
        ReceiptScanView(purchaseViewModel: purchaseViewModel)
            .modelContainer(container)
    }
}
