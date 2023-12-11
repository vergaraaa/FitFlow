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
                            Text(workout)
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

struct WorkoutRowView: View {
    
    let name: String
    
    var body: some View {
        HStack {
            Image(systemName: "dumbbell")
                .foregroundStyle(.blue)
            
            Text(name)
        }
    }
}

struct StatsVStack: View {
    
    let name: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
            
            Text(value)
                .foregroundStyle(color)
                .font(.title2)
                .bold()
        }
    }
}

struct StatsView: View {
    let exercises: Int
    let reps: Int
    let sets: Int
    let volume: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                StatsVStack(name: "Exercises", value: "\(exercises)", color: .cyan)
                
                StatsVStack(name: "Reps", value: "\(reps)", color: .green)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 15) {
                StatsVStack(name: "Sets", value: "\(sets)", color: .red)
                
                StatsVStack(name: "Volume", value: "\(volume) kg", color: .orange)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
