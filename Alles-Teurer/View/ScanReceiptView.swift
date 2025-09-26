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
            VStack(spacing: 16) {
                // Action buttons
                actionButtons
                
                // Status display
                statusDisplay
                
                // Main content area
                mainContent
                
                Spacer()
            }
            .padding()
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
            }
            .sheet(isPresented: $showingCamera) {
                CameraView(onImageSelected: viewModel.processImage)
            }
        }
    }
    
    // MARK: - View Components
    
    @ViewBuilder
    private var actionButtons: some View {
        HStack(spacing: 16) {
            Button {
                showingCamera = true
            } label: {
                Label("Fotografieren", systemImage: "camera.fill")
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.scanState == .processing)
            .accessibilityLabel("Rechnung mit Kamera fotografieren")
            
            Button {
                showingImagePicker = true
            } label: {
                Label("Foto auswählen", systemImage: "photo.on.rectangle")
            }
            .buttonStyle(.bordered)
            .disabled(viewModel.scanState == .processing)
            .accessibilityLabel("Foto aus Galerie auswählen")
        }
    }
    
    @ViewBuilder
    private var statusDisplay: some View {
        switch viewModel.scanState {
        case .processing:
            VStack(spacing: 8) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                Text("Text wird erkannt...")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
        case .error:
            if let errorMessage = viewModel.errorMessage {
                Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                    .foregroundStyle(.red)
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
        case .success:
            if !viewModel.extractedText.isEmpty {
                HStack {
                    Label("Text erfolgreich erkannt", systemImage: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                    
                    Spacer()
                    
                    Button("Speichern") {
                        saveReceiptItem()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.small)
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
        case .idle:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if let image = viewModel.selectedImage {
            GeometryReader { geometry in
                HStack(spacing: 12) {
                    // Image display
                    VStack(alignment: .leading) {
                        Text("Bild")
                            .font(.headline)
                            .accessibilityAddTraits(.isHeader)
                        
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: geometry.size.height * 0.8)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .accessibilityLabel("Ausgewähltes Rechnungsbild")
                    }
                    .frame(width: geometry.size.width * 0.45)
                    
                    // Text display
                    VStack(alignment: .leading) {
                        Text("Erkannter Text")
                            .font(.headline)
                            .accessibilityAddTraits(.isHeader)
                        
                        ScrollView {
                            Text(viewModel.extractedText.isEmpty ? "Kein Text erkannt" : viewModel.extractedText)
                                .font(.system(.caption, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(8)
                                .background(Color(.systemGray6))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .accessibilityLabel(
                                    viewModel.extractedText.isEmpty 
                                    ? "Kein Text erkannt" 
                                    : "Erkannter Text: \(viewModel.extractedText)"
                                )
                        }
                        .frame(maxHeight: geometry.size.height * 0.8)
                    }
                    .frame(width: geometry.size.width * 0.45)
                }
                .padding(.horizontal)
            }
        } else {
            ContentUnavailableView {
                Label("Bereit zum Scannen", systemImage: "qrcode.viewfinder")
            } description: {
                Text("Fotografieren Sie eine Rechnung oder wählen Sie ein Foto aus der Galerie aus")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    // MARK: - Actions
    
    private func saveReceiptItem() {
        let receiptItem = viewModel.createRechnungszeile(from: viewModel.extractedText)
        
        withAnimation {
            modelContext.insert(receiptItem)
            
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
