//
//  Item.swift
//  AppChat
//
//  Created by Jesús Navarro Antolin on 21/5/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
