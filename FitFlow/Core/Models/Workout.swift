//
//  Workout.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 11/12/23.
//

import SwiftData
import Foundation

@Model
class Workout {
    var name: String
    var wDescription: String?
    
    @Relationship(
        deleteRule: .cascade,
        inverse: \Exercise.workout
    ) var excercises: [Exercise]

    init(name: String, wDescription: String?, exercises: [Exercise]) {
        self.name = name
        self.wDescription = wDescription
        self.excercises = exercises
    }
}
