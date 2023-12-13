//
//  WorkautDetailView.swift
//  FitFlow
//
//  Created by Margarita Mayer on 11/12/23.
//

import SwiftUI
import SwiftData

struct WorkoutDetailView: View {
    @Environment(\.modelContext) var modelContext
    var workout: Workout
    
    @State private var showAddExerciseSheet = false
    @State private var showAddSetSheet = false
    
    @State var selectedExercise: Exercise?
    
    var body: some View {
        Form {
            Section {
                ForEach(workout.excercises) { exercise in
                    NavigationLink {
                        ExerciseDetailView(exercise: exercise)
                    } label: {
                        Text(exercise.name)
                            .swipeActions(edge: .leading) {
                                Button {
                                    selectedExercise = exercise
                                } label: {
                                    Text("Record")
                                }
                                .tint(.blue)
                            }
                    }
                }
                .onDelete(perform: deleteItem)
                
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
        .sheet(item: $selectedExercise) { selectedExercise in
            AddSetView(exercise: selectedExercise)
        }
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        for index in indexSet {
            let exercise = workout.excercises[index]
            modelContext.delete(exercise)
        }
    }
}


#Preview {
    WorkoutDetailView(workout: Workout(name: "", wDescription: "", exercises: [ ]))
}
