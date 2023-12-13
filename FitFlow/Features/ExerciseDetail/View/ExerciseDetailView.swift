//
//  ExerciseDetailView.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 07/12/23.
//

import Charts
import SwiftUI

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
                        PreviousValueCell(
                            color: .red,
                            totalValue: 0,
                            actualValue: 0,
                            title: "Sets",
                            value: 3,
                            changedValue: 0,
                            changePercentage: 0
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Reps
                        PreviousValueCell(
                            color: .green,
                            totalValue: 0,
                            actualValue: 0,
                            title: "Reps",
                            value: 14,
                            changedValue: 4,
                            changePercentage: 22.2
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        // Volume
                        PreviousValueCell(
                            color: .cyan,
                            totalValue: 0,
                            actualValue: 0,
                            title: "Volume (kg)",
                            value: 60,
                            changedValue: 30,
                            changePercentage: 100
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Volume / reps
                        PreviousValueCell(
                            color: .orange,
                            totalValue: 0,
                            actualValue: 0,
                            title: "kg/rep",
                            value: 4.29,
                            changedValue: 2.6,
                            changePercentage: 157.1
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                // Newest reps
                ForEach(0 ..< 3) { i in
                    NavigationLink {
                        EditSetView()
                    } label: {
                        SetRow()
                    }
                }
                
                
            }
            
            // History of Reps
            ForEach(0 ..< 5) { i in
                Section("Wed, 15 Nov 2023") {
                    ForEach(0 ..< 3) { j in
                        NavigationLink {
                            EditSetView()
                        } label: {
                            SetRow()
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

struct PreviousValueCell: View {
    let color: Color
    let totalValue: Double
    let actualValue: Double
    let title: String
    let value: Double
    let changedValue: Double
    let changePercentage: Double
    
    var body: some View {
        HStack {
            VerticalProgressBar(color: color, total: totalValue, actual: actualValue)
            
            VStack(alignment: .leading) {
                Text(title)
                
                Text(Formatters.decimal.string(from: NSNumber(value: value)) ?? "")
                
                HStack {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                    
                    Text("\(Formatters.decimal.string(from: NSNumber(value: changedValue)) ?? "") (\(Formatters.decimal.string(from: NSNumber(value: changePercentage)) ?? "")%)")
                }
                
            }
        }
    }
}

struct VerticalProgressBar: View {
    let color: Color
    let total: Double
    let actual: Double
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.5))
                    .frame(width: 10, height: 70)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .frame(width: 10, height: 40)
            }
        }
        .frame(width: 10)
    }
}

struct SetRow: View {
    var body: some View {
        HStack {
            Text("14:57")
            
            Spacer()
            
            Group {
                Text("6")
                    .bold()
                    .font(.title3)
                +
                Text(" rep")
            }
            .foregroundStyle(.green)
            .padding(.horizontal)
            
            Group {
                Text("10")
                    .bold()
                    .font(.title3)
                +
                Text(" kg")
            }
            .foregroundStyle(.orange)
        }
    }
}
