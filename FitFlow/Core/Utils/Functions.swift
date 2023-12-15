//
//  Functions.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 15/12/23.
//

import Foundation

struct Functions {
    static func dateComponents(from date: Date?) -> (year: Int, month: Int, day: Int)? {
        guard let date = date else {
            return nil
        }
        
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        return (components.year ?? 0, components.month ?? 0, components.day ?? 0)
    }
}
