//
//  Groups.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
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
}

class Groups {
    private var groups : [Group] = []
    private var groupsJSON = Menu.groupsJSON

    init() {
        let groupsData = JSONParser(json: groupsJSON, withExtension: "json").data
        let groupsList = parseData(data: groupsData)

        for group in groupsList {
            let levels = Levels(parsedLevel: group.levels).getLevels()
            groups.append(Group(groupsParsed: group, levels: levels))
        }
    }

    private func parseData(data: Data?) -> [GroupsParsing] {
        guard let data = data else {
            return []
        }

        do {
            let parsedGroups = try JSONDecoder().decode([GroupsParsing].self, from: data)
            return parsedGroups
        } catch let error {
            print(error)
            return []
        }
    }

    func getGroups() -> [Group] {
        return groups
    }
}


