import SwiftData
import SwiftUI

struct AddItemView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel: AddItemViewModel?

    var body: some View {
        NavigationStack {
            Group {
                if let viewModel = viewModel {
                    Form {
                        Section("Produktinformationen") {
                            TextField(
                                "Produktname",
                                text: Binding(
                                    get: { viewModel.name },
                                    set: { viewModel.name = $0 }
                                )
                            )
                            .accessibilityLabel("Produktname eingeben")

                            TextField(
                                "Kategorie (optional)",
                                text: Binding(
                                    get: { viewModel.category },
                                    set: { viewModel.category = $0 }
                                )
                            )
                            .accessibilityLabel("Kategorie eingeben, optional")
                        }

                        Section("Einkaufsinformationen") {
                            TextField(
                                "Geschäft",
                                text: Binding(
                                    get: { viewModel.shop },
                                    set: { viewModel.shop = $0 }
                                )
                            )
                            .accessibilityLabel("Geschäftsname eingeben")

                            HStack {
                                TextField(
                                    "Preis",
                                    text: Binding(
                                        get: { viewModel.priceText },
                                        set: { viewModel.priceText = $0 }
                                    )
                                )
                                .keyboardType(.decimalPad)
                                .accessibilityLabel("Preis eingeben")

                                Text("€")
                                    .foregroundStyle(.secondary)
                                    .accessibilityHidden(true)
                            }

                            DatePicker(
                                "Datum",
                                selection: Binding(
                                    get: { viewModel.datum },
                                    set: { viewModel.datum = $0 }
                                ), displayedComponents: .date
                            )
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
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Abbrechen") {
                        dismiss()
                    }
                    .accessibilityLabel("Eingabe abbrechen")
                    .disabled(viewModel?.isLoading ?? true)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
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
            .alert("Fehler", isPresented: .constant(viewModel?.showingAlert ?? false)) {
                Button("OK") {
                    viewModel?.dismissAlert()
                }
            } message: {
                if let viewModel = viewModel {
                    Text(viewModel.alertMessage)
                }
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
