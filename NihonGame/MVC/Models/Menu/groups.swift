//
//  Groups.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Groups {
    private var groups : [Group] = []
    private var groupsJSON = ""

    init(json: String) {
        self.groupsJSON = json
        setGroups()
    }

    private func parseData(data: Data?) -> [GroupParsing] {
        guard let data = data else { return [] }

        do {
            return try JSONDecoder().decode([GroupParsing].self, from: data)
        } catch let error {
            print(error)
            return []
        }
    }

    private func setGroups() {
        let groupsData = JSONParser(json: groupsJSON, withExtension: "json").data
        let parsedGroups = parseData(data: groupsData)

        for (index, parsedGroup) in parsedGroups.enumerated() {
            let firstGroup = isFirstGroup(group: parsedGroup, groupList: parsedGroups)
            let levels = Levels(parsedLevels: parsedGroup.levels, isfirstGroup: firstGroup).getLevels()
            let groupToSet = Group(context: CoreDataManager.shared.getContext())
            let groupName = "Group_String".localize() + String(index + 1)
            groupToSet.fill(groupsParsed: parsedGroup, levels: levels, groupName: groupName)
            groups.append(groupToSet)
        }
    }

    func isFirstGroup(group: GroupParsing, groupList: [GroupParsing]) -> Bool {
        if let firstGroup = groupList.first {
            if group.id == firstGroup.id {
                return true
            }
        }
        return false
    }

    func getGroups() -> [Group] {
        return groups
    }
}


