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
        setDoneAndLock(levels: levels)
    }

    func setDoneAndLock(levels: [Level]) {
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

    func getLevels() -> [Level]? {
        if let nsLevel = levels?.allObjects, let levels = nsLevel as? [Level] {
            return levels.sorted(by: { $0.id < $1.id})
        }
        return nil
    }

    func unlockNextLevel(currentLevel: Level) {
        guard let levels = getLevels() else {
            return
        }

        for (index, level) in levels.enumerated() {
            if level == currentLevel {
                if level.score > 500 {
                    level.done = false
                    level.setStars()
                    if index != levels.count - 1 {
                        levels[index + 1].locked = false
                    }else {
                        if let mode = self.parentGameMode {
                            mode.unlockNextGroup(groupBefore: self)
                        }
                    }
                }else if index == 0, level.locked{
                    level.locked = false
                }
                break
            }
        }
    }
}
