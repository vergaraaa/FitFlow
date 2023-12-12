//
//  PieChartView.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 11/12/23.
//

import SwiftUI

struct PieChartView: View {
    var value: Double
    var maxWeight: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.blue, .indigo]),
                        center: .center,
                        angle: .degrees(300)
                    ),
                    lineWidth: 5
                )
            
            Circle()
                .trim(from: 0, to: CGFloat(value))
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.green, .yellow]),
                        center: .center,
                        angle: .degrees(300)
                    ),
                    style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                )
                .rotationEffect(.degrees(-90))
                .overlay(
                    Text("\(String(format: "%.2f", maxWeight))")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                )
        }
    }
}

#Preview {
    PieChartView(value: 23, maxWeight: 45)
}
