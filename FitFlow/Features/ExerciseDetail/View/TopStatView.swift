//
//  TopStatView.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 07/12/23.
//

import SwiftUI

struct TopStatView: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .center) {
                Text("Top Rep")
                    .modifier(TopTextModifier())
                
                Text("12")
                    .font(.title2)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            Divider()
                .background(.gray)
                .frame(height: 100)
            
            VStack(alignment: .center){
                Text("Top Weight")
                    .modifier(TopTextModifier())
                
                Text("120 KG")
                    .font(.title2)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    TopStatView()
}
