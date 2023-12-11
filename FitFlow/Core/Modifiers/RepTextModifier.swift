//
//  RepTextModifier.swift
//  FitFlow
//
//  Created by Tlanetzi Chavez Madero on 07/12/23.
//

import SwiftUI

struct RepTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
    }
}
