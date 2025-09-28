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
    
    /// Converts a Decimal to string for text field display (without currency symbol)
    /// - Parameter value: The decimal value to convert
    /// - Returns: String representation of the decimal value
    static func decimalToString(_ value: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "de_AT")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: value as NSNumber) ?? "0,00"
    }
    
    /// Converts a string to Decimal for price calculation
    /// - Parameter string: The string to convert
    /// - Returns: Decimal value if conversion succeeds, nil otherwise
    static func stringToDecimal(_ string: String) -> Decimal? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "de_AT")
        
        // Clean the string first - remove currency symbols and spaces
        let cleanedString = string
            .replacingOccurrences(of: "€", with: "")
            .replacingOccurrences(of: " ", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let number = formatter.number(from: cleanedString) else {
            return nil
        }
        
        return Decimal(string: number.stringValue)
    }
}