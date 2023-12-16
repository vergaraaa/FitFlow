//
//  WorkoutRowView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 11/12/23.
//

import SwiftUI

struct WorkoutRowView: View {
    let name: String
    
    var body: some View {
        HStack {
            Image(systemName: "dumbbell")
                .foregroundStyle(.blue)
            
            Text(name)
        }
    }
}

#Preview {
    WorkoutRowView(name: "Leg day")
}
