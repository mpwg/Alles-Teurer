//
//  CurrencyFormatter.swift
//  Alles-Teurer
//
//  Created by GitHub Copilot on 27.09.25.
//

import Foundation

/// Centralized currency formatter for consistent formatting throughout the app
struct CurrencyFormatter {
    /// Common currency codes used in Austria and Europe
    static let commonCurrencies = ["EUR", "USD", "CHF", "GBP"]
    
    /// Default currency for the Austrian market
    static let defaultCurrency = "EUR"
    /// Shared formatter instance configured for Austrian Euro formatting (default)
    static let shared: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = Locale(identifier: "de_AT")
        return formatter
    }()
    
    /// Creates a formatter for the specified currency
    /// - Parameter currencyCode: The currency code (e.g., "EUR", "USD", "CHF")
    /// - Returns: NumberFormatter configured for the specified currency
    static func formatter(for currencyCode: String) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.locale = Locale(identifier: "de_AT") // Keep Austrian locale for consistent decimal separator
        return formatter
    }
    
    /// Formats a Decimal value as a currency string with specified currency
    /// - Parameters:
    ///   - value: The decimal value to format
    ///   - currencyCode: The currency code (defaults to "EUR")
    /// - Returns: Formatted currency string or fallback string if formatting fails
    static func format(_ value: Decimal, currency currencyCode: String = "EUR") -> String {
        let formatter = formatter(for: currencyCode)
        return formatter.string(from: value as NSNumber) ?? "\(currencySymbol(for: currencyCode))?,??"
    }
    
    /// Formats a Decimal value as a currency string (legacy method for backward compatibility)
    /// - Parameter value: The decimal value to format
    /// - Returns: Formatted currency string or fallback string if formatting fails
    static func format(_ value: Decimal) -> String {
        return format(value, currency: "EUR")
    }
    
    /// Formats a Double value as a currency string with specified currency
    /// - Parameters:
    ///   - value: The double value to format
    ///   - currencyCode: The currency code (defaults to "EUR")
    /// - Returns: Formatted currency string or fallback string if formatting fails
    static func format(_ value: Double, currency currencyCode: String = "EUR") -> String {
        let formatter = formatter(for: currencyCode)
        return formatter.string(from: NSNumber(value: value)) ?? "\(currencySymbol(for: currencyCode))?,??"
    }
    
    /// Formats a Double value as a currency string (legacy method for backward compatibility)
    /// - Parameter value: The double value to format
    /// - Returns: Formatted currency string or fallback string if formatting fails
    static func format(_ value: Double) -> String {
        return format(value, currency: "EUR")
    }
    
    /// Gets the currency symbol for a given currency code
    /// - Parameter currencyCode: The currency code
    /// - Returns: The currency symbol or the code itself if symbol not found
    static func currencySymbol(for currencyCode: String) -> String {
        let locale = Locale(identifier: "de_AT")
        return locale.localizedString(forCurrencyCode: currencyCode) ?? currencyCode
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
        
        // Clean the string first - remove common currency symbols and spaces
        let cleanedString = string
            .replacingOccurrences(of: "€", with: "")
            .replacingOccurrences(of: "$", with: "")
            .replacingOccurrences(of: "CHF", with: "")
            .replacingOccurrences(of: "£", with: "")
            .replacingOccurrences(of: "USD", with: "")
            .replacingOccurrences(of: "EUR", with: "")
            .replacingOccurrences(of: "GBP", with: "")
            .replacingOccurrences(of: " ", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let number = formatter.number(from: cleanedString) else {
            return nil
        }
        
        return Decimal(string: number.stringValue)
    }
    
    /// Detects currency from a string (looks for currency symbols/codes)
    /// - Parameter string: The string to analyze
    /// - Returns: Detected currency code or nil if none found
    static func detectCurrency(_ string: String) -> String? {
        let uppercaseString = string.uppercased()
        
        // Check for currency codes first
        for currency in commonCurrencies {
            if uppercaseString.contains(currency) {
                return currency
            }
        }
        
        // Check for currency symbols
        if string.contains("€") {
            return "EUR"
        } else if string.contains("$") {
            return "USD"
        } else if string.contains("£") {
            return "GBP"
        } else if string.contains("CHF") {
            return "CHF"
        }
        
        return nil
    }
}