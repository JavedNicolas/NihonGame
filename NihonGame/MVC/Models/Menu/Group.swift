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

    /** fill the instance for the first int when CoreData is empty */
    func fill(groupsParsed group: GroupParsing, levels: [Level], groupName: String) {
        self.name = groupName
        self.id = group.id.int64
        self.firstElement = group.startRange.int64
        self.lastElement = group.endRange.int64
        setData(levels: levels)
        self.locked = false
        setDoneAndLock(levels: levels)
    }

    /** Set data that were not in CoreData */
    func setData(levels : [Level]) {
        for (index, level) in levels.enumerated() {
            level.parentGroup = self
            if index == 0 || level.lastElement != levels[index - 1].lastElement  {
                level.newGameDataID = level.lastElement.int
            }
            self.addToLevels(level)
        }
    }

    /** Unlock group based on locked levels */
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

    /** Unlock the next Group */
    func unlockNextGroup(groupBefore: Group) {
        guard let mode = self.parentGameMode, let groups = mode.getGroups() else {
            return
        }

        for (index, group) in groups.enumerated() {
            if group == groupBefore {
                if let levels = groups[index + 1].getLevels(), let levelToUnlock = levels.first {
                    levelToUnlock.locked = false
                }
                break
            }
        }
    }

    /** get formated Levels */
    func getLevels() -> [Level]? {
        if let nsLevel = levels?.allObjects, let levels = nsLevel as? [Level] {
            return levels.sorted(by: { $0.id < $1.id})
        }
        return nil
    }
}
