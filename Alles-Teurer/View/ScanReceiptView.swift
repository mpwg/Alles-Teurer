import SwiftUI

struct ScanReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                ContentUnavailableView(
                    "Rechnung scannen",
                    systemImage: "qrcode.viewfinder",
                    description: Text("Diese Funktion wird in einer zukünftigen Version verfügbar sein.")
                )
            }
            .navigationTitle("Rechnung Scannen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Fertig") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ScanReceiptView()
}