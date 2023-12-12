//
//  AddWorkoutView.swift
//  FitFlow
//
//  Created by Bisma Baig on 12/12/23.
//

import SwiftUI

struct AddWorkoutView: View {
    
    @State private var name = ""
    @State private var description = ""
    
    @Binding var showAddWorkoutSheet: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                // Image section
                Section {
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
                .listRowBackground(Color.clear)
                
                // Name Section
                Section {
                    TextField("Enter workout name", text: $name)
                } header: {
                    Text("Name")
                } footer: {
                    Text("Popular names can be: Workout Type, Day of the Week, Muscle Group.")
                }
                
                // Description Section
                Section {
                    TextField("Description", text: $description)
                } header: {
                    Text("Description")
                } footer: {
                    Text("Want to add some details? Go ahead!")
                }
            }
            .navigationTitle("Add Workout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        showAddWorkoutSheet.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        showAddWorkoutSheet.toggle()
                    }
                    .bold()
                }
            }
        }
        //        VStack {
        //            HStack {
        //                Button(action: {
        //
        //                }) {
        //                    Text("Cancel")
        //                        .foregroundColor(.blue)
        //                        .padding(.horizontal, 20)
        //                        .padding(.bottom, -10)
        //                }
        //                Spacer()
        //                Button(action: {
        //
        //                }) {
        //                    Text("Done")
        //                        .foregroundColor(.blue)
        //                        .padding(.horizontal, 20)
        //                        .padding(.top, 10)
        //                }
        //            }
        //            .padding()
        //
        //            Spacer()
        //
        //            // Add Workout Text
        //            Text("Add Workout")
        //                .font(.headline)
        //                .foregroundColor(.black)
        //                .padding(.top, -695)
        //            Spacer()
        //
        //            // Blue Circle
        //            Circle()
        //                .foregroundColor(.blue)
        //                .frame(width: 80, height: 80)
        //                .padding(.top, -650)
        //
        //            Spacer()
        //
        //            // Dumbbell Symbol with Increased Size
        //            Image(systemName: "dumbbell")
        //                .resizable()
        //                .aspectRatio(contentMode: .fit)
        //                .frame(width: 50, height: 50)
        //                .foregroundColor(.black)
        //                .padding(.top, -640)
        //
        //            Spacer()
        //
        //            // Heading and Text Box for NAME
        //            VStack(alignment: .leading, spacing: 10) {
        //                Text("NAME")
        //                    .font(.body)
        //                    .foregroundColor(.gray)
        //                    .padding(.bottom, 0)
        //
        //                TextField("Enter workout name", text: $workoutName)
        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
        //            }
        //            .padding(.horizontal, 20)
        //            .cornerRadius(5)
        //            .padding(.leading, 10)
        //            .padding(.top, -540)
        //
        //            Text("Popular names can be: Workout Type, Day of the Week, Muscle Group.")
        //                .font(.caption)
        //                .foregroundColor(.gray)
        //                .padding(.top, -470)
        //                .padding(.leading, -5)
        //
        //            Spacer()
        //
        //            // Heading and Text Box for DESCRIPTION
        //            VStack(alignment: .leading, spacing: 10) {
        //                Text("DESCRIPTION")
        //                    .font(.body)
        //                    .foregroundColor(.gray)
        //                    .padding(.bottom, 0)
        //
        //                TextField("Description", text: $workoutDescription)
        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
        //            }
        //            .padding(.horizontal, 20)
        //            .cornerRadius(5)
        //            .padding(.leading, 10)
        //            .padding(.top, -410)
        //
        //            Text("Want to add some details? Go ahead!")
        //                .font(.caption)
        //                .foregroundColor(.gray)
        //                .padding(.top, -340)
        //                .padding(.leading, -120)
        //        }
    }
}

#Preview {
    AddWorkoutView(showAddWorkoutSheet: .constant(false))
}
