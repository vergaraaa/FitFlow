//
//  PreviousSetCell.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI

struct PreviousSetCell: View {
    let color: Color
    let totalValue: Double
    let actualValue: Double
    let title: String
    let value: Double
    let changedValue: Double
    let changePercentage: Double
    let valueIncremented: Bool?
    
    private var icon: String {
        if valueIncremented == nil {
            return "circle.fill"
        }
        else if valueIncremented == true {
            return "triangle.fill"
        }
        else {
            return "triangle.fill"
        }
    }
    
    private var changedColor: Color {
        if valueIncremented == true {
            return .green
        }
        else {
            return .secondary
        }
    }
    
    var body: some View {
        HStack {
            VerticalProgressView(color: color, total: totalValue, actual: actualValue)
            
            VStack(alignment: .leading) {
                Text(title)
                
                Text(Formatters.decimal.string(from: NSNumber(value: value)) ?? "")
                
                HStack {
                    Image(systemName: icon)
                        .font(.caption)
                        .rotationEffect(.degrees(
                            valueIncremented == false ? 180 : 0))
                        .foregroundStyle(changedColor)
                    
                    Text("\(Formatters.decimal.string(from: NSNumber(value: changedValue)) ?? "") (\(Formatters.decimal.string(from: NSNumber(value: changePercentage)) ?? "")%)")
                        .foregroundStyle(changedColor)
                }
                
            }
        }
    }
}

#Preview {
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
}
