//
//  Group.swift
//  NihonGame
//
//  Created by Nicolas on 12/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct Group: GameDataGroup {
    var name : String
    var elementRange : (Int, Int)
    var levels : [Level]
    var done : Bool
    var locked: Bool

    init(groupName: String, groupElementRange: (Int,Int), levels: [Level], done: Bool = false, locked: Bool = true) {
        self.name = groupName
        self.elementRange = groupElementRange
        self.levels = levels
        self.done = done
        self.locked = locked
    }
}
