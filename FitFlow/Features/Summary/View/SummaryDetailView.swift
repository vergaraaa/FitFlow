//
//  SummaryDetailView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 11/12/23.
//

import SwiftUI
import SwiftData

struct SummaryDetailView: View {
    
    @State private var date = Date()
    
    @Query(
        sort: [
            SortDescriptor(\Set.date, order: .reverse)
        ]
    ) var sets: [Set]
    
    private var dateSets: [Set] {
        return sets.filter { set in
            let setComponents = Functions.dateComponents(from: set.date)
            let dateComponents = Functions.dateComponents(from: date)
            
            return setComponents?.year == dateComponents?.year &&
                setComponents?.month == dateComponents?.month &&
                setComponents?.day == dateComponents?.day
        }
    }
    
    private var exercisesDict: [String: [Set]] {
        var dictionary: [String: [Set]] = [:]
        
        dateSets.forEach { set in
            if dictionary[set.exercise!.name] == nil {
                dictionary[set.exercise!.name] = [set]
            } else {
                dictionary[set.exercise!.name]?.append(set)
            }
        }
        
        return dictionary
    }
    
    
    var body: some View {
        List {
            Section("Date") {
                DatePicker("Date", selection: $date, in: ...Date.now, displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
            
            Section("Stats") {
                StatsView(dateSets: dateSets)
            }
            
            if(!exercisesDict.isEmpty) {
                Section("Workout Details") {
                    ForEach(Array(exercisesDict.keys), id: \.self) { key in
                        VStack(alignment: .leading) {
                            Text(key)
                                .font(.title3)
                                .bold()
                            
                            ForEach(exercisesDict[key]!) { set in
                                Text("\(set.reps) reps - \(Formatters.decimal.string(from: NSNumber(value: set.weight)) ?? "") kg")
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SummaryDetailView()
}
