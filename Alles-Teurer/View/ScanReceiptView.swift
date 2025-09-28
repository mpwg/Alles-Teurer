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
    
    // MARK: - Helper Methods
    
    private func createListItems(from viewModel: ScanReceiptViewModel) -> [ListItem] {
        return viewModel.extractedRechnungszeilen.map { rechnungszeile in
            ListItem(
                rechnungszeile: rechnungszeile,
                isHighestPrice: false, // Not needed for scan view
                isLowestPrice: false,  // Not needed for scan view
                isSelected: viewModel.isSelected(rechnungszeile)
            )
        }
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
            VStack(spacing: 0) {
                // Scrollable content area
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
                                    
                                    RechnungsZeilenListView(
                                        individualItems: createListItems(from: viewModel),
                                        onItemToggleSelection: { rechnungszeile in
                                            viewModel.toggleSelection(for: rechnungszeile)
                                        },
                                        onItemEdit: { rechnungszeile in
                                            selectedItemForEditing = rechnungszeile
                                        }
                                    )
                                }
                                .padding(12)
                                .background(Color(.systemGray6))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20) // Add padding at bottom of scroll content
                }
                
                // Fixed import button at bottom
                if !viewModel.extractedRechnungszeilen.isEmpty {
                    VStack(spacing: 0) {
                        Divider()
                        
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
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        .background(Color(.systemBackground))
                    }
                }
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
