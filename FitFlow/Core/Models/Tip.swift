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
    }
    
    var options: [TipOption] {
        MaxDisplayCount(3)
    }
    
}
