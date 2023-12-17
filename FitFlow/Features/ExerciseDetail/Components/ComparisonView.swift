//
//  ComparisonView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI

struct ComparisonView: View {
    let currentSets: [Set]
    let previousSets: [Set]
    
    // Current Values
    private var currentReps: Int {
        var reps = 0
        
        currentSets.forEach { set in
            reps += set.reps
        }
        
        return reps
    }
    
    private var currentSetsValue: Int {
        return currentSets.count
    }
    
    private var currentVolume: Double {
        var weight = 0.0
        
        currentSets.forEach { set in
            weight += (set.weight * Double(set.reps))
        }
        
        return weight
    }
    
    private var currentRepsVolume: Double {
        return currentVolume / Double(currentReps)
    }
    
    // Previous Values
    private var previousReps: Int {
        var reps = 0
        
        previousSets.forEach { set in
            reps += set.reps
        }
        
        return reps
    }
    
    private var previousSetsValue: Int {
        return previousSets.count
    }
    
    private var previousVolume: Double {
        var weight = 0.0
        
        previousSets.forEach { set in
            weight += (set.weight * Double(set.reps))
        }
        
        return weight
    }
    
    private var previousRepsVolume: Double {
        return previousVolume / Double(previousReps)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "arrow.left.arrow.right")
                
                Text("Compared to previous")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }

            HStack {
                PreviousSetCell(
                    title: "Sets",
                    color: .red,
                    previousValue: Double(currentSetsValue),
                    currentValue: Double(previousSetsValue)
                )
                .frame(maxWidth: .infinity, alignment: .leading)

                PreviousSetCell(
                    title: "Reps",
                    color: .green,
                    previousValue: Double(previousReps),
                    currentValue: Double(currentReps)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            HStack {
                PreviousSetCell(
                    title: "Volume (kg)",
                    color: .cyan,
                    previousValue: previousVolume,
                    currentValue: currentVolume
                )
                .frame(maxWidth: .infinity, alignment: .leading)

                PreviousSetCell(
                    title: "kg/rep",
                    color: .orange,
                    previousValue: previousRepsVolume,
                    currentValue: currentRepsVolume
                )
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    ComparisonView(currentSets: [], previousSets: [])
}
