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
                        Text("\(viewModel.extractedRechnungszeilen.count) Artikel gefunden")
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
        if let image = viewModel.selectedImage {
            ScrollView {
                VStack(spacing: 20) {
                    // Row 1: Picture (left) and Text (right)
                    HStack(alignment: .top, spacing: 16) {
                        // Left: Picture
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Bild")
                                .font(.headline)
                                .accessibilityAddTraits(.isHeader)
                            
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 200)
                                .frame(maxWidth: .infinity)
                                .background(Color(.systemGray6))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .accessibilityLabel("Ausgewähltes Rechnungsbild")
                        }
                        .frame(maxWidth: .infinity)
                        
                        // Right: Text
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Erkannter Text")
                                    .font(.headline)
                                    .accessibilityAddTraits(.isHeader)
                                
                                Spacer()
                                
                                if !viewModel.extractedText.isEmpty {
                                    Text("\(viewModel.extractedText.count) Zeichen")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            
                            ScrollView {
                                Text(viewModel.extractedText.isEmpty ? "Text wird erkannt..." : viewModel.extractedText)
                                    .font(.system(.caption, design: .monospaced))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(8)
                                    .background(Color(.systemGray6))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .accessibilityLabel(
                                        viewModel.extractedText.isEmpty 
                                        ? "Text wird erkannt" 
                                        : "Erkannter Text: \(viewModel.extractedText)"
                                    )
                            }
                            .frame(height: 200)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
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
                            LazyVStack(spacing: 8) {
                                ForEach(viewModel.extractedRechnungszeilen, id: \.id) { rechnungszeile in
                                    HStack {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(rechnungszeile.Name)
                                                .font(.subheadline)
                                                .fontWeight(.medium)
                                                .lineLimit(2)
                                            
                                            HStack {
                                                Text(rechnungszeile.Category)
                                                    .font(.caption)
                                                    .foregroundStyle(.secondary)
                                                
                                                Text("•")
                                                    .font(.caption)
                                                    .foregroundStyle(.secondary)
                                                
                                                Text(rechnungszeile.Shop)
                                                    .font(.caption)
                                                    .foregroundStyle(.secondary)
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text(rechnungszeile.Price.formatted(.currency(code: "EUR")))
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.primary)
                                    }
                                    .padding(12)
                                    .background(Color(.systemBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color(.systemGray4), lineWidth: 1)
                                    )
                                }
                            }
                            .padding(12)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        
                        // Fertig button to import the Rechnungszeilen
                        if !viewModel.extractedRechnungszeilen.isEmpty {
                            Button {
                                importRechnungszeilen()
                            } label: {
                                HStack {
                                    Image(systemName: "square.and.arrow.down")
                                    Text("Fertig - Alle importieren")
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.large)
                            .accessibilityLabel("Alle \(viewModel.extractedRechnungszeilen.count) Rechnungszeilen importieren")
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
    
    private func importRechnungszeilen() {
        guard !viewModel.extractedRechnungszeilen.isEmpty else {
            viewModel.errorMessage = "Keine Rechnungszeilen zum Importieren gefunden"
            viewModel.scanState = .error
            return
        }
        
        withAnimation {
            // Use ViewModel to import the extracted Rechnungszeilen
            viewModel.importExtractedRechnungszeilen(to: modelContext)
            
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
