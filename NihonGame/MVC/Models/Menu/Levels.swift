//
//  Levels.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct Level : GameDataGroup {
    var id : Int
    var name : String
    var elementRange : (Int, Int)
    var done : Bool
    var locked: Bool
    var score: Int
    var stars: Int

    init(id: Int, groupName: String, groupElementRange: (Int,Int), done: Bool = false, locked: Bool = true,
         score: Int = 0, stars: Int = 0) {
        self.id = id
        self.name = groupName
        self.elementRange = groupElementRange
        self.done = done
        self.locked = locked
        self.score = score
        self.stars = stars
    }

    init(parsedLevel level: LevelsParsing){
        self.id = level.id
        self.name = "\(level.startRange)-\(level.endRange)"
        self.elementRange = (level.startRange,level.endRange)
        self.done = false
        self.locked = false
        self.score = 0
        self.stars = 0
    }

    init(coreDataLevel level: CoreDataLevel){
        self.id = level.id.int
        self.name = "\(level.firstElement)-\(level.lastElement)"
        self.elementRange = (level.firstElement.int ,level.lastElement.int)
        self.done = false
        self.locked = true
        self.score = level.levelScore.int
        self.stars = level.stars.int
    }
}


class Levels {
    private var levels : [Level] = []
    private var levelsList = MenuJSON.levelsJSON

    init(parsedLevel: [LevelsParsing]){
        setLevels(parsedLevel: parsedLevel)
    }

    init(coreDataLevels: NSSet?) {
        setLevels(coreDataLevels: coreDataLevels)
    }

    private func setLevels(parsedLevel: [LevelsParsing]) {
        for level in parsedLevel {
            levels.append(Level(parsedLevel: level))
        }
    }

    private func setLevels(coreDataLevels: NSSet?) {
        guard let coreDataLevels = coreDataLevels else {
            return
        }

        for element in coreDataLevels.enumerated() {
            if let level = element.element as? CoreDataLevel {
                levels.append(Level(coreDataLevel: level))
            }
        }
    }

    func getLevels() -> [Level] {
        return levels
    }
}
