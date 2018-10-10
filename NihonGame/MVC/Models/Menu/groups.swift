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
            let levels = Levels(parsedLevels: group.levels).getLevels()
            let groupToSet = Group(context: CoreDataManager.shared.getContext())
            groupToSet.fill(groupsParsed: group, levels: levels)
            groups.append(groupToSet)
        }
    }

    func getGroups() -> [Group] {
        return groups
    }
}


