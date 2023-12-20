//
//  AddWorkoutView.swift
//  FitFlow
//
//  Created by Bisma Baig on 12/12/23.
//

import SwiftUI

struct AddWorkoutView: View {
    
    @State private var name = ""
    @State private var description = ""
    
    @Binding var showAddWorkoutSheet: Bool
    
    @Environment(\.modelContext) private var modelContext
    
    private var valid: Bool {
        return !name.isEmpty
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
            .navigationTitle("Add Workout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        showAddWorkoutSheet.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        let newWorkout = Workout(
                            name: name,
                            wDescription: description,
                            exercises: []
                        )
                        
                        modelContext.insert(newWorkout)
                        
                        showAddWorkoutSheet.toggle()
                    }
                    .disabled(!valid)
                    .bold()
                }
            }
        }
    }
}

#Preview {
    AddWorkoutView(showAddWorkoutSheet: .constant(false))
}
