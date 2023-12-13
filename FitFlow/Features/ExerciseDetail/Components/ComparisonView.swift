//
//  ComparisonView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI

struct ComparisonView: View {
    let title: String
    let sets: [Set]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "arrow.left.arrow.right")
                Text(title)
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }

            HStack {
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
    }
}

#Preview {
    ComparisonView(title: "", sets: [])
}
