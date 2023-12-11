//
//  StatsVStack.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 11/12/23.
//

import SwiftUI

struct StatsVStack: View {
    let name: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
            
            Text(value)
                .foregroundStyle(color)
                .font(.title2)
                .bold()
        }
    }
}

#Preview {
    StatsVStack(name: "Reps", value: "22", color: .green)
}
