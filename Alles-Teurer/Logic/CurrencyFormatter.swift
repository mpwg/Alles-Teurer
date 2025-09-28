//
//  CurrencyFormatter.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 27.09.25.
//

import Foundation

/// Centralized currency formatter for consistent Euro formatting throughout the app
struct CurrencyFormatter {
    /// Shared formatter instance configured for Austrian Euro formatting
    static let shared: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = Locale(identifier: "de_AT")
        return formatter
    }()
    
    /// Formats a Decimal value as a currency string
    /// - Parameter value: The decimal value to format
    /// - Returns: Formatted currency string or fallback string if formatting fails
    static func format(_ value: Decimal) -> String {
        return shared.string(from: value as NSNumber) ?? "€?,??"
    }
    
    /// Formats a Double value as a currency string
    /// - Parameter value: The double value to format
    /// - Returns: Formatted currency string or fallback string if formatting fails
    static func format(_ value: Double) -> String {
        return shared.string(from: NSNumber(value: value)) ?? "€?,??"
    }
}