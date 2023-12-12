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
    
    @State private var showAddExerciseSheet = false
    
    var body: some View {
        Form {
            Section {
                ForEach(workout.excercises) { exercise in
                    Text(exercise.name)
                }
            } header: {
                HStack {
                    Text("Exercises")
                    
                    Spacer()
                    
                    Button {
                        showAddExerciseSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationBarTitle(workout.name, displayMode: .inline)
        .sheet(isPresented: $showAddExerciseSheet) {
            AddExerciseView(workout: workout, showAddExerciseSheet: $showAddExerciseSheet)
        }
    }
}


#Preview {
    WorkoutDetailView(workout: Workout(name: "", wDescription: "", exercises: [ ]))
}
