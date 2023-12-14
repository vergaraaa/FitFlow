//
//  EditSetView.swift
//  FitFlow
//
//  Created by Gavrilovici Ana on 07/12/23.
//

import SwiftUI

struct EditSetView: View {
    @Bindable var set: Set
    
    @State var reps: Int
    @State var weight: Double
    @State var date: Date
    
    @Environment (\.dismiss) var dismiss
    
    @Environment(\.modelContext) var modelContext
    
    init(set: Set) {
        self.set = set
        self._reps = State(wrappedValue: set.reps)
        self._weight = State(wrappedValue: set.weight)
        self._date = State(wrappedValue: set.date)
    }
    
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }
    
    var valid: Bool {
        return reps != 0
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Repetitions")
                        
                        TextField("Reps", value: $reps, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                }
                
                Section {
                    HStack {
                        Text("Weight (kg)")
                        
                        TextField("Reps", value: $weight, formatter: Formatters.decimal)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                    }
                }
                
                Section {
                    DatePicker("Date", selection: $date, in: ...Date.now)
                } footer: {
                    Text("Exact Time: \(timeFormatter.string(from: set.date))")
                }
                
                Section {
                    Button {
                        modelContext.delete(set)
                        
                        dismiss()
                    } label: {
                        HStack {
                            Text("Delete")
                            Spacer()
                            Image(systemName: "trash")
                        }
                        .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Edit Set")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        set.reps = reps
                        set.weight = weight
                        set.date = date
                        
                        dismiss()
                    }
                    .disabled(!valid)
                }
            }
        }
    }
    
}


#Preview {
    EditSetView(set: Set(reps: 10, weight: 0.1, date: Date()))
}

