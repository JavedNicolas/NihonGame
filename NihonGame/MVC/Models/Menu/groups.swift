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

        for element in coreDataGroups.allObjects {
            if let group = element as? CoreDataGroup {
                group.fetchLevels(forGroupID: group.id)
                let levels = Levels(coreDataLevels: group.levels).getLevels()
                self.groups.append(Group(coreDataGroup: group, levels: levels))
            }
        }

        self.groups.sort(by: { $0.id < $1.id })
    }

    func getGroups() -> [Group] {
        return groups
    }
}


