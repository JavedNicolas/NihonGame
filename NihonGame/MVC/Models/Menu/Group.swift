//
//  Group.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class Group: NSManagedObject {
    var done = false
    func fill(groupsParsed group: GroupsParsing, levels: [Level]) {
        self.name = "\(group.startRange)-\(group.endRange)"
        self.id = group.id.int16
        self.firstElement = group.startRange.int16
        self.lastElement = group.endRange.int16
        for level in levels {
            level.parentGroup = self
            self.addToLevels(level)
        }
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
