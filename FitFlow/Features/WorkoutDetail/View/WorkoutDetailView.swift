//
//  WorkautDetailView.swift
//  FitFlow
//
//  Created by Margarita Mayer on 11/12/23.
//

import SwiftUI
import SwiftData

struct WorkoutDetailView: View {
    var workout: Workout
    
    var body: some View {
        Form {
            Section("Exercises") {
                ForEach(workout.excercises) { exercise in
                    if(workout.excercises.isEmpty) {
                        Text("Empty")
                    }
                    else {
                        Text("Not empty")
                    }
                }
            }
        }
        .navigationBarTitle(workout.name, displayMode: .inline)
    }
}


#Preview {
    WorkoutDetailView(workout: Workout(name: "", wDescription: "", exercises: [ ]))
}
