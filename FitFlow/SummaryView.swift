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
                        Text("Stats")
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 15) {
                                StatsVStack(name: "Exercises", value: "8", color: .cyan)
                                
                                StatsVStack(name: "Reps", value: "166", color: .green)
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                StatsVStack(name: "Sets", value: "22", color: .red)
                                
                                StatsVStack(name: "Volume", value: "5 kg", color: .orange)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
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
