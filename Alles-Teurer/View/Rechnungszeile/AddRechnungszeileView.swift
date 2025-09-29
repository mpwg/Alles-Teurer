import SwiftData
import SwiftUI

struct AddRechnungszeileView: View {
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
    
    private var currencyBinding: Binding<String> {
        Binding(
            get: { viewModel?.currency ?? CurrencyFormatter.defaultCurrency },
            set: { viewModel?.currency = $0 }
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

                                Text(CurrencyFormatter.currencySymbol(for: currencyBinding.wrappedValue))
                                    .foregroundStyle(.secondary)
                                    .accessibilityHidden(true)
                            }
                            
                            HStack {
                                Text("Währung")
                                Spacer()
                                Picker("Währung", selection: currencyBinding) {
                                    ForEach(CurrencyFormatter.commonCurrencies, id: \.self) { currencyCode in
                                        Text("\(currencyCode) (\(CurrencyFormatter.currencySymbol(for: currencyCode)))")
                                            .tag(currencyCode)
                                    }
                                }
                                .pickerStyle(.menu)
                            }
                            .accessibilityElement(children: .ignore)
                            .accessibilityLabel("Währung auswählen")
                            .accessibilityValue(currencyBinding.wrappedValue)

                            DatePicker("Datum", selection: dateBinding, displayedComponents: .date)
                                .accessibilityLabel("Einkaufsdatum auswählen")
                        }


                    }
                    .disabled(viewModel.isLoading)
                } else {
                    ProgressView("Initialisierung...")
                }
            }
            .navigationTitle("Neuer Eintrag")
            .standardToolbar(viewModel ?? AddItemViewModel(modelContext: modelContext))
            .task {
                if viewModel == nil {
                    let newViewModel = AddItemViewModel(modelContext: modelContext)
                    newViewModel.onSave = { dismiss() }
                    newViewModel.onCancel = { dismiss() }
                    viewModel = newViewModel
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

    return AddRechnungszeileView()
        .modelContainer(container)
}
