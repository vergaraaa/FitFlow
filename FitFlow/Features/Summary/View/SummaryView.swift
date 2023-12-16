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
