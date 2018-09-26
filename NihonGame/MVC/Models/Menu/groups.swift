//
//  Groups.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct Group: GameDataGroup {
    var id : Int
    var name : String
    var elementRange : (Int, Int)
    var levels : [Level]
    var done : Bool
    var locked: Bool

    init(id: Int, groupName: String, groupElementRange: (Int,Int), levels: [Level], done: Bool = false, locked: Bool = true) {
        self.id = id
        self.name = groupName
        self.elementRange = groupElementRange
        self.levels = levels
        self.done = done
        self.locked = locked
    }

    init(groupsParsed group: GroupsParsing, levels: [Level]) {
        self.name = "\(group.startRange)-\(group.endRange)"
        self.id = group.id
        self.elementRange = (group.startRange,group.endRange)
        self.levels = levels
        self.done = false
        self.locked = false
    }

    init(coreDataGroup group: CoreDataGroup, levels: [Level]) {
        self.name = "\(group.firstElement)-\(group.lastElement)"
        self.id = group.id.int
        self.elementRange = (group.firstElement.int,group.lastElement.int)
        self.levels = levels
        self.done = false
        self.locked = false
        var numberOfLockedLevels = 0
        for level in levels {
            if level.locked {
                numberOfLockedLevels = numberOfLockedLevels + 1
            }
        }
        if numberOfLockedLevels == levels.count {
            self.locked = true
        }

    }
}

class Groups {
    private var groups : [Group] = []
    private var groupsJSON = MenuJSON.groupsJSON

    init() {
        setGroups()
    }

    init(coreDataGroups: NSSet?) {
        setGroup(coreDataGroups: coreDataGroups)
    }

    private func parseData(data: Data?) -> [GroupsParsing] {
        guard let data = data else { return [] }

        do {
            return try JSONDecoder().decode([GroupsParsing].self, from: data)
        } catch let error {
            print(error)
            return []
        }
    }

    private func setGroups() {
        let groupsData = JSONParser(json: groupsJSON, withExtension: "json").data
        let groupsList = parseData(data: groupsData)

        for group in groupsList {
            let levels = Levels(parsedLevel: group.levels).getLevels()
            groups.append(Group(groupsParsed: group, levels: levels))
        }
    }

    private func setGroup(coreDataGroups: NSSet?) {
        guard let coreDataGroups = coreDataGroups else {
            return
        }

        for element in coreDataGroups.enumerated() {
            if let group = element.element as? CoreDataGroup {
                let levels = Levels(coreDataLevels: group.levels).getLevels()
                groups.append(Group(coreDataGroup: group, levels: levels))
            }
        }

        groups.sort(by: { $0.id < $1.id })
    }

    func getGroups() -> [Group] {
        return groups
    }
}


