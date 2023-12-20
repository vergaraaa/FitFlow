//
//  AddWorkoutView.swift
//  FitFlow
//
//  Created by Bisma Baig on 12/12/23.
//

import SwiftUI

struct AddExerciseView: View {
    
    var workout: Workout
    
    @State private var name = ""
    @State private var note = ""
    
    @Binding var showAddExerciseSheet: Bool
    
    @Environment(\.modelContext) private var modelContext
    
    private var valid: Bool {
        return !name.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // Image section
                Section {
                    ExerciseImage()
                }
                .listRowBackground(Color.clear)
                
                // Name Section
                Section {
                    TextField("Enter exercise name", text: $name)
                } header: {
                    Text("Name")
                }
                
                // Description Section
                Section {
                    TextField("Note", text: $note)
                } header: {
                    Text("Note")
                } footer: {
                    Text("Some notes can be: Seat level, Pulley Level, One arm exercise.")
                }
            }
            .navigationTitle("Add Exercise")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        showAddExerciseSheet.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        let newExercise = Exercise(name: name, note: note, sets: [])
                        
                        workout.excercises.append(newExercise)
                        
                        showAddExerciseSheet.toggle()
                    }
                    .bold()
                    .disabled(!valid)
                }
            }
        }
    }
}

#Preview {
    AddExerciseView(workout: Workout(name: "", wDescription: "", exercises: []), showAddExerciseSheet: .constant(false))
}
