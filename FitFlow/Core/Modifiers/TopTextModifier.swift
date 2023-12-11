//
//  TopTextModifier.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 07/12/23.
//

import SwiftUI

struct TopTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.medium)
            .foregroundColor(.black)
            .padding(10)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}
