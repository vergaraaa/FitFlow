//
//  Item.swift
//  FitFlow
//
//  Created by Edgar Ernesto Vergara Montiel on 07/12/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var name: String = ""
    var set: String = ""
//    var weight: Int = 0
    
    init(name: String, set: String) {
        self.name = name
        self.set = set
//        self.weight = weight
    }
}
