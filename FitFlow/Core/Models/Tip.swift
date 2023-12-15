//
//  Tip.swift
//  FitFlow
//
//  Created by Margarita Mayer on 14/12/23.
//

import Foundation
import SwiftUI
import TipKit

struct RecordTip: Tip {
    
    var title: Text {
        Text("Record sets")
            .foregroundColor(.blue)
    }
   
    var message: Text? {
        Text("Swipe right to record your sets")
            .foregroundColor(.primary)
    }
    
    var options: [TipOption] {
        MaxDisplayCount(3)
    }
    
    static let workoutDetailViewDidOpen = Tips.Event(id: "workoutDetailViewDidOpen")
    
    var rules: [Rule] {
            
            #Rule(RecordTip.workoutDetailViewDidOpen) {
                $0.donations.count >= 1
            }
        }
    
}


struct DuplicateTip: Tip {
    
    var title: Text {
        Text("Duplicate sets")
            .foregroundColor(.blue)
    }
   
    var message: Text? {
        Text("Swipe right to duplicate your sets")
            .foregroundColor(.primary)
    }
    
    var options: [TipOption] {
        MaxDisplayCount(3)
    }
    
    static let setsListViewDidOpen = Tips.Event(id: "setsListViewDidOpen")
    
    var rules: [Rule] {
            
            #Rule(DuplicateTip.setsListViewDidOpen) {
                $0.donations.count >= 1
            }
        }
    
}
