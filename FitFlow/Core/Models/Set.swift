//
//  Set.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 11/12/23.
//

import SwiftData
import Foundation

@Model
class Set {
    var reps: Int
    var weight: Double
    var date: Date
    var exercise: Exercise?
    
    init(reps: Int, weight: Double, date: Date, exercise: Exercise? = nil) {
        self.reps = reps
        self.weight = weight
        self.date = date
        self.exercise = exercise
    }
    
}
