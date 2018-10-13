//
//  Levels.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Levels {
    private var levels : [Level] = []

    init(parsedLevels: [LevelParsing], isfirstGroup: Bool){
        setLevels(parsedLevels: parsedLevels, isfirstGroup: isfirstGroup)
    }
    
    private func setLevels(parsedLevels: [LevelParsing], isfirstGroup: Bool)  {
        for parsedlevel in parsedLevels {
            let firstLevel = isFirstLevel(level: parsedlevel, levelList: parsedLevels) && isfirstGroup
            let level = Level(context: CoreDataManager.shared.getContext())
            level.fill(parsedLevel: parsedlevel, firstLevel: firstLevel)
            levels.append(level)
        }
    }

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
