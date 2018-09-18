//
//  GameDataGroupCreator.swift
//  NihonGame
//
//  Created by Nicolas on 18/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class GameDataGroupCreator {
    init(){}

    func createGroups(dataToSplit data: [GameData], groupName: [String]) -> [Group]{
        var groups = [Group]()
        var groupLastElement = [Int]()

        for _ in groupName {
            groupLastElement.append(0)
        }

        for (index, gameData) in data.enumerated() {
            if let groupIndex = groupName.index(of: gameData.groupName) {
                groupLastElement[groupIndex] = index
            }
        }

        for (index, name) in groupName.enumerated() {
            var firstElement = 0
            if groups.count != 0 {
                firstElement = groups[index-1].groupElementRange.1 + 1
            }
            let group = Group(name: name, range: (firstElement, groupLastElement[index]))
            groups.append(group)
        }

        return groups
    }

    func createGroups(dataToSplit data: [GameData]) -> [Level]{
        var levels = [Level]()
        let elementsCount = data.count
        let groupSize = elementsCount / 10
        var level = Level(name: "0-\(groupSize)", range: (0,groupSize))
        for (index, _) in data.enumerated() {
            if index % groupSize == 0 {
                let endRange = groupSize + index
                level = Level(name: "\(index)-\(endRange)", range: (index,endRange))
                levels.append(level)
            }else {
                // TODO
            }
        }
        return levels
    }
}
