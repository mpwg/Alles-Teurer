import SwiftUI
import SwiftData

struct EditRechnungszeileView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String
    @State private var priceText: String
    @State private var category: String
    @State private var shop: String
    @State private var datum: Date
    @State private var normalizedName: String
    @State private var pricePerUnit: Decimal
    @State private var currency: String
    
    let originalItem: Rechnungszeile
    let onSave: (Rechnungszeile) -> Void
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    init(item: Rechnungszeile, onSave: @escaping (Rechnungszeile) -> Void) {
        self.originalItem = item
        self.onSave = onSave
        
        // Initialize state with current values
        _name = State(initialValue: item.Name)
        _priceText = State(initialValue: CurrencyFormatter.decimalToString(item.Price))
        _category = State(initialValue: item.Category)
        _shop = State(initialValue: item.Shop)
        _datum = State(initialValue: item.Datum)
        _normalizedName = State(initialValue: item.NormalizedName)
        _pricePerUnit = State(initialValue: item.PricePerUnit)
        _currency = State(initialValue: item.Currency)
    }
    
    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !priceText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        CurrencyFormatter.stringToDecimal(priceText) != nil
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
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Abbrechen") {
                        dismiss()
                    }
                    .accessibilityLabel("Bearbeitung abbrechen")
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Speichern") {
                        saveChanges()
                    }
                    .disabled(!isFormValid)
                    .fontWeight(.semibold)
                    .accessibilityLabel("Änderungen speichern")
                }
            }
            .alert("Fehler", isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private var productInfoSection: some View {
        Section("Produktinformationen") {
            HStack {
                Text("Name")
                Spacer()
                TextField("Produktname", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Produktname")
            .accessibilityValue(name.isEmpty ? "Nicht angegeben" : name)
            
            HStack {
                Text("Normalisierter Name")
                Spacer()
                TextField("Normalisierter Name", text: $normalizedName)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Normalisierter Produktname")
            .accessibilityValue(normalizedName.isEmpty ? "Nicht angegeben" : normalizedName)
            
            HStack {
                Text("Kategorie")
                Spacer()
                TextField("Kategorie", text: $category)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Kategorie")
            .accessibilityValue(category.isEmpty ? "Nicht angegeben" : category)
        }
    }
    
    private var priceSection: some View {
        Section("Preisangaben") {
            HStack {
                Text("Preis")
                Spacer()
                TextField(CurrencyFormatter.format(Decimal(0), currency: currency), text: $priceText)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Preis")
            .accessibilityValue(priceText.isEmpty ? "Nicht angegeben" : priceText + " \(currency)")
            
            HStack {
                Text("Währung")
                Spacer()
                Picker("Währung", selection: $currency) {
                    ForEach(CurrencyFormatter.commonCurrencies, id: \.self) { currencyCode in
                        Text("\(currencyCode) (\(CurrencyFormatter.currencySymbol(for: currencyCode)))")
                            .tag(currencyCode)
                    }
                }
                .pickerStyle(.menu)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Währung")
            .accessibilityValue(currency)
            
            HStack {
                Text("Preis pro Einheit")
                Spacer()
                TextField(CurrencyFormatter.format(Decimal(0), currency: currency), value: $pricePerUnit, format: .currency(code: currency))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Preis pro Einheit")
            .accessibilityValue("\(pricePerUnit.description) \(currency) pro Einheit")
        }
    }
    
    private var purchaseInfoSection: some View {
        Section("Kaufinformationen") {
            HStack {
                Text("Geschäft")
                Spacer()
                TextField("Geschäft", text: $shop)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Geschäft")
            .accessibilityValue(shop.isEmpty ? "Nicht angegeben" : shop)
            
            DatePicker("Datum", selection: $datum, displayedComponents: .date)
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
    
    private func saveChanges() {
        guard let price = CurrencyFormatter.stringToDecimal(priceText) else {
            alertMessage = "Ungültiger Preis"
            showingAlert = true
            return
        }
        
        // Create updated item with preserved ID
        let updatedItem = Rechnungszeile(
            Name: name.trimmingCharacters(in: .whitespacesAndNewlines),
            Price: price,
            Category: category.trimmingCharacters(in: .whitespacesAndNewlines),
            Shop: shop.trimmingCharacters(in: .whitespacesAndNewlines),
            Datum: datum,
            NormalizedName: normalizedName.trimmingCharacters(in: .whitespacesAndNewlines),
            PricePerUnit: pricePerUnit,
            Currency: currency
        )
        
        // Preserve the original ID for proper tracking
        updatedItem.id = originalItem.id
        
        onSave(updatedItem)
        dismiss()
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
    
    return EditRechnungszeileView(item: sampleItem) { _ in
        print("Saved")
    }
}