import SwiftUI
import PhotosUI
import Vision
import SwiftData

struct ScanReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = ScanReceiptViewModel()
    @State private var showingImagePicker = false
    @State private var showingCamera = false
    @State private var selectedItemForEditing: Rechnungszeile?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Action buttons with better spacing
                actionButtons
                    .padding(.horizontal)
                
                // Status display
                statusDisplay
                    .padding(.horizontal)
                
                // Main content area with improved layout
                mainContent
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer(minLength: 0)
            }
            .padding(.vertical)
            .navigationTitle("Rechnung Scannen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Fertig") {
                        dismiss()
                    }
                    .accessibilityLabel("Scannen beenden")
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Zurücksetzen") {
                        viewModel.reset()
                    }
                    .disabled(viewModel.scanState == .idle)
                    .accessibilityLabel("Scan zurücksetzen")
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                PhotoPickerView(onImageSelected: viewModel.processImage)
                    .presentationDetents([.large])
            }
            .sheet(isPresented: $showingCamera) {
                CameraView(onImageSelected: viewModel.processImage)
                    .presentationDetents([.large])
            }
            .sheet(item: $selectedItemForEditing) { item in
                EditRechnungszeileView(item: item) { updatedItem in
                    viewModel.updateRechnungszeile(updatedItem)
                }
            }
        }
    }
    
    // MARK: - Computed Properties
    
    private var priceRangeForDetectedItems: (min: Decimal, max: Decimal)? {
        guard !viewModel.extractedRechnungszeilen.isEmpty else { return nil }
        
        let prices = viewModel.extractedRechnungszeilen.map { $0.Price }
        guard let minPrice = prices.min(), let maxPrice = prices.max() else { return nil }
        
        return (min: minPrice, max: maxPrice)
    }
    
    // MARK: - View Components
    
    @ViewBuilder
    private var actionButtons: some View {
        HStack(spacing: 20) {
            Button {
                showingCamera = true
            } label: {
                VStack(spacing: 8) {
                    Image(systemName: "camera.fill")
                        .font(.title2)
                    Text("Fotografieren")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.scanState == .processing)
            .accessibilityLabel("Rechnung mit Kamera fotografieren")
            
            Button {
                showingImagePicker = true
            } label: {
                VStack(spacing: 8) {
                    Image(systemName: "photo.on.rectangle")
                        .font(.title2)
                    Text("Foto auswählen")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            }
            .buttonStyle(.bordered)
            .disabled(viewModel.scanState == .processing)
            .accessibilityLabel("Foto aus Galerie auswählen")
        }
        .controlSize(.large)
    }
    
    @ViewBuilder
    private var statusDisplay: some View {
        switch viewModel.scanState {
        case .processing:
            VStack(spacing: 12) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .controlSize(.large)
                Text("Text wird erkannt...")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
        case .error:
            if let errorMessage = viewModel.errorMessage {
                HStack(spacing: 12) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.title2)
                        .foregroundStyle(.red)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Fehler")
                            .font(.headline)
                            .foregroundStyle(.red)
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(Color.red.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
        case .success:
            if !viewModel.extractedRechnungszeilen.isEmpty {
                HStack(spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.green)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Rechnung erfolgreich erkannt")
                            .font(.headline)
                            .foregroundStyle(.green)
                        Text("\(viewModel.extractedRechnungszeilen.count) Artikel gefunden, \(viewModel.selectedCount) ausgewählt")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
        case .idle:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if let _ = viewModel.selectedImage {
            ScrollView {
                VStack(spacing: 20) {
                   
                    // Row 2: Detected Rechnungszeilen
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Erkannte Rechnungszeilen")
                                .font(.headline)
                                .accessibilityAddTraits(.isHeader)
                            
                            Spacer()
                            
                            if !viewModel.extractedRechnungszeilen.isEmpty {
                                Text("\(viewModel.extractedRechnungszeilen.count) Artikel")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        if viewModel.scanState == .processing {
                            HStack {
                                ProgressView()
                                    .controlSize(.small)
                                Text("Rechnungszeilen werden erkannt...")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        } else if viewModel.extractedRechnungszeilen.isEmpty && viewModel.scanState != .processing {
                            Text("Keine Rechnungszeilen erkannt")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color(.systemGray6))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        } else {
                            VStack(spacing: 12) {
                                // Selection controls
                                HStack {
                                    Button {
                                        viewModel.selectAll()
                                    } label: {
                                        Text("Alle auswählen")
                                            .font(.caption)
                                    }
                                    .buttonStyle(.bordered)
                                    .controlSize(.small)
                                    
                                    Button {
                                        viewModel.deselectAll()
                                    } label: {
                                        Text("Alle abwählen")
                                            .font(.caption)
                                    }
                                    .buttonStyle(.bordered)
                                    .controlSize(.small)
                                    
                                    Spacer()
                                    
                                    Text("\(viewModel.selectedCount) von \(viewModel.extractedRechnungszeilen.count) ausgewählt")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                
                                LazyVStack(spacing: 8) {
                                    ForEach(viewModel.extractedRechnungszeilen, id: \.id) { rechnungszeile in
                                        HStack(spacing: 12) {
                                            Button {
                                                viewModel.toggleSelection(for: rechnungszeile)
                                            } label: {
                                                Image(systemName: viewModel.isSelected(rechnungszeile) ? "checkmark.circle.fill" : "circle")
                                                    .font(.title2)
                                                    .foregroundStyle(viewModel.isSelected(rechnungszeile) ? .blue : .secondary)
                                            }
                                            .accessibilityLabel(viewModel.isSelected(rechnungszeile) ? "Abwählen" : "Auswählen")
                                            
                                            RechnungsZeileView(
                                                item: rechnungszeile,
                                                priceRange: priceRangeForDetectedItems
                                            )
                                            
                                            Button {
                                                selectedItemForEditing = rechnungszeile
                                            } label: {
                                                Image(systemName: "pencil")
                                                    .font(.title2)
                                                    .foregroundStyle(.orange)
                                            }
                                            .accessibilityLabel("Bearbeiten")
                                        }
                                        .padding(12)
                                        .background(Color(.systemBackground))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(viewModel.isSelected(rechnungszeile) ? Color.blue : Color(.systemGray4), lineWidth: viewModel.isSelected(rechnungszeile) ? 2 : 1)
                                        )
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            viewModel.toggleSelection(for: rechnungszeile)
                                        }
                                    }
                                }
                            }
                            .padding(12)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        
                        // Import button for selected items
                        if !viewModel.extractedRechnungszeilen.isEmpty {
                            Button {
                                importSelectedRechnungszeilen()
                            } label: {
                                HStack {
                                    Image(systemName: "square.and.arrow.down")
                                    Text("Ausgewählte importieren (\(viewModel.selectedCount))")
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.large)
                            .disabled(!viewModel.hasSelectedItems)
                            .accessibilityLabel("Ausgewählte \(viewModel.selectedCount) Rechnungszeilen importieren")
                        }
                    }
                }
                .padding(.horizontal)
            }
        } else {
            ContentUnavailableView {
                Label("Bereit zum Scannen", systemImage: "qrcode.viewfinder")
                    .font(.title2)
            } description: {
                VStack(spacing: 8) {
                    Text("Fotografieren Sie eine Rechnung oder wählen Sie ein Foto aus der Galerie aus")
                        .multilineTextAlignment(.center)
                    
                    Text("Die erkannten Rechnungszeilen werden automatisch importiert")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    // MARK: - Actions
    
    private func importSelectedRechnungszeilen() {
        guard viewModel.hasSelectedItems else {
            viewModel.errorMessage = "Keine Rechnungszeilen zum Importieren ausgewählt"
            viewModel.scanState = .error
            return
        }
        
        withAnimation {
            // Use ViewModel to import the selected Rechnungszeilen
            viewModel.importSelectedRechnungszeilen(to: modelContext)
            
            // Show success feedback if import was successful
            if viewModel.scanState != .error {
                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                impactFeedback.impactOccurred()
                
                // Close the scan view after successful import
                dismiss()
            }
        }
    }
}

#Preview {
    ScanReceiptView()
        .modelContainer(for: Rechnungszeile.self, inMemory: true)
}
