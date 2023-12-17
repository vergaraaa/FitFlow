//
//  LineChart.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 14/12/23.
//

import Charts
import SwiftUI
import SwiftData

struct LineChartData: Identifiable {
    let id = UUID()
    var date: Date
    var value: Int
}

struct LineChart: View {
    let exercise: Exercise
    
    @Query(
        sort: [
            SortDescriptor(\Set.date, order: .reverse)
        ]
    ) var sets: [Set]
    
    private var chartDataDictionary: [Date: Int] {
        let filtered: [Set] = sets.compactMap { set in
            guard let exercise = set.exercise else {
                return nil
            }
            
            return exercise == self.exercise ? set : nil
        }
        .sorted(by: { $0.date < $1.date })
        
        let dictionary: [Date: Int] = filtered.reduce(into: [:]) { result, set in
            guard let dateComponents = Functions.dateComponents(from: set.date) else {
                return
            }
            
            if let groupedDate = Calendar.current.date(from: DateComponents(year: dateComponents.year, month: dateComponents.month, day: dateComponents.day)) {
                if result[groupedDate] == nil {
                    result[groupedDate] = set.reps
                } else {
                    result[groupedDate]? += set.reps
                }
            }
        }
        
        return dictionary
    }
    
    var body: some View {
        Chart {
            ForEach(Array(
                chartDataDictionary.keys.sorted(by: { $0 < $1 })
                    .suffix(7)
            ),
                id: \.self) { key in
                
                LineMark(
                    x: .value("", "\(key)"),
                    y: .value("", chartDataDictionary[key]!)
                )
                .foregroundStyle(.green)
                .interpolationMethod(.catmullRom)
                .symbol {
                    Circle()
                        .fill(.green)
                        .frame(width: 5)
                }
            }
        }
        .chartYAxis(.hidden)
        .chartXAxis(.hidden)
        .frame(width: 100, height: 40)
    }
}

#Preview {
    LineChart(exercise: Exercise(name: "", note: "", sets: []))
}
