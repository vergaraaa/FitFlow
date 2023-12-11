//
//  StatsView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 11/12/23.
//

import SwiftUI

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

#Preview {
    StatsView(exercises: 8, reps: 22, sets: 166, volume: 5)
}
