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
        }
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
    
    var sortedMapOfSets: [(key: Date, value: [Set])] {
        mapOfSets.sorted(by: { $0.key > $1.key })
    }
    
    var mostRecentSets: (key: Date, value: [Set])? {
        return sortedMapOfSets.first ?? nil
    }
    
    
    var body: some View {
        List {
            if(sortedMapOfSets.count > 1) {
                if let mostRecentSets = mostRecentSets {
                    let (date, sets) = mostRecentSets
                    
                    Section(Formatters.stringFromDate.string(from: date)) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "arrow.left.arrow.right")
                                
                                Text("Compared to previous")
                            }
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            
                            HStack {
                                // Sets
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
                                
                                // Reps
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
                                // Volume
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
                                
                                // Volume / reps
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
                        
                        ForEach(sets.sorted(by: {$0.date > $1.date })) { set in
                            NavigationLink {
                                EditSetView()
                            } label: {
                                SetRow(set: set)
                            }
                        }
                        
                        
                    }
                    
                    ForEach(1 ..< sortedMapOfSets.count, id: \.self) { index in
                        let (date, sets) = sortedMapOfSets[index]
                        
                        Section("\(Formatters.stringFromDate.string(from: date))") {
                            ForEach(sets.sorted(by: {$0.date > $1.date })) { set in
                                NavigationLink {
                                    EditSetView()
                                } label: {
                                    SetRow(set: set)
                                }
                            }
                        }
                    }
                }
            }
            else {
                ForEach(0 ..< 1) { index in
                    let (date, sets) = sortedMapOfSets[index]
                    
                    Section("\(Formatters.stringFromDate.string(from: date))") {
                        ForEach(sets.sorted(by: {$0.date > $1.date })) { set in
                            NavigationLink {
                                EditSetView()
                            } label: {
                                SetRow(set: set)
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
    
    private func dateComponents(from date: Date?) -> (year: Int, month: Int, day: Int)? {
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
