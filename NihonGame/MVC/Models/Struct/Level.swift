//
//  Level.swift
//  NihonGame
//
//  Created by Nicolas on 18/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct Level : GameDataGroup {
    var id : String
    var name : String
    var elementRange : (Int, Int)
    var done : Bool
    var locked: Bool
    var score: Int
    var stars: Int

    init(id: String = "", groupName: String, groupElementRange: (Int,Int), done: Bool = false, locked: Bool = true,
         score: Int = 0, stars: Int = 0) {
        self.id = "\(groupElementRange.0)-\(groupElementRange.1)"
        self.name = groupName
        self.elementRange = groupElementRange
        self.done = done
        self.locked = locked
        self.score = score
        self.stars = stars
    }
}
