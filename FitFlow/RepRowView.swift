//
//  RepRowView.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 11/12/23.
//

import SwiftUI

struct RepRowView: View {
    var reps: String
    var weight: Double
    var time: String
    var maxWeight: Double
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text("\(reps) Rep")
                    .font(.title2)
                    .padding(.bottom, 4)
                
                Text(time)
                    .font(.caption)
            }
            
            Spacer()
            
            HStack(alignment: .center) {
                Spacer()
                
                Text("\(String(format: "%.2f", Double(weight))) KG")
                    .font(.subheadline)
                    .padding(.horizontal, 10)
                
                PieChartView(value: weightPercentage(), maxWeight: maxWeight)
                    .frame(width: 50, height: 50)
            }
            
            Spacer()
        }
    }
    private func weightPercentage() -> Double {
        return max(0.0, min(1.0, weight / maxWeight))
    }
    
}

#Preview {
    RepRowView(reps: "10", weight: 30, time: "7:05", maxWeight: 25)
}
