//
//  FitFlowApp.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 07/12/23.
//

import SwiftUI
import SwiftData
import TipKit


@main
struct FitFlowApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Workout.self,
            Exercise.self,
            Set.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    
    init() {
        do {
          try Tips.configure()
        } catch {
          print("Failed to configure TipKit: \(error)")
        }
      }
    

    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
        .modelContainer(sharedModelContainer)
    }
    
    
}
