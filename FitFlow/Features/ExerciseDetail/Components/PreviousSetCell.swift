//
//  PreviousSetCell.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI

struct PreviousSetCell: View {
    let title: String
    let color: Color
    let previousValue: Double
    let currentValue: Double

    private var changedValue: Double {
        return currentValue - previousValue
    }
    
    private var changedPercentage: Double {
        return ((changedValue * 100) / previousValue)
    }
    
    private var icon: String {
        if changedValue == 0 {
            return "circle.fill"
        }
        else if changedValue > 0 {
            return "triangle.fill"
        }
        else {
            return "triangle.fill"
        }
    }
    
    private var changedColor: Color {
        if changedValue > 0 {
            return .green
        }
        else {
            return .secondary
        }
    }
    
    private var valueIncremented : Bool {
        return currentValue > previousValue
    }
    
    var body: some View {
        HStack {
            VerticalProgressView(color: color, previous: previousValue, current: currentValue, changedPercentage: changedPercentage)
            
            VStack(alignment: .leading) {
                Text(title)
                
                Text(Formatters.decimal.string(from: NSNumber(value: currentValue)) ?? "")
                    .foregroundStyle(.secondary)
                
                HStack {
                    Image(systemName: icon)
                        .font(.caption)
                        .rotationEffect(.degrees(
                            valueIncremented == false ? 180 : 0))
                        .foregroundStyle(changedColor)
                    
                    Text("\(Formatters.decimal.string(from: NSNumber(value: abs(changedValue))) ?? "") (\(Formatters.decimal.string(from: NSNumber(value: abs(changedPercentage))) ?? "")%)")
                        .foregroundStyle(changedColor)
                }
            }
            .padding(.leading, 5)
        }
    }
}

#Preview {
    PreviousSetCell(
        title: "Reps",
        color: .green,
        previousValue: 0.0,
        currentValue: 0.0
    )
}
