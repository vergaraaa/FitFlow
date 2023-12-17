//
//  VerticalProgressView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI

struct VerticalProgressView: View {
    let color: Color
    let previous: Double
    let current: Double
    let changedPercentage: Double
    
    let baseHeight = 70.0
    
    private var height: Double {
        if(current >= previous) {
            return baseHeight
        }
        
        return baseHeight * (abs(changedPercentage) / 100)
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.5))
                    .frame(width: 8, height: baseHeight)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .frame(width: 8, height: height)
            }
        }
        .frame(width: 10)
    }
}

#Preview {
    VerticalProgressView(color: .red, previous: 0, current: 0, changedPercentage: 0)
}
