//
//  SummaryDetailView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 11/12/23.
//

import SwiftUI

struct SummaryDetailView: View {
    var body: some View {
        List {
            Section("Date") {
                HStack {
                    Button {
                        print("left")
                    } label: {
                        Image(systemName: "chevron.left.circle")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Spacer()
                    
                    Text("Today")
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        print("right")
                    } label: {
                        Image(systemName: "chevron.right.circle")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            
            Section("Stats") {
                StatsView(exercises: 8, reps: 22, sets: 166, volume: 5)
            }
            
            Section("Workout Details") {
                ForEach(0 ..< 10, id: \.self) { i in
                    VStack(alignment: .leading) {
                        Text("Exercise name")
                            .font(.title3)
                            .bold()
                        
                        Text("Reps - Volume")
                            .foregroundStyle(.gray)
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
