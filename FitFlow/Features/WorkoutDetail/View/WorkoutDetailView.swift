//
//  WorkautDetailView.swift
//  FitFlow
//
//  Created by Margarita Mayer on 11/12/23.
//

import SwiftUI
import SwiftData
import TipKit

struct WorkoutDetailView: View {
    @Environment(\.modelContext) var modelContext
    var workout: Workout
    let recordTip = RecordTip()
    
    @State private var showAddExerciseSheet = false
    @State private var showAddSetSheet = false
    
    @State var selectedExercise: Exercise?
    @State var exerciseToEdit: Exercise?
    
    var body: some View {
        
        Form {
            Section {
                ForEach(workout.excercises) { exercise in
                    NavigationLink {
                        ExerciseDetailView(exercise: exercise)
                    } label: {
                        HStack {
                            Text(exercise.name)
                            
                            Spacer()
                            
                            LineChart(exercise: exercise)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                selectedExercise = exercise
                                recordTip.invalidate(reason: .actionPerformed)
                            } label: {
                                Text("Record")
                            }
                            .tint(.blue)
                        }
                    
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                delete(exercise)
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }

                            Button {
                                exerciseToEdit = exercise
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.blue)
                        }
                        .popoverTip(recordTip)
                    }
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
        .sheet(item: $selectedExercise) { exercise in
            AddSetView(exercise: exercise)
        }
        .sheet(item: $exerciseToEdit) { exercise in
            EditExerciseView(exercise: exercise)
        }
        .onAppear {
            if !workout.excercises.isEmpty {
                RecordTip.workoutDetailViewDidOpen.sendDonation()
            }
        }
    }
    
    func delete(_ exercise: Exercise) {
        exercise.sets.forEach { set in
            modelContext.delete(set)
        }
        modelContext.delete(exercise)
        try? modelContext.save()
    }
}



#Preview {
    WorkoutDetailView(workout: Workout(name: "", wDescription: "", exercises: [ ]))
}
