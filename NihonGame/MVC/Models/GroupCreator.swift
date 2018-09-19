//
//  GameDataGroupCreator.swift
//  NihonGame
//
//  Created by Nicolas on 18/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class GroupCreator {
    init(){}

    func createGroups(dataToSplit data: [GameData], groupName: [String]) -> [Group]{
        var groups = [Group]()
        var groupLastElement = [Int]()

        for _ in groupName {
            groupLastElement.append(0)
        }

        for (index, gameData) in data.enumerated() {
            if let groupIndex = groupName.index(of: gameData.groupName) {
                groupLastElement[groupIndex] = index + 1
            }
        }

        for (index, name) in groupName.enumerated() {
            var firstElement = 1
            if groups.count != 0 {
                firstElement = groups[index-1].groupElementRange.1 + 1
            }
            let range = (firstElement, groupLastElement[index])
            let levelForThisGroup = createGroups(rangetosplit: range)
            let group = Group(groupName: name, groupElementRange: range, levels: levelForThisGroup)
            groups.append(group)
        }

        return groups
    }

    func createGroups(rangetosplit data: (Int,Int)) -> [Level]{
        var levels = [Level]()
        let elementsCount = data.1 - data.0
        let groupSize = 9
        let firstElementIndex = data.0
        let numberOfGroup : Int = elementsCount / groupSize
        var level = Level(groupName: "0-0", groupElementRange: (0,0))
        for index in 0...(numberOfGroup - 1){
            let startRange = (index * groupSize) + firstElementIndex + (index == 0 ? 0 : index)
            let endRange = startRange + (index == numberOfGroup - 1 ? data.1 - startRange : groupSize)
            level = Level(groupName: "\(startRange)-\(endRange)", groupElementRange: (startRange,endRange))
            levels.append(level)

        }
        return levels
    }
}
