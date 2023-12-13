//
//  SetRow.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI

struct SetRow: View {
    var body: some View {
        HStack {
            Text("14:57")
            
            Spacer()
            
            Group {
                Text("6")
                    .bold()
                    .font(.title3)
                +
                Text(" rep")
            }
            .foregroundStyle(.green)
            .padding(.horizontal)
            
            Group {
                Text("10")
                    .bold()
                    .font(.title3)
                +
                Text(" kg")
            }
            .foregroundStyle(.orange)
        }
    }
}

#Preview {
    SetRow()
}
