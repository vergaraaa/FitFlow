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
        Text("Swipe right to record your sets faster!")
            .foregroundColor(.primary)
    }
    
    var options: [TipOption] {
        MaxDisplayCount(3)
    }
    
    var image: Image? {
        Image(systemName: "text.badge.plus")
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
        Text("Swipe right to duplicate your sets!")
            .foregroundColor(.primary)
    }
    
    var options: [TipOption] {
        MaxDisplayCount(3)
    }
    
    var image: Image? {
        Image(systemName: "repeat")
    }
    
    static let setsListViewDidOpen = Tips.Event(id: "setsListViewDidOpen")
    
    var rules: [Rule] {
        
        #Rule(DuplicateTip.setsListViewDidOpen) {
            $0.donations.count >= 1
        }
    }
}


struct EditTip: Tip {
    var title: Text {
        Text("Add or remove repetitions and weight")
            .foregroundColor(.blue)
    }
    
    var message: Text? {
        Text("Press buttons to add or remove the appropriate number of repetitions and kg")
            .foregroundColor(.primary)
    }
    
    var options: [TipOption] {
        MaxDisplayCount(5)
    }
    
    var image: Image? {
        Image(systemName: "plus.circle")
    }
    
    static let addSetViewDidOpen = Tips.Event(id: "addSetViewDidOpen")
    
    var rules: [Rule] {
        
        #Rule(EditTip.addSetViewDidOpen) {
            $0.donations.count >= 1
        }
    }
}
