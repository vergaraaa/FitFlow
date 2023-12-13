//
//  ExerciseDetailView.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 07/12/23.
//

import Charts
import SwiftUI
import SwiftData

struct ExerciseDetailView: View {
    let x = [0, 1, 2, 3, 4]
    let y = [0, 1, 2, 3, 4]
    
    let exercise: Exercise
    
    var body: some View {
        List {
            Section("Wed, 6 Dec 2023") {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "arrow.left.arrow.right")
                        
                        Text("Compared to previous")
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    
                    HStack {
                        // Sets
                        PreviousSetCell(
                            color: .red,
                            totalValue: 0,
                            actualValue: 0,
                            title: "Sets",
                            value: 3,
                            changedValue: 0,
                            changePercentage: 0,
                            valueIncremented: nil
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Reps
                        PreviousSetCell(
                            color: .green,
                            totalValue: 0,
                            actualValue: 0,
                            title: "Reps",
                            value: 14,
                            changedValue: 4,
                            changePercentage: 22.2,
                            valueIncremented: true
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        // Volume
                        PreviousSetCell(
                            color: .cyan,
                            totalValue: 0,
                            actualValue: 0,
                            title: "Volume (kg)",
                            value: 60,
                            changedValue: 30,
                            changePercentage: 100,
                            valueIncremented: false
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Volume / reps
                        PreviousSetCell(
                            color: .orange,
                            totalValue: 0,
                            actualValue: 0,
                            title: "kg/rep",
                            value: 4.29,
                            changedValue: 2.6,
                            changePercentage: 157.1,
                            valueIncremented: nil
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                // Newest reps
//                ForEach(0 ..< 3) { i in
//                    NavigationLink {
//                        EditSetView()
//                    } label: {
//                        SetRow()
//                    }
//                }
                
                
            }
            
            // History of Reps
            ForEach(0 ..< 1) { i in
                Section("Wed, 15 Nov 2023") {
                    ForEach(exercise.sets) { set in
                        NavigationLink {
                            EditSetView()
                        } label: {
                            SetRow(set: set)
                        }

                    }
                }
            }
            
            // Historical Stats
//            Section {
//                HStack {
//                    VStack(spacing: 10) {
//                        Text("Most Reps")
//                        
//                        VStack(spacing: 0) {
//                            Text("15")
//                                .font(.largeTitle)
//                                .foregroundStyle(.green)
//                                .bold()
//                            
//                            Text("With 20 kg")
//                                .font(.footnote)
//                                .foregroundStyle(.gray)
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
//                    
//                    VStack(spacing: 10) {
//                        Text("Top Weight")
//                        
//                        VStack(spacing: 0) {
//                            Text("40")
//                                .font(.largeTitle)
//                                .foregroundStyle(.orange)
//                                .bold()
//                            
//                            Text("Doing 2 reps")
//                                .font(.footnote)
//                                .foregroundStyle(.gray)
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
//                }
//            }
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ExerciseDetailView(exercise: Exercise(name: "", note: "", sets: []))
    }
}
