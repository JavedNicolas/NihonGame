//
//  Group.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Group: GameDataGroup {
    var id : Int
    var name : String
    var elementRange : (Int, Int)
    var levels : [Level]
    var done : Bool
    var locked: Bool
    
    init(groupsParsed group: GroupsParsing, levels: [Level]) {
        self.name = "\(group.startRange)-\(group.endRange)"
        self.id = group.id
        self.elementRange = (group.startRange,group.endRange)
        self.levels = levels
        self.done = false
        self.locked = false
        setDoneAndLockLevel(levels: levels)
    }

    init(coreDataGroup group: CoreDataGroup, levels: [Level]) {
        self.name = "\(group.firstElement)-\(group.lastElement)"
        self.id = group.id.int
        self.elementRange = (group.firstElement.int,group.lastElement.int)
        self.levels = levels
        self.done = false
        self.locked = false
        setDoneAndLockLevel(levels: levels)
    }

    func setDoneAndLockLevel(levels: [Level]) {
        var numberOfLockedLevels = 0
        var numberOfDoneLevel = 0
        for level in levels {
            if level.locked {
                numberOfLockedLevels += 1
            }
            if level.score > 500 {
                numberOfDoneLevel += 1
            }
        }
        if numberOfLockedLevels == levels.count {
            self.locked = true
        }
        if numberOfDoneLevel == levels.count {
            self.done = true
        }
    }
}
