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
    
    var body: some View {
        HStack {
            VerticalProgressView(color: color, total: totalValue, actual: actualValue)
            
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

#Preview {
    PreviousSetCell(
        color: .red,
        totalValue: 0,
        actualValue: 0,
        title: "Sets",
        value: 3,
        changedValue: 0,
        changePercentage: 0
    )
}
