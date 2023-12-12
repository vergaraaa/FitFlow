//
//  WorkautDetailView.swift
//  FitFlow
//
//  Created by Margarita Mayer on 11/12/23.
//

import SwiftUI
import SwiftData

struct WorkoutDetailView: View {
    @Environment(\.modelContext) private var modelContext
//    @State private var exercises: [Exercise]
//    @Query private var workouts: [Workout]
//    @State private var currentFolderName: String = "New folder"
    @State private var newSet = ""
    @State private var newName = ""
    @State private var newNote = ""
    
    var workout: Workout
    
    var body: some View {
        
        Form {
            Section {
                ForEach(workout.excercises) { exercise in
                    Text(exercise.name)
                }
             .onDelete(perform: deleteItems)

            } header: {
                HStack {
                    Text("Exercises")

                    Spacer()

                    Button {
                     addItem()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            TextField("Add a new exercise...", text: $newName)
            
        }
        .navigationBarTitle(workout.name, displayMode: .inline)
        
        
    }
    
        func addItem() {
                withAnimation {
                    let newExercise = Exercise(name: newName, note: newNote, sets: [])
//                    modelContext.insert(newExercise)
                    workout.excercises.append(newExercise)
                    newName = ""
                    newSet = ""
            }
        }
    
        private func deleteItems(offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    modelContext.delete(workout.excercises[index])
                }
            }
        }
}



//#Preview {
//    WorkoutDetailView(
//        workout: Workout(
//            name: "Test Workout",
//            wDescription: "Test workout description",
//            exercises: [
//                Exercise(name: "Exercise 1", note: "", sets: [])
//            ]
//        )
//    )
//    .modelContainer(for: Workout.self, inMemory: true)
//    .modelContainer(for: Exercise.self, inMemory: true)
//}
