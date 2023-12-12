//
//  RepsListView.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 11/12/23.
//

import SwiftUI

struct RepsListView: View {
    // Modelo de datos para representar las filas
    struct RowData: Identifiable {
        var id = UUID()
        var reps: String
        var time: String
        var weight: Double
        var date: String
    }
    
    let rows: [RowData] = [
        RowData(reps: "4", time: "08:00", weight: 10, date: "2023-12-01"),
        RowData(reps: "8", time: "12:30", weight: 15, date: "2023-12-01"),
        RowData(reps: "6", time: "09:45", weight: 12, date: "2023-12-02"),
        RowData(reps: "10", time: "14:00", weight: 20, date: "2023-12-03"),
        RowData(reps: "8", time: "18:30", weight: 18, date: "2023-12-03"),
        RowData(reps: "12", time: "10:15", weight: 22, date: "2023-12-04"),
        RowData(reps: "6", time: "13:45", weight: 15, date: "2023-12-04"),
        RowData(reps: "8", time: "16:30", weight: 17, date: "2023-12-05"),
        RowData(reps: "10", time: "20:00", weight: 21, date: "2023-12-05"),
        RowData(reps: "15", time: "11:45", weight: 25, date: "2023-12-06"),
        RowData(reps: "6", time: "15:30", weight: 16, date: "2023-12-06"),
        RowData(reps: "8", time: "19:00", weight: 19, date: "2023-12-07"),
        RowData(reps: "10", time: "08:45", weight: 23, date: "2023-12-07"),
        RowData(reps: "12", time: "12:15", weight: 24, date: "2023-12-08"),
        RowData(reps: "6", time: "16:30", weight: 18, date: "2023-12-08"),
        RowData(reps: "8", time: "20:00", weight: 22, date: "2023-12-09"),
        RowData(reps: "10", time: "09:15", weight: 20, date: "2023-12-09"),
        RowData(reps: "12", time: "13:00", weight: 25, date: "2023-12-10"),
        RowData(reps: "6", time: "17:30", weight: 16, date: "2023-12-10"),
        RowData(reps: "8", time: "21:00", weight: 19, date: "2023-12-11"),
        RowData(reps: "10", time: "10:45", weight: 21, date: "2023-12-11"),
        RowData(reps: "12", time: "14:15", weight: 24, date: "2023-12-12"),
        RowData(reps: "6", time: "18:30", weight: 17, date: "2023-12-12")

    ]
    
    var body: some View {
        Text("Sesions")
            .fontWeight(.semibold)
            .offset(y: 10)
        List {
            ForEach(
                // 1. Grouping Rows by Date
                Dictionary(grouping: rows, by: { $0.date }).sorted(by: { $0.key < $1.key }),
                // 2. Unique identifier for each section based on date
                id: \.key
            ) { section in
                // 3. Iterate over Sections (Dates)
                Section(header: Text(section.key)) {
                    // 4. Create Section for each Date
                    
                    // 5. Iterate over Rows in each Section
                    ForEach(section.value) { row in
                        // 6. Create Row View (RepRowView)
                        RepRowView(reps: row.reps, weight: row.weight, time: row.time, maxWeight: 25)
                    }
                }
            }
        }
        .listStyle(.automatic)
        .listRowInsets(EdgeInsets())

    }
}



#Preview {
    RepsListView()
}
