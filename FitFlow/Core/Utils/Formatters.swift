//
//  Formatters.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import Foundation

struct Formatters {
    static let decimal: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        return formatter
    }()
    
    static let hourFromDate: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        
        return formatter
    } ()
    
    static let stringFromDate: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        
        return formatter
    } ()
    
    static let dateFromString: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        return formatter
    } ()
}
