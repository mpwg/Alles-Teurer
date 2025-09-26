//
//  ProductNamesListView.swift
//  Alles-Teurer
//
//  Created by Matthias Wallner-Géhri on 26.09.25.
//


import SwiftData
import SwiftUI

struct ProductNamesListView: View {
    let productNames: [String]
    @Binding var selectedProductName: String?
    let onGenerateTestData: () -> Void

    var body: some View {
        if productNames.isEmpty {
            VStack(spacing: 20) {
                ContentUnavailableView(
                    "Keine Produkte",
                    systemImage: "cart",
                    description: Text("Noch keine Einkäufe erfasst.")
                )

                Button("Test Daten generieren") {
                    onGenerateTestData()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .padding()
        } else {
            List(productNames, id: \.self, selection: $selectedProductName) { productName in
                Text(productName)
                    .accessibilityLabel("Produkt: \(productName)")
            }
            .listStyle(.sidebar)
        }
    }
}