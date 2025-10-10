//
//  SettingsView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI
import SwiftData
import CloudKit

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Environment(FamilySharingSettings.self) private var familySharingSettings
    @Query private var products: [Product]
    @Query private var purchases: [Purchase]
    
    @State private var showingDeleteAllConfirmation = false
    @State private var showingFamilySharingAlert = false
    @State private var pendingFamilySharingValue = false
    @State private var cloudKitAvailable = false
    
    var body: some View {
        NavigationStack {
            settingsContent
        }
        #if os(macOS)
        .frame(minWidth: 500, minHeight: 600)
        #endif
    }
    
    private var settingsContent: some View {
        Form {
            Section {
                #if os(macOS)
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Familien-Synchronisation")
                                .font(.headline)
                            Text("Daten mit der Familie über iCloud teilen")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Toggle("Familien-Synchronisation", isOn: Binding(
                            get: { familySharingSettings.isFamilySharingEnabled },
                            set: { newValue in
                                if newValue && !cloudKitAvailable {
                                    showingFamilySharingAlert = true
                                } else {
                                    pendingFamilySharingValue = newValue
                                    showingFamilySharingAlert = true
                                }
                            }
                        ))
                        .labelsHidden()
                        .disabled(!cloudKitAvailable && !familySharingSettings.isFamilySharingEnabled)
                    }
                }
                .padding(.vertical, 8)
                #else
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Familien-Synchronisation")
                        Text("Daten mit der Familie über iCloud teilen")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Toggle("", isOn: Binding(
                        get: { familySharingSettings.isFamilySharingEnabled },
                        set: { newValue in
                            if newValue && !cloudKitAvailable {
                                // Show alert if CloudKit is not available
                                showingFamilySharingAlert = true
                            } else {
                                pendingFamilySharingValue = newValue
                                showingFamilySharingAlert = true
                            }
                        }
                    ))
                    .disabled(!cloudKitAvailable && !familySharingSettings.isFamilySharingEnabled)
                }
                #endif
            } header: {
                Text("Synchronisation")
            } footer: {
                if cloudKitAvailable {
                    Text("Wenn aktiviert, werden Ihre Einkaufsdaten über iCloud mit Familienmitgliedern geteilt. Stellen Sie sicher, dass alle Familienmitglieder bei iCloud angemeldet sind.")
                } else {
                    Text("iCloud ist nicht verfügbar. Melden Sie sich bei iCloud an, um Daten mit der Familie zu teilen.")
                }
            }
            
            Section {
                #if os(macOS)
                VStack(alignment: .leading, spacing: 8) {
                    Button("Alle Daten löschen", role: .destructive) {
                        showingDeleteAllConfirmation = true
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                .padding(.vertical, 8)
                #else
                Button("Alle Daten löschen", role: .destructive) {
                    showingDeleteAllConfirmation = true
                }
                #endif
            } header: {
                Text("Datenmanagement")
            } footer: {
                Text("Diese Aktion löscht alle Produkte und Einkäufe unwiderruflich.")
            }
            
            Section {
                #if os(macOS)
                VStack(spacing: 12) {
                    HStack {
                        Text("Produkte")
                            .font(.headline)
                        Spacer()
                        Text("\(products.count)")
                            .foregroundColor(.secondary)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        Text("Einkäufe")
                            .font(.headline)
                        Spacer()
                        Text("\(purchases.count)")
                            .foregroundColor(.secondary)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        Text("Build-Typ")
                            .font(.headline)
                        Spacer()
                        Text(familySharingSettings.buildTypeDescription)
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(NSColor.controlBackgroundColor))
                            .cornerRadius(6)
                    }
                }
                .padding(.vertical, 8)
                #else
                HStack {
                    Text("Produkte")
                    Spacer()
                    Text("\(products.count)")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Einkäufe")
                    Spacer()
                    Text("\(purchases.count)")
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text("Build-Typ")
                    Spacer()
                    Text(familySharingSettings.buildTypeDescription)
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
                #endif
            } header: {
                Text("Statistiken")
            } footer: {
                Text("Debug- und Release-Builds verwenden separate Datenbanken, um Entwicklungsdaten von Produktionsdaten zu trennen.")
            }
        }
        #if os(macOS)
        .formStyle(.grouped)
        .scrollContentBackground(.hidden)
        .background(Color(NSColor.windowBackgroundColor))
        #endif
        .navigationTitle("Einstellungen")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.large)
        #endif
        .toolbar {
            #if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Fertig") {
                    dismiss()
                }
            }
            #else
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                        .font(.title2)
                }
                .buttonStyle(.plain)
                .help("Schließen")
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button("Fertig") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .keyboardShortcut(.return, modifiers: .command)
            }
            #endif
        }
        .alert("Alle Daten löschen?", isPresented: $showingDeleteAllConfirmation) {
            Button("Abbrechen", role: .cancel) { }
            Button("Alle löschen", role: .destructive) {
                deleteAllData()
            }
        } message: {
            Text("Diese Aktion löscht alle \(products.count) Produkte und \(purchases.count) Einkäufe unwiderruflich. Diese Aktion kann nicht rückgängig gemacht werden.")
        }
        .alert("Familien-Synchronisation", isPresented: $showingFamilySharingAlert) {
            if cloudKitAvailable {
                Button("Abbrechen", role: .cancel) { }
                Button(pendingFamilySharingValue ? "Aktivieren" : "Deaktivieren") {
                    familySharingSettings.isFamilySharingEnabled = pendingFamilySharingValue
                    if pendingFamilySharingValue {
                        // Show restart hint
                    }
                }
            } else {
                Button("OK", role: .cancel) { }
            }
        } message: {
            if cloudKitAvailable {
                if pendingFamilySharingValue {
                    Text("Die Familien-Synchronisation wird aktiviert. Ihre Daten werden über iCloud mit Familienmitgliedern geteilt. Die App muss neu gestartet werden, damit die Änderung wirksam wird.")
                } else {
                    Text("Die Familien-Synchronisation wird deaktiviert. Ihre Daten werden nur noch lokal gespeichert. Die App muss neu gestartet werden, damit die Änderung wirksam wird.")
                }
            } else {
                Text("iCloud ist nicht verfügbar. Bitte melden Sie sich in den Systemeinstellungen bei iCloud an und versuchen Sie es erneut.")
            }
        }
        .task {
            // Check CloudKit availability when view appears
            cloudKitAvailable = await familySharingSettings.checkCloudKitAvailability()
        }
    }
    
    private func deleteAllData() {
        withAnimation {
            // Delete all products (this will also delete all purchases due to cascade delete rule)
            for product in products {
                modelContext.delete(product)
            }
            
            // Delete any orphaned purchases (just to be safe)
            for purchase in purchases {
                modelContext.delete(purchase)
            }
            
            // Save the context
            do {
                try modelContext.save()
            } catch {
                print("Error deleting all data: \(error)")
            }
        }
        
        dismiss()
    }
}

#Preview {
    SettingsView()
        .modelContainer(for: [Product.self, Purchase.self], inMemory: true)
}