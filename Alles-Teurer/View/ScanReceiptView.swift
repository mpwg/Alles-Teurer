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
                VStack(spacing: 12) {
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
                        
                        Button("Alle Speichern") {
                            saveReceiptItems()
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.regular)
                    }
                    
                    // Show preview of extracted items
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Erkannte Artikel:")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        ForEach(viewModel.extractedRechnungszeilen.prefix(3), id: \.id) { item in
                            HStack {
                                Text(item.Name)
                                    .font(.caption)
                                    .lineLimit(1)
                                Spacer()
                                Text("\(item.Price.formatted(.currency(code: "EUR")))")
                                    .font(.caption)
                                    .fontWeight(.medium)
                            }
                        }
                        
                        if viewModel.extractedRechnungszeilen.count > 3 {
                            Text("... und \(viewModel.extractedRechnungszeilen.count - 3) weitere")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.top, 8)
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
                VStack(spacing: 16) {
                    // Image section with larger display
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Ausgewähltes Bild")
                                .font(.headline)
                                .accessibilityAddTraits(.isHeader)
                            Spacer()
                        }
                        
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 300)
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .accessibilityLabel("Ausgewähltes Rechnungsbild")
                    }
                    
                    // Text section with better formatting
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
                            Text(viewModel.extractedText.isEmpty ? "Kein Text erkannt" : viewModel.extractedText)
                                .font(.system(.body, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(12)
                                .background(Color(.systemGray6))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .accessibilityLabel(
                                    viewModel.extractedText.isEmpty 
                                    ? "Kein Text erkannt" 
                                    : "Erkannter Text: \(viewModel.extractedText)"
                                )
                        }
                        .frame(minHeight: 150)
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
                    
                    Text("Die erkannten Daten werden automatisch als Rechnungszeile gespeichert")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    // MARK: - Actions
    
    private func saveReceiptItems() {
        guard !viewModel.extractedRechnungszeilen.isEmpty else {
            viewModel.errorMessage = "Keine Rechnungszeilen zum Speichern gefunden"
            viewModel.scanState = .error
            return
        }
        
        withAnimation {
            // Save all extracted line items
            for rechnungszeile in viewModel.extractedRechnungszeilen {
                modelContext.insert(rechnungszeile)
            }
            
            do {
                try modelContext.save()
                
                // Show success feedback
                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                impactFeedback.impactOccurred()
                
                // Reset for next scan
                viewModel.reset()
                
            } catch {
                viewModel.errorMessage = "Fehler beim Speichern: \(error.localizedDescription)"
                viewModel.scanState = .error
            }
        }
    }
}

#Preview {
    ScanReceiptView()
        .modelContainer(for: Rechnungszeile.self, inMemory: true)
}
