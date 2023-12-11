//
//  ExerciseDetailView.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 07/12/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            // Header
            Text("Pull-up")
                .font(.title)
                .padding(.top, 40)
                
            // StatComponent
            TopStatView()
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.9)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            RepsListView()
                
                
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1).ignoresSafeArea())
    }
}

#Preview {
    ExerciseDetailView()
        .ignoresSafeArea()
}
