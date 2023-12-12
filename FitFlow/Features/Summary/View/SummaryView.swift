//
//  SummaryView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 07/12/23.
//

import SwiftUI
import SwiftData

struct SummaryView: View {
    
    @Query private var workouts: [Workout]
    @Environment(\.modelContext) private var modelContext
    
    @State private var showAddWorkoutSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Today's Stats") {
                    NavigationLink {
                        SummaryDetailView()
                    } label: {
                        StatsView(exercises: 0, reps: 0, sets: 0, volume: 0)
                    }
                }
                
                Section {
                    ForEach(workouts) { workout in
                        NavigationLink {
                            WorkoutDetailView(workout: workout)
                        } label: {
                            WorkoutRowView(name: workout.name)
                        }
                    }
                    .onDelete(perform: deleteItem)
                } header: {
                    HStack {
                        Text("Workouts")
                        
                        Spacer()
                        
                        Button {
                            showAddWorkoutSheet.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .navigationTitle("Summary")
            .sheet(isPresented: $showAddWorkoutSheet) {
                AddWorkoutView(showAddWorkoutSheet: $showAddWorkoutSheet)
            }
        }
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        for index in indexSet {
            let workout = workouts[index]
            modelContext.delete(workout)
        }
    }
}

#Preview {
    SummaryView()
        .modelContainer(for: Workout.self, inMemory: true)
}
