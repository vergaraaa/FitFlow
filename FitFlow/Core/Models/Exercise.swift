//
//  Exercise.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 12/12/23.
//

import SwiftData
import Foundation

@Model
class Exercise {
    var name: String
    var note: String
    var workout: Workout?
    @Relationship(
        deleteRule: .cascade,
        inverse: \Set.exercise
    ) var sets: [Set]
    
    init(name: String, note: String, sets: [Set]) {
        self.name = name
        self.note = note
        self.sets = sets
    }
}
