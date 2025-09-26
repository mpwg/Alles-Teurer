import SwiftData
import SwiftUI

struct AddItemView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var priceText = ""
    @State private var category = ""
    @State private var shop = ""
    @State private var datum = Date()

    @State private var showingAlert = false
    @State private var alertMessage = ""

    private var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !priceText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !shop.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && Decimal(string: priceText.replacingOccurrences(of: ",", with: ".")) != nil
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Produktinformationen") {
                    TextField("Produktname", text: $name)
                        .accessibilityLabel("Produktname eingeben")

                    TextField("Kategorie (optional)", text: $category)
                        .accessibilityLabel("Kategorie eingeben, optional")
                }

                Section("Einkaufsinformationen") {
                    TextField("Geschäft", text: $shop)
                        .accessibilityLabel("Geschäftsname eingeben")

                    HStack {
                        TextField("Preis", text: $priceText)
                            .keyboardType(.decimalPad)
                            .accessibilityLabel("Preis eingeben")

                        Text("€")
                            .foregroundStyle(.secondary)
                            .accessibilityHidden(true)
                    }

                    DatePicker("Datum", selection: $datum, displayedComponents: .date)
                        .accessibilityLabel("Einkaufsdatum auswählen")
                }

                Section {
                    Button("Speichern") {
                        saveItem()
                    }
                    .disabled(!isFormValid)
                    .accessibilityLabel("Eintrag speichern")
                    .accessibilityHint(
                        isFormValid
                            ? "Eintrag wird gespeichert" : "Bitte alle Pflichtfelder ausfüllen")
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
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Speichern") {
                        saveItem()
                    }
                    .disabled(!isFormValid)
                    .fontWeight(.semibold)
                    .accessibilityLabel("Eintrag speichern")
                }
            }
            .alert("Fehler", isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }

    private func saveItem() {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedShop = shop.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedCategory = category.trimmingCharacters(in: .whitespacesAndNewlines)

        // Preis parsen (Komma durch Punkt ersetzen für Decimal)
        let normalizedPriceText = priceText.replacingOccurrences(of: ",", with: ".")
        guard let price = Decimal(string: normalizedPriceText) else {
            alertMessage = "Bitte geben Sie einen gültigen Preis ein."
            showingAlert = true
            return
        }

        guard price > 0 else {
            alertMessage = "Der Preis muss größer als 0 sein."
            showingAlert = true
            return
        }

        let newItem = Rechnungszeile(
            Name: trimmedName,
            Price: price,
            Category: trimmedCategory,
            Shop: trimmedShop,
            Datum: datum
        )

        withAnimation {
            modelContext.insert(newItem)
        }

        dismiss()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Rechnungszeile.self, configurations: config)

    return AddItemView()
        .modelContainer(container)
}
