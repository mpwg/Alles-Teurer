import SwiftData
import SwiftUI

struct AddItemView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel: AddItemViewModel?
    
    // Computed properties for bindings to simplify expressions
    private var nameBinding: Binding<String> {
        Binding(
            get: { viewModel?.name ?? "" },
            set: { viewModel?.name = $0 }
        )
    }
    
    private var categoryBinding: Binding<String> {
        Binding(
            get: { viewModel?.category ?? "" },
            set: { viewModel?.category = $0 }
        )
    }
    
    private var shopBinding: Binding<String> {
        Binding(
            get: { viewModel?.shop ?? "" },
            set: { viewModel?.shop = $0 }
        )
    }
    
    private var priceBinding: Binding<String> {
        Binding(
            get: { viewModel?.priceText ?? "" },
            set: { viewModel?.priceText = $0 }
        )
    }
    
    private var dateBinding: Binding<Date> {
        Binding(
            get: { viewModel?.datum ?? Date() },
            set: { viewModel?.datum = $0 }
        )
    }
    
    private var showingAlertBinding: Binding<Bool> {
        Binding(
            get: { viewModel?.showingAlert ?? false },
            set: { _ in viewModel?.dismissAlert() }
        )
    }

    var body: some View {
        NavigationStack {
            Group {
                if let viewModel = viewModel {
                    Form {
                        Section("Produktinformationen") {
                            TextField("Produktname", text: nameBinding)
                                .accessibilityLabel("Produktname eingeben")

                            TextField("Kategorie (optional)", text: categoryBinding)
                                .accessibilityLabel("Kategorie eingeben, optional")
                        }

                        Section("Einkaufsinformationen") {
                            TextField("Geschäft", text: shopBinding)
                                .accessibilityLabel("Geschäftsname eingeben")

                            HStack {
                                TextField("Preis", text: priceBinding)
                                    .accessibilityLabel("Preis eingeben")

                                Text("€")
                                    .foregroundStyle(.secondary)
                                    .accessibilityHidden(true)
                            }

                            DatePicker("Datum", selection: dateBinding, displayedComponents: .date)
                                .accessibilityLabel("Einkaufsdatum auswählen")
                        }

                        Section {
                            Button("Speichern") {
                                saveItem()
                            }
                            .disabled(!viewModel.isFormValid || viewModel.isLoading)
                            .accessibilityLabel("Eintrag speichern")
                            .accessibilityHint(
                                viewModel.isFormValid
                                    ? "Eintrag wird gespeichert"
                                    : "Bitte alle Pflichtfelder ausfüllen")
                        }
                    }
                    .disabled(viewModel.isLoading)
                } else {
                    ProgressView("Initialisierung...")
                }
            }
            .navigationTitle("Neuer Eintrag")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Abbrechen") {
                        dismiss()
                    }
                    .accessibilityLabel("Eingabe abbrechen")
                    .disabled(viewModel?.isLoading ?? true)
                }

                ToolbarItem(placement: .primaryAction) {
                    Button("Speichern") {
                        saveItem()
                    }
                    .disabled(!(viewModel?.isFormValid ?? false) || (viewModel?.isLoading ?? true))
                    .fontWeight(.semibold)
                    .accessibilityLabel("Eintrag speichern")
                }
            }
            .task {
                if viewModel == nil {
                    viewModel = AddItemViewModel(modelContext: modelContext)
                }
            }
            .alert("Fehler", isPresented: showingAlertBinding) {
                Button("OK") {
                    viewModel?.dismissAlert()
                }
            } message: {
                Text(viewModel?.alertMessage ?? "Unbekannter Fehler")
            }
        }
    }

    private func saveItem() {
        Task {
            if let viewModel = viewModel, await viewModel.saveItem() {
                dismiss()
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Rechnungszeile.self, configurations: config)

    return AddItemView()
        .modelContainer(container)
}
