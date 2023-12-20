//
//  EditWorkoutView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 20/12/23.
//

import SwiftUI

struct EditWorkoutView: View {
    @State private var name = ""
    @State private var description = ""
    
    @Bindable var workout: Workout
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    private var valid: Bool {
        return !name.isEmpty
    }
    
    init(workout: Workout) {
        self.workout = workout
        self._name = State(wrappedValue: workout.name)
        self._description = State(wrappedValue: workout.wDescription ?? "")
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // Image section
                Section {
                    WorkoutImage()
                }
                .listRowBackground(Color.clear)
                
                // Name Section
                Section {
                    TextField("Enter workout name", text: $name)
                } header: {
                    Text("Name")
                } footer: {
                    Text("Popular names can be: Workout Type, Day of the Week, Muscle Group.")
                }
                
                // Description Section
                Section {
                    TextField("Description", text: $description)
                } header: {
                    Text("Description")
                } footer: {
                    Text("Want to add some details? Go ahead!")
                }
            }
            .navigationTitle("Edit Workout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        workout.name = name
                        workout.wDescription = description
                        dismiss()
                    }
                    .disabled(!valid)
                    .bold()
                }
            }
        }
    }
}

#Preview {
    EditWorkoutView(workout: Workout(name: "", wDescription: "", exercises: []))
}
