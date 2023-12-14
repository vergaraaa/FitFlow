//
//  VerticalProgressView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI

struct VerticalProgressView: View {
    let color: Color
    let total: Double
    let actual: Double
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.5))
                    .frame(width: 10, height: 70)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .frame(width: 10, height: 40)
            }
        }
        .frame(width: 10)
    }
}

#Preview {
    VerticalProgressView(color: .red, total: 0, actual: 0)
}
