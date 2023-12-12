//
//  EditSetView.swift
//  FitFlow
//
//  Created by Gavrilovici Ana on 07/12/23.
//

import SwiftUI

struct EditSetView: View {
    var exercises = ["Pull Up", "Push Up", "Sit Up", "Plank"]
    @State private var selectedExercise = "Pull Up"
    @State private var comment: String = ""
    @State private var date = Date.now
    @State private var selectedRep = 8
    @State private var selectedWeight = 0
    
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Exercise", selection: $selectedExercise) {
                        ForEach(exercises, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                Section {
                    Picker("Repetitions", selection: $selectedRep) {
                        ForEach(1..<51, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    Picker("Weight (kg)", selection: $selectedWeight) {
                        ForEach(1..<201, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                Section("Notes") {
                    TextField("Comment", text: $comment)
                }
                Section {
                    HStack {
                        Text("Date")
                        Spacer()
                        Spacer()
                        DatePicker( selection: $date,  in: ...Date.now, displayedComponents: .date) {
                        }.labelsHidden()
                        DatePicker( selection: $date, displayedComponents: .hourAndMinute) {
                        }.labelsHidden()
                    }
                } footer: {
                    Text("Exact Time: \(timeFormatter.string(from: date))")
                }
                
                
                Section {
                    HStack {
                        Text("Delete")
                        Spacer()
                        Image(systemName: "trash")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Edit Set")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Add your save logic here
                    }
                }
            }
        

        }
    }
    
}


#Preview {
    EditSetView()
}


struct PullUpView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Show Edit View") {
                    EditSetView()
                }
            }
            .navigationTitle("Pull Up")
        }
    }
}

