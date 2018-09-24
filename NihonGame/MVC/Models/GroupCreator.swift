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

    func createGroups(dataToSplit data: [GameData]) -> [Group]{
        var groups = [Group]()
        let elementsCount = data.count
        let groupSize = 10
        let firstElementIndex = 1
        let numberOfGroup : Int = elementsCount / groupSize
        var group = Group(groupName: "0-0", groupElementRange: (0,0), levels: [])
        for index in 0...(numberOfGroup - 1){
            let locked = index == 0 ? false : true
            let startRange = (index * groupSize) + firstElementIndex
            let endRange = (index == numberOfGroup - 1 ? elementsCount - 1 : groupSize + startRange - 1)
            let levels = createGroups(rangetosplit: (startRange, endRange), groupIndex: index)
            group = Group(groupName: "\("Kanji_Mode_Name".localize()) \(startRange)-\(endRange)", groupElementRange: (startRange,endRange),
                          levels : levels, locked: locked)
            groups.append(group)
        }
        return groups
    }

    func createGroups(rangetosplit data: (Int,Int), groupIndex: Int) -> [Level]{
        var levels = [Level]()
        // Element to calcule the level range of GameData Elements
        let numberOfLevelToNewKanji = 2
        let elementsCount = data.1 - data.0
        let firstElement = data.0
        let groupSize = 1
        let numberOfGroup : Int = elementsCount / groupSize
        var level = Level(groupName: "", groupElementRange: (0,0))

        //
        for index in 1...((numberOfGroup * numberOfLevelToNewKanji)){
            let locked = index == 1 ? false : true
            let startRange = (index + firstElement - 1)  - (index / numberOfLevelToNewKanji)
            let endRange = startRange + (index == 1 ? 0 : 1)
            level = Level(groupName: "\("Level_String".localize()) \(index)",
                groupElementRange: (startRange,endRange), locked: locked)
            levels.append(level)

        }
        return levels
    }
}
