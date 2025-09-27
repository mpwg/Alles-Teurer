//
//  RechnungserkennungDemo.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 27.09.25.
//

import SwiftUI
import Foundation

/// Demonstration of the Foundation Models receipt recognition functionality
struct RechnungserkennungDemo: View {
    @State private var rechnungserkennung = Rechnungserkennung()
    @State private var extractedItems: [Rechnungszeile] = []
    @State private var isProcessing = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Foundation Models Receipt Recognition Demo")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                
                if let errorMessage = errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button("Process Sample Receipt") {
                    Task {
                        await processSampleReceipt()
                    }
                }
                .disabled(isProcessing)
                
                if isProcessing {
                    ProgressView("Processing with Foundation Models...")
                        .padding()
                }
                
                if !extractedItems.isEmpty {
                    List(extractedItems, id: \.id) { item in
                        VStack(alignment: .leading) {
                            Text(item.Name)
                                .font(.headline)
                            HStack {
                                Text("€\(item.Price.formatted())")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                                Spacer()
                                Text(item.Category)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Text("Shop: \(item.Shop)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Receipt Recognition")
        }
    }
    
    private func processSampleReceipt() async {
        isProcessing = true
        errorMessage = nil
        
        do {
            // Create a sample image (in a real implementation, this would come from camera/gallery)
            let sampleImage = createSampleReceiptImage()
            
            // Extract receipt line items using Foundation Models
            let items = try await rechnungserkennung.extractRechnungszeilen(from: sampleImage)
            
            extractedItems = items
        } catch let error as RechnungserkennungError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "Unknown error: \(error.localizedDescription)"
        }
        
        isProcessing = false
    }
    
    private func createSampleReceiptImage() -> UIImage {
        let receiptText = """
        BILLA
        27.09.2025
        
        Ja! Bio Süßkartoffel                7,58
        1.52 kg X 4.99 EUR / kg
        
        Clever Grana Padano                 6,29
        
        Clever Äpfel 2kg                    3,79
        
        DKIH Paprika rot Stk.               1,49
        
        Clever Blättert. div. Sor           0,99
        
        Clever Jogh. 0.1%                   0,49
        
        Summe                              21,46 €
        """
        
        let size = CGSize(width: 400, height: 600)
        let renderer = UIGraphicsImageRenderer(size: size)
        
        return renderer.image { context in
            UIColor.white.setFill()
            context.fill(CGRect(origin: .zero, size: size))
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.monospacedSystemFont(ofSize: 14, weight: .regular),
                .foregroundColor: UIColor.black
            ]
            
            let attributedString = NSAttributedString(string: receiptText, attributes: attributes)
            attributedString.draw(in: CGRect(x: 20, y: 20, width: size.width - 40, height: size.height - 40))
        }
    }
}

#Preview {
    RechnungserkennungDemo()
}