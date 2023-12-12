//
//  SummaryView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 07/12/23.
//

import SwiftUI

struct SummaryView: View {
    
    @State private var showAddWorkoutSheet = false
    
    let workouts = ["Leg Day", "Chest Day", "Back Day", "Shoulders Day", "Arms Day"]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Today's Stats") {
                    NavigationLink {
                        SummaryDetailView()
                    } label: {
                        StatsView(exercises: 8, reps: 22, sets: 166, volume: 5)
                    }
                }
                
                Section {
                    ForEach(workouts, id: \.self) { workout in
                        NavigationLink {
                            WorkoutDetailView()
                        } label: {
                            WorkoutRowView(name: workout)
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
                Text("Add workout")
            }
        }
    }
}

#Preview {
    SummaryView()
}
