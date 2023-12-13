//
//  AddSetView.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI

struct AddSetView: View {
    @Binding var exercise: Exercise?
    
    @State var reps: Int = 0
    @State var weight: Double = 0.0
    
    let repsIncrements: [Int] = [1, 5]
    let weightIncrements: [Double] = [0.1, 1, 5]
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Reps") {
                    HStack {
                        Spacer()
                        
                        Text("\(reps)")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.green)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("-")
                        
                        ForEach(repsIncrements.reversed(), id: \.self) { increment in
                            Button("\(increment)") {
                                if(reps - increment < 0) {
                                    reps = 0
                                }
                                else {
                                    reps -= increment
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .buttonStyle(BorderlessButtonStyle())
                            .background(.gray.opacity(0.25))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(Color.primary)
                        }
                        
                        Spacer()
                        
                        ForEach(repsIncrements, id: \.self) { increment in
                            Button("\(increment)") {
                                reps += increment
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .buttonStyle(BorderlessButtonStyle())
                            .background(.gray.opacity(0.25))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(Color.primary)
                        }
                        
                        Text("+")
                    }
                }
                
                Section("Weight") {
                    HStack {
                        Spacer()
                        
                        Text("\(Formatters.weightFormatter.string(from: NSNumber(value: weight)) ?? "") kg")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.orange)
                        
                        Spacer()
                    }
                    
                
                    HStack {
                        Text("-")
                        
                        ForEach(weightIncrements.reversed(), id: \.self) { increment in
                            Button("\(Formatters.weightFormatter.string(from: NSNumber(value: increment)) ?? "")") {
                                if(weight - increment < 0) {
                                    weight = 0
                                }
                                else {
                                    weight -= increment
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .buttonStyle(BorderlessButtonStyle())
                            .background(.gray.opacity(0.25))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(Color.primary)
                        }
                        
                        Spacer()
                        
                        ForEach(weightIncrements, id: \.self) { increment in
                            Button("\(Formatters.weightFormatter.string(from: NSNumber(value: increment)) ?? "")") {
                                weight += increment
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .buttonStyle(BorderlessButtonStyle())
                            .background(.gray.opacity(0.25))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(Color.primary)
                        }
                        
                        Text("+")
                    }
                }
                
                Button("Record") {
                    exercise = nil
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle(exercise?.name ?? "")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    @Environment(\.colorScheme) var colorScheme
    
    return AddSetView(
        exercise: .constant(Exercise(name: "", note: "", sets: [])),
        colorScheme: _colorScheme
    )
}