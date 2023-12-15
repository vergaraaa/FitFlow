//
//  ExerciseDetailView.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 07/12/23.
//

import Charts
import SwiftUI
import SwiftData

struct ExerciseDetailView: View {
    let x = [0, 1, 2, 3, 4]
    let y = [0, 1, 2, 3, 4]
    
    var exercise: Exercise
    
    
    @State private var showAddSetSheet: Bool = false
    
    @Environment(\.modelContext) private var modelContext
    
    @Query(
        sort: [
            SortDescriptor(\Set.date, order: .reverse)
        ]
    ) var sets: [Set]
    
    private var filteredSets: [Set] {
        return sets.compactMap { set in
            guard let exercise = set.exercise else {
                return nil
            }
            
            return exercise == self.exercise ? set : nil
        }.sorted(by: { $0.date > $1.date })
    }
    
    private var mapOfSets: [Date: [Set]] {
        let filtered: [Set] = sets.compactMap { set in
            guard let exercise = set.exercise else {
                return nil
            }
            
            return exercise == self.exercise ? set : nil
        }
        
        let dictionary: [Date: [Set]] = filtered.reduce(into: [:]) { result, set in
            guard let dateComponents = dateComponents(from: set.date) else {
                return
            }
            
            if let groupedDate = Calendar.current.date(from: DateComponents(year: dateComponents.year, month: dateComponents.month, day: dateComponents.day)) {
                if result[groupedDate] == nil {
                    result[groupedDate] = [set]
                } else {
                    result[groupedDate]?.append(set)
                }
            }
        }
        
        return dictionary
    }
    
    var body: some View {
        Group {
            if(Array(mapOfSets.keys).isEmpty) {
                ContentUnavailableView("No sets yet!", systemImage: "dumbbell")
            }
            else {
                List {
                    if(mapOfSets.keys.count > 1) {
                        Section("Progress") {
                            ProgressChartView(exercise: exercise)
                        }
                        
                        let sortedMapByKeys = mapOfSets.sorted(by: { $0.key > $1.key })
                        
                        let (date, setss) = sortedMapByKeys.first!
                        
                        Section(Formatters.stringFromDate.string(from: date)) {
                            ComparisonView(title: "Compared to previous", sets: setss)
                            
                            SetsListView(exercise: exercise, sets: setss)
                                
                        }
                        
                        ForEach(1 ..< sortedMapByKeys.count, id: \.self) { index in
                            let (date, sets) = sortedMapByKeys[index]
                            
                            Section("\(Formatters.stringFromDate.string(from: date))") {
                                SetsListView(exercise: exercise, sets: sets)
                            }
                        }
                    }
                    else {
                        ForEach(Array(mapOfSets.keys), id: \.self) { key in
                            Section("\(Formatters.stringFromDate.string(from: key))") {
                                SetsListView(exercise: exercise, sets: mapOfSets[key] ?? [])
                            }
                        }
                        
                    }
                }
            }
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAddSetSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddSetSheet) {
            AddSetView(exercise: exercise)
        }
    }
    
    func dateComponents(from date: Date?) -> (year: Int, month: Int, day: Int)? {
        guard let date = date else {
            return nil
        }
        
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        return (components.year ?? 0, components.month ?? 0, components.day ?? 0)
    }
}

#Preview {
    NavigationStack {
        ExerciseDetailView(exercise: Exercise(name: "", note: "", sets: []))
    }
}
