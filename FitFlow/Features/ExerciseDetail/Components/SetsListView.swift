//
//  SetsListView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI
import TipKit

struct SetsListView: View {
    let exercise: Exercise
    let sets: [Set]
    let duplicateTip = DuplicateTip()
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ForEach(sets.sorted(by: { $0.date < $1.date })) { set in
            NavigationLink(destination: EditSetView(set: set)) {
                SetRow(set: set)
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            duplicateSet(set)
                            duplicateTip.invalidate(reason: .actionPerformed)
                        }) {
                            Image(systemName: "repeat")
                        }
                        .tint(.blue)
                    }
                    .popoverTip(duplicateTip)
            }
            
        }
        .onDelete(perform: deleteItem)
        .onAppear {
            if !sets.isEmpty {
            DuplicateTip.setsListViewDidOpen.sendDonation() }
        }
       
    }
    
    private func duplicateSet(_ set: Set) {
        let newSet = Set(
            reps: set.reps,
            weight: set.weight, 
//            date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            date: Date()
        )
        
        exercise.sets.append(newSet)
    }
    
    private func deleteItem(_ indexSet: IndexSet) {
        for index in indexSet {
            let set = sets[index]
            modelContext.delete(set)
        }
    }
}
#Preview {
    SetsListView(exercise: Exercise(name: "", note: "", sets: []), sets: [])
}
