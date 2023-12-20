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
    
    @State var selectedWorkout: Workout? = nil
    @State private var showAddWorkoutSheet = false
    
    @Query(
        sort: [
            SortDescriptor(\Set.date, order: .reverse)
        ]
    ) var setsArray: [Set]
    
    private var dateSets: [Set] {
        return setsArray.filter { set in
            let setComponents = Functions.dateComponents(from: set.date)
            let dateComponents = Functions.dateComponents(from: Date())
            
            return setComponents?.year == dateComponents?.year &&
            setComponents?.month == dateComponents?.month &&
            setComponents?.day == dateComponents?.day
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Today's Activity") {
                    NavigationLink {
                        SummaryDetailView()
                    } label: {
                        StatsView(dateSets: dateSets)
                    }
                }
                
                Section {
                    ForEach(workouts) { workout in
                        NavigationLink {
                            WorkoutDetailView(workout: workout)
                        } label: {
                            WorkoutRowView(name: workout.name)
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button(role: .destructive) {
                                        delete(workout)
                                    } label: {
                                        Label("Delete", systemImage: "trash.fill")
                                    }
                                    
                                    Button {
                                        selectedWorkout = workout
                                    } label: {
                                        Label("Edit", systemImage: "pencil")
                                    }
                                    .tint(.blue)
                                }
                        }
                    }
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
            .sheet(item: $selectedWorkout) { workout in
                EditWorkoutView(workout: workout)
            }
        }
    }
    
    func delete(_ workout: Workout) {
        workout.excercises.forEach { exercise in
            exercise.sets.forEach { set in
                modelContext.delete(set)
            }
            modelContext.delete(exercise)
        }
        modelContext.delete(workout)
        
        try? modelContext.save()
    }
}

#Preview {
    SummaryView()
        .modelContainer(for: Workout.self, inMemory: true)
}
