//
//  ExerciseImage.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 20/12/23.
//

import SwiftUI

struct ExerciseImage: View {
    var body: some View {
        Image(systemName: "figure.strengthtraining.traditional")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .padding()
            .background {
                Circle()
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity)
    }
    
}

#Preview {
    ExerciseImage()
}
