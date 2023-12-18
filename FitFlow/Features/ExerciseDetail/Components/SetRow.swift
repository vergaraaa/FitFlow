//
//  SetRow.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 13/12/23.
//

import SwiftUI

struct SetRow: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    var set: Set
    
    var body: some View {
        if dynamicTypeSize >= .accessibility3{
            HStack {
                Text("\(Formatters.hourFromDate.string(from: set.date))")
                
                Spacer()
                
                VStack{
                    Group {
                        Text("\(set.reps)")
                            .bold()
                            .font(.title3)
                        +
                        Text(" rep")
                    }
                    .foregroundStyle(.green)
                    
                    
                    Group {
                        Text("\(Formatters.decimal.string(from: NSNumber(value: set.weight)) ?? "")")
                            .bold()
                            .font(.title3)
                        +
                        Text(" kg")
                    }
                    .foregroundStyle(.orange)
                }
            }
        }
        else{
            HStack {
                Text("\(Formatters.hourFromDate.string(from: set.date))")
                
                Spacer()
                
                Group {
                    Text("\(set.reps)")
                        .bold()
                        .font(.title3)
                    +
                    Text(" rep")
                }
                .foregroundStyle(.green)
                .padding(.horizontal)
                
                Group {
                    Text("\(Formatters.decimal.string(from: NSNumber(value: set.weight)) ?? "")")
                        .bold()
                        .font(.title3)
                    +
                    Text(" kg")
                }
                .foregroundStyle(.orange)
            }
        }
    }
}

#Preview {
    SetRow(set: Set(reps: 0, weight: 0, date: Date()))
}
