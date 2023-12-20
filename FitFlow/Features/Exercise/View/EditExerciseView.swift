//
//  EditExerciseView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 20/12/23.
//

import SwiftUI

struct EditExerciseView: View {

    @Bindable var exercise: Exercise
    
    @State private var name = ""
    @State private var note = ""
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    private var valid: Bool {
        return !name.isEmpty
    }
    
    init(exercise: Exercise) {
        self.exercise = exercise
        self._name = State(wrappedValue: exercise.name)
        self._note = State(wrappedValue: exercise.note ?? "")
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
            .navigationTitle("Edit Exercise")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        exercise.name = name
                        exercise.note = note
                        
                        dismiss()
                    }
                    .bold()
                    .disabled(!valid)
                }
            }
        }
    }
}

#Preview {
    EditExerciseView(exercise: Exercise(name: "", note: "", sets: []))
}
