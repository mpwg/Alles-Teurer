//
//  SettingsView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 10.10.25.
//

import SwiftUI
import SwiftData
import CloudKit
import UniformTypeIdentifiers

// MARK: - Backup Document

struct BackupDocument: FileDocument {
    static var readableContentTypes: [UTType] { [.allesTeurerBackup] }
    static var writableContentTypes: [UTType] { [.allesTeurerBackup] }
    
    let fileURL: URL
    
    init(fileURL: URL) {
        self.fileURL = fileURL
    }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents else {
            throw CocoaError(.fileReadCorruptFile)
        }
        // For reading, we'd need to save to a temporary location
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("temp_backup.AllesTeurerBackup")
        try data.write(to: tempURL)
        self.fileURL = tempURL
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try Data(contentsOf: fileURL)
        return FileWrapper(regularFileWithContents: data)
    }
}

// MARK: - Settings View

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(FamilySharingSettings.self) private var familySharingSettings
    @Query private var products: [Product]
    @Query private var purchases: [Purchase]
    
    #if os(iOS)
    @Environment(\.dismiss) private var dismiss
    #endif
    
    @State private var showingDeleteAllConfirmation = false
    @State private var showingFamilySharingAlert = false
    @State private var pendingFamilySharingValue = false
    @State private var cloudKitAvailable = false
    
    // Backup/Restore states
    @State private var showingExportPicker = false
    @State private var showingImportPicker = false
    @State private var showingRestoreConfirmation = false
    @State private var showingBackupSuccess = false
    @State private var showingRestoreSuccess = false
    @State private var showingError = false
    @State private var errorMessage = ""
    @State private var selectedBackupURL: URL?
    @State private var exportedBackupURL: URL?
    
    var body: some View {
        #if os(macOS)
        settingsContent
            .frame(minWidth: 500, minHeight: 600)
        #else
        NavigationStack {
            settingsContent
        }
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
                    Button("Backup erstellen") {
                        exportBackup()
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .disabled(products.isEmpty && purchases.isEmpty)
                    
                    Button("Backup wiederherstellen") {
                        showingImportPicker = true
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                }
                .padding(.vertical, 8)
                #else
                Button("Backup erstellen") {
                    exportBackup()
                }
                .disabled(products.isEmpty && purchases.isEmpty)
                
                Button("Backup wiederherstellen") {
                    showingImportPicker = true
                }
                #endif
            } header: {
                Text("Backup & Wiederherstellung")
            } footer: {
                Text("Exportieren Sie Ihre Daten als JSON-Datei zum Sichern oder Übertragen. Die Wiederherstellung ersetzt alle vorhandenen Daten.")
            }
            
            Section {
                #if os(macOS)
                VStack(alignment: .leading, spacing: 8) {
                    #if DEBUG

                    if products.isEmpty {
                        Button("Beispieldaten hinzufügen") {
                            addSampleData()
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                    }
                    #endif
                    Button("Alle Daten löschen", role: .destructive) {
                        showingDeleteAllConfirmation = true
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(products.isEmpty && purchases.isEmpty)
                }
                .padding(.vertical, 8)
                #else
                #if DEBUG
                if products.isEmpty {
                    Button("Beispieldaten hinzufügen") {
                        addSampleData()
                    }
                }
                #endif

                Button("Alle Daten löschen", role: .destructive) {
                    showingDeleteAllConfirmation = true
                }
                .disabled(products.isEmpty && purchases.isEmpty)
                #endif
            } header: {
                Text("Datenmanagement")
            } footer: {
                if products.isEmpty {
                    Text("Fügen Sie Beispieldaten hinzu, um die App auszuprobieren, oder löschen Sie alle vorhandenen Daten.")
                } else {
                    Text("Diese Aktion löscht alle Produkte und Einkäufe unwiderruflich.")
                }
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
        #if os(iOS)
        .navigationTitle("Einstellungen")
        .navigationBarTitleDisplayMode(.large)
        #endif
        .toolbar {
            #if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Fertig") {
                    dismiss()
                }
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
        .fileExporter(
            isPresented: $showingExportPicker,
            document: exportedBackupURL.map { BackupDocument(fileURL: $0) },
            contentType: .allesTeurerBackup,
            defaultFilename: "AllesTeurer_Backup_\(Date().formatted(date: .numeric, time: .omitted).replacingOccurrences(of: "/", with: "-"))"
        ) { result in
            switch result {
            case .success:
                showingBackupSuccess = true
            case .failure(let error):
                errorMessage = error.localizedDescription
                showingError = true
            }
            exportedBackupURL = nil
        }
        .fileImporter(
            isPresented: $showingImportPicker,
            allowedContentTypes: [.allesTeurerBackup],
            allowsMultipleSelection: false
        ) { result in
            switch result {
            case .success(let urls):
                if let url = urls.first {
                    selectedBackupURL = url
                    showingRestoreConfirmation = true
                }
            case .failure(let error):
                errorMessage = error.localizedDescription
                showingError = true
            }
        }
        .alert("Backup erfolgreich", isPresented: $showingBackupSuccess) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Ihre Daten wurden erfolgreich gesichert.")
        }
        .alert("Wiederherstellung erfolgreich", isPresented: $showingRestoreSuccess) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Ihre Daten wurden erfolgreich wiederhergestellt.")
        }
        .alert("Fehler", isPresented: $showingError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
        .alert("Backup wiederherstellen?", isPresented: $showingRestoreConfirmation) {
            Button("Abbrechen", role: .cancel) {
                selectedBackupURL = nil
            }
            Button("Wiederherstellen", role: .destructive) {
                restoreBackup()
            }
        } message: {
            Text("Alle vorhandenen Daten (\(products.count) Produkte und \(purchases.count) Einkäufe) werden durch die Backup-Daten ersetzt. Diese Aktion kann nicht rückgängig gemacht werden.")
        }
    }
    
    // MARK: - Backup/Restore Methods
    
    private func exportBackup() {
        do {
            let backupURL = try BackupRestoreService.exportBackup(products: products, purchases: purchases)
            exportedBackupURL = backupURL
            showingExportPicker = true
        } catch {
            errorMessage = error.localizedDescription
            showingError = true
        }
    }
    
    private func restoreBackup() {
        guard let url = selectedBackupURL else { return }
        
        // Ensure we have access to the security-scoped resource
        guard url.startAccessingSecurityScopedResource() else {
            errorMessage = "Zugriff auf die Datei wurde verweigert."
            showingError = true
            return
        }
        
        defer {
            url.stopAccessingSecurityScopedResource()
        }
        
        do {
            try BackupRestoreService.restoreBackup(from: url, modelContext: modelContext, replaceExisting: true)
            selectedBackupURL = nil
            showingRestoreSuccess = true
        } catch {
            errorMessage = error.localizedDescription
            showingError = true
        }
    }
    
    // MARK: - Data Management Methods
    
    #if DEBUG
    private func addSampleData() {
        withAnimation {
            TestData.createSampleData(in: modelContext)
            do {
                try modelContext.save()
            } catch {
                print("Error saving sample data: \(error)")
            }
        }
    }
    #endif

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
        
        #if os(iOS)
        dismiss()
        #endif
    }
}

#Preview {
    SettingsView()
        .modelContainer(for: [Product.self, Purchase.self], inMemory: true)
        .environment(FamilySharingSettings.shared)
}
