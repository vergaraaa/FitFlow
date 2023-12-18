//
//  StatsView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 11/12/23.
//

import SwiftUI
import SwiftData

struct StatsView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    var dateSets: [Set]
    
    private var exercises: Int {
        var dictionary: [String: Int] = [:]
        
        dateSets.forEach { set in
            dictionary[set.exercise?.name ?? ""] = 0
        }
        
        return dictionary.keys.count
    }
    
    private var reps: Int {
        var reps = 0
        
        dateSets.forEach { set in
            reps += set.reps
        }
        
        return reps
    }
    
    private var sets: Int {
        return dateSets.count
    }
    
    private var volume: Double {
        var weight = 0.0
        
        dateSets.forEach { set in
            weight += set.weight
        }
        
        return weight
    }
    
    var body: some View {
        
        if dynamicTypeSize <= .accessibility1{
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    StatsVStack(name: "Exercises", value: "\(exercises)", color: .cyan)
                    
                    StatsVStack(name: "Reps", value: "\(reps)", color: .green)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 15) {
                    StatsVStack(name: "Sets", value: "\(sets)", color: .red)
                    
                    StatsVStack(name: "Volume (kg)", value: "\(Formatters.decimal.string(from: NSNumber(value: volume)) ?? "0")", color: .orange)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        else{
            VStack(alignment: .leading, spacing: 15) {
                StatsVStack(name: "Exercises", value: "\(exercises)", color: .cyan)
                
                StatsVStack(name: "Reps", value: "\(reps)", color: .green)
                
                StatsVStack(name: "Sets", value: "\(sets)", color: .red)
                
                StatsVStack(name: "Volume (kg)", value: "\(Formatters.decimal.string(from: NSNumber(value: volume)) ?? "0")", color: .orange)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

#Preview {
    StatsView(dateSets: [])
}
