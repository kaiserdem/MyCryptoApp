//
//  Double.swift
//  MyCrypto
//
//  Created by kaiserdem  on 07.04.2023.
//

import Foundation

extension Double {
    
    /// Converts a Double into a Currency with 2 demical places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private var currentCormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumIntegerDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as String with 2 demical places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2Democals() -> String {
        let number = NSNumber(value: self)
        return currentCormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into a Currency with 2-6 demical places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currentCormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumIntegerDigits = 6
        return formatter
    }
    
    /// Converts a Double into a Currency as String with 2-6 demical places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Democals() -> String {
        let number = NSNumber(value: self)
        return currentCormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into string representations
    /// ```
    /// Convert 1.23456 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a Double into string representations with percent string symbol
    /// ```
    /// Convert 1.23456 to "1.23%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
