import SwiftUI
import SwiftData

struct EditRechnungszeileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: EditRechnungszeileViewModel
    
    let onSave: (Rechnungszeile) -> Void
    let onDelete: (() -> Void)?
    
    init(item: Rechnungszeile, onSave: @escaping (Rechnungszeile) -> Void, onDelete: (() -> Void)? = nil) {
        let viewModel = EditRechnungszeileViewModel(item: item)
        self._viewModel = State(initialValue: viewModel)
        self.onSave = onSave
        self.onDelete = onDelete
    }
    

    
    var body: some View {
        NavigationStack {
            Form {
                productInfoSection
                priceSection
                purchaseInfoSection
                instructionSection
            }
            .navigationTitle("Eintrag bearbeiten")
            .navigationBarTitleDisplayMode(.inline)
            .standardToolbar(viewModel)
            .task {
                viewModel.onSave = onSave
                viewModel.onCancel = { dismiss() }
                viewModel.onDelete = {
                    onDelete?()
                    dismiss()
                }
            }
            .alert("Fehler", isPresented: Binding(
                get: { viewModel.showingAlert },
                set: { _ in viewModel.showingAlert = false }
            )) {
                Button("OK") { viewModel.showingAlert = false }
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
            .confirmationDialog(
                "Eintrag löschen?",
                isPresented: Binding(
                    get: { viewModel.showingDeleteConfirmation },
                    set: { _ in viewModel.showingDeleteConfirmation = false }
                ),
                titleVisibility: .visible
            ) {
                Button("Löschen", role: .destructive) {
                    viewModel.confirmDelete()
                }
                Button("Abbrechen", role: .cancel) { }
            } message: {
                Text("Dieser Eintrag wird unwiderruflich gelöscht.")
            }
        }
    }
    
    private var productInfoSection: some View {
        Section("Produktinformationen") {
            HStack {
                Text("Name")
                Spacer()
                TextField("Produktname", text: $viewModel.name)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Produktname")
            .accessibilityValue(viewModel.name.isEmpty ? "Nicht angegeben" : viewModel.name)
            
            HStack {
                Text("Normalisierter Name")
                Spacer()
                TextField("Normalisierter Name", text: $viewModel.normalizedName)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Normalisierter Produktname")
            .accessibilityValue(viewModel.normalizedName.isEmpty ? "Nicht angegeben" : viewModel.normalizedName)
            
            HStack {
                Text("Kategorie")
                Spacer()
                TextField("Kategorie", text: $viewModel.category)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Kategorie")
            .accessibilityValue(viewModel.category.isEmpty ? "Nicht angegeben" : viewModel.category)
        }
    }
    
    private var priceSection: some View {
        Section("Preisangaben") {
            HStack {
                Text("Preis")
                Spacer()
                TextField(CurrencyFormatter.format(Decimal(0), currency: viewModel.currency), text: $viewModel.priceText)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Preis")
            .accessibilityValue(viewModel.priceText.isEmpty ? "Nicht angegeben" : viewModel.priceText + " \(viewModel.currency)")
            
            HStack {
                Text("Währung")
                Spacer()
                Picker("Währung", selection: $viewModel.currency) {
                    ForEach(CurrencyFormatter.commonCurrencies, id: \.self) { currencyCode in
                        Text("\(currencyCode) (\(CurrencyFormatter.currencySymbol(for: currencyCode)))")
                            .tag(currencyCode)
                    }
                }
                .pickerStyle(.menu)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Währung")
            .accessibilityValue(viewModel.currency)
            
            HStack {
                Text("Preis pro Einheit")
                Spacer()
                TextField(CurrencyFormatter.format(Decimal(0), currency: viewModel.currency), value: $viewModel.pricePerUnit, format: .currency(code: viewModel.currency))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Preis pro Einheit")
            .accessibilityValue("\(viewModel.pricePerUnit.description) \(viewModel.currency) pro Einheit")
        }
    }
    
    private var purchaseInfoSection: some View {
        Section("Kaufinformationen") {
            HStack {
                Text("Geschäft")
                Spacer()
                TextField("Geschäft", text: $viewModel.shop)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Geschäft")
            .accessibilityValue(viewModel.shop.isEmpty ? "Nicht angegeben" : viewModel.shop)
            
            DatePicker("Datum", selection: $viewModel.datum, displayedComponents: .date)
                .accessibilityLabel("Kaufdatum")
        }
    }
    
    private var instructionSection: some View {
        Section {
            HStack {
                Spacer()
                VStack(spacing: 4) {
                    Text("Gescannter Wert")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Korrigieren Sie bei Bedarf die erkannten Werte")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            .listRowBackground(Color.clear)
        }
    }

}

#Preview {
    let sampleItem = Rechnungszeile(
        Name: "Bananen",
        Price: Decimal(2.49),
        Category: "Obst",
        Shop: "REWE",
        Datum: Date(),
        NormalizedName: "bananen",
        PricePerUnit: Decimal(0.99)
    )
    
    return EditRechnungszeileView(item: sampleItem, onSave: { _ in
        print("Saved")
    }, onDelete: {
        print("Deleted")
    })
}