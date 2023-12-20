//
//  WorkoutImage.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 20/12/23.
//

import SwiftUI

struct WorkoutImage: View {
    var body: some View {
        Image(systemName: "dumbbell")
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
    WorkoutImage()
}
