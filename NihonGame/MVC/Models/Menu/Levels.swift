//
//  Levels.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Levels {
    // MARK:- Attributs
    private var levels : [Level] = []

    // MARK:- init
    init(parsedLevels: [LevelParsing], isfirstGroup: Bool){
        setLevels(parsedLevels: parsedLevels, isfirstGroup: isfirstGroup)
    }

    // MARK:- functions
    /**
     Set levels based on parsed levels from JSON
     - Parameters:
        - parsedLevels : level from the JSON
        - isfirGroup : indicate if this is the first group of the mode
     */
    private func setLevels(parsedLevels: [LevelParsing], isfirstGroup: Bool)  {
        for (index, parsedlevel) in parsedLevels.enumerated() {
            let firstLevel = isFirstLevel(level: parsedlevel, levelList: parsedLevels) && isfirstGroup
            let level = Level(context: CoreDataManager.shared.getContext())
            let levelName = "Level_String".localize()  + String(index + 1)
            level.fill(parsedLevel: parsedlevel, firstLevel: firstLevel, levelName: levelName )
            levels.append(level)
        }
    }

    /**
     Return true if the level is the first

     - Parameters:
     - level: the level we are checking
     - levelList : the level list to compare

     - returns: true if it's the first level, false if not
     */
    func isFirstLevel(level: LevelParsing, levelList: [LevelParsing]) -> Bool {
        if let firstLevel = levelList.first {
            if firstLevel.id == level.id {
                return true
            }
        }
        return false
    }

    func getLevels() -> [Level] {
        return levels
    }
}
