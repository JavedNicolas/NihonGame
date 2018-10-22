//
//  Groups.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Groups {
    // MARK:- Attributs
    private var groups : [Group] = []
    private var groupsJSON = ""

    // MARK:- init
    init(json: String) {
        self.groupsJSON = json
        setGroups()
    }

    // MARK:- Function
    /**
     Parse group data

     - Parameters:
        - data : the data parsed by the JSON Parser

     - returns: return an array of GroupParsing
     */
    private func parseData(data: Data?) -> [GroupParsing] {
        guard let data = data else { return [] }

        do {
            return try JSONDecoder().decode([GroupParsing].self, from: data)
        } catch let error {
            print(error)
            return []
        }
    }

    /**
     Set the groups by parsing the JSON group file and the data returned par JSONParser
     */
    private func setGroups() {
        let groupsData = JSONParser(json: groupsJSON, withExtension: "json").data
        let parsedGroups = parseData(data: groupsData)

        for (index, parsedGroup) in parsedGroups.enumerated() {
            let firstGroup = isFirstGroup(group: parsedGroup, groupList: parsedGroups)
            let levels = Levels(parsedLevels: parsedGroup.levels, isfirstGroup: firstGroup).getLevels()
            let groupToSet = Group(context: CoreDataManager.shared.getContext())
            groupToSet.fill(groupsParsed: parsedGroup, levels: levels, groupNumber: index + 1)
            groups.append(groupToSet)
        }
    }

    /**
        Return true if the group is the first

        - Parameters:
            - group: the group we are checking
            - groupList : the group list to compare

        - returns: true if it's the first group, false if not
     */
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


