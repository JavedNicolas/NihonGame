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
    // MARK:- Functions
    /**
     Fill the instance for the first int when CoreData is empty.
     - Parameters:
         - group: the parsed data
         - levels : an array of the group's levels
         - groupName: the group name
     */
    func fill(groupsParsed group: GroupParsing, levels: [Level], groupNumber: Int) {
        self.name = "Group_String".localize() + String(groupNumber)
        self.groupNumber = groupNumber.int64
        self.isFirstLevel = (groupNumber == 1 ? true : false )
        self.id = group.id.int64
        self.firstElement = group.startRange.int64
        self.lastElement = group.endRange.int64
        setData(levels: levels)
        self.locked = false
        setDoneAndLock(levels: levels)
    }

    /**
     Set the level
     */
    func setData(levels : [Level]) {
        for (index, level) in levels.enumerated() {
            level.parentGroup = self
            // Set the newGameDataID if the last element is a new one
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
        self.locked = ( numberOfLockedLevels == levels.count ? true : false )
        self.done = (numberOfDoneLevel == levels.count ? true : false)
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
