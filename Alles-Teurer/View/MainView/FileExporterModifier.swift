//
//  FileExporterModifier.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 29.09.25.
//


import SwiftData
import SwiftUI
import UniformTypeIdentifiers

struct FileExporterModifier: ViewModifier {
    let viewModel: ContentViewModel?
    @Binding var showingExportSheet: Bool
    @Binding var csvData: Data?
    
    func body(content: Content) -> some View {
        content
            .fileExporter(
                isPresented: $showingExportSheet,
                document: CSVDocument(data: csvData ?? Data()),
                contentType: .commaSeparatedText,
                defaultFilename: viewModel?.generateCSVFilename() ?? "export.csv"
            ) { result in
                switch result {
                case .success(let url):
                    print("CSV exported to: \(url)")
                case .failure(let error):
                    print("Export failed: \(error)")
                    viewModel?.errorMessage = "Export fehlgeschlagen: \(error.localizedDescription)"
                }
            }
    }
}