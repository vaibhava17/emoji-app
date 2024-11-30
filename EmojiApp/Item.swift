//
//  Item.swift
//  EmojiApp
//
//  Created by Vaibhav Agarwal on 30/11/24.
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
