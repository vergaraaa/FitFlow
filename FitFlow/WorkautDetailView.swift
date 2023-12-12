//
//  WorkautDetailView.swift
//  FitFlow
//
//  Created by Margarita Mayer on 11/12/23.
//

import SwiftUI
import SwiftData

struct WorkautDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var currentFolderName: String = "New folder"
    @State private var newSet = ""
    @State private var newName = ""

    
    var body: some View {
        NavigationStack {
            
            Form {
                ForEach(items) { item in
                    
                    Section {
                        Text("\(item.name) \n \(item.set)")
                    }
                    .scenePadding(.minimum, edges: /*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                   
                }
                
                .onDelete(perform: deleteItems)
              
                
       
                
                
                HStack(){
                    TextField("Add a new exercise...", text: $newName)
                    
                    Button(action: addItem) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationBarTitle(currentFolderName, displayMode: .inline)
            
            
        }
        
    }
    
    
    func addItem() {
       
            withAnimation {
                let newItem = Item(name: newName, set: newSet)
                modelContext.insert(newItem)
                newName = ""
                newSet = ""
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}


#Preview {
    WorkautDetailView()
}
