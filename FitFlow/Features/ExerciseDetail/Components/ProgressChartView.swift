//
//  ProgressChartView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 15/12/23.
//

import Charts
import SwiftUI
import SwiftData

struct ProgressChartView: View {
    let exercise: Exercise
    
    @Query(
        sort: [
            SortDescriptor(\Set.date, order: .reverse)
        ]
    ) var sets: [Set]
    
    @State private var selectedIndex: String?
    
    private var repsDataDictionary: [Date: Int] {
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
    
    private var weightDataDictionary: [Date: Double] {
        let filtered: [Set] = exercise.sets.compactMap { set in
            guard let exercise = set.exercise else {
                return nil
            }
            
            return exercise == self.exercise ? set : nil
        }
            .sorted(by: { $0.date < $1.date })
        
        let dictionary: [Date: Double] = filtered.reduce(into: [:]) { result, set in
            guard let dateComponents = Functions.dateComponents(from: set.date) else {
                return
            }
            
            if let groupedDate = Calendar.current.date(from: DateComponents(year: dateComponents.year, month: dateComponents.month, day: dateComponents.day)) {
                if result[groupedDate] == nil {
                    result[groupedDate] = set.weight
                } else {
                    result[groupedDate]? += set.weight
                }
            }
        }
        
        return dictionary
    }
    
    var body: some View {
        VStack {
            if let selectedIndex {
                Group {
                    Text("\(repsDataDictionary[Formatters.dateFromString.date(from: selectedIndex)!] ?? 0) reps")
                        .foregroundStyle(.green)
                    
                    +
                    
                    Text(" \(Formatters.decimal.string(from: (weightDataDictionary[Formatters.dateFromString.date(from: selectedIndex)!] ?? 0) as NSNumber) ?? "") kg")
                        .foregroundStyle(.orange)
                }
                .font(.title3)
                .bold()
            }
            else {
                Text(" ")
                    .font(.title3)
                    .bold()
            }
            
            Chart {
                ForEach(Array(repsDataDictionary.keys.sorted(by: { $0 < $1 })), id: \.self) { key in
                    LineMark(
                        x: .value("Date", "\(key)"),
                        y: .value("Reps", repsDataDictionary[key]!),
                        series: .value("Reps", "Reps")
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(.green)
                    .symbol {
                        Circle()
                            .fill(.green)
                            .frame(width: 5)
                    }
                }
                
                ForEach(Array(weightDataDictionary.keys.sorted(by: { $0 < $1 })), id: \.self) { key in
                    LineMark(
                        x: .value("Date", "\(key)"),
                        y: .value("Weight", weightDataDictionary[key]!),
                        series: .value("Weight", "Weight")
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(.orange)
                    .symbol {
                        Circle()
                            .fill(.orange)
                            .frame(width: 5)
                    }
                
                }
                
                
                if let selectedIndex {
                    RuleMark(x: .value("Index", selectedIndex))
                }
            }
//            .chartYAxis(.hidden)
            .chartXAxis(.hidden)
            .frame(height: 250)
            .chartXSelection(value: $selectedIndex)
            .chartForegroundStyleScale(["Reps": Color.green, "Weight": Color.orange])
        }
    }
}

#Preview {
    ProgressChartView(
        exercise: Exercise(
            name: "",
            note: "",
            sets: []
        )
    )
}
