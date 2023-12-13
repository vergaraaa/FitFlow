//
//  Formatters.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import Foundation

struct Formatters {
    static let weightFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
        
        return formatter
    }()
}
