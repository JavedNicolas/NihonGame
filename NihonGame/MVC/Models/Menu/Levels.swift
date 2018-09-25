//
//  Levels.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Level : GameDataGroup {
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

    init(parsedLevel levels: LevelsParsing){
        self.id = levels.id
        self.name = "\(levels.startRange)-\(levels.endRange)"
        self.elementRange = (levels.startRange,levels.endRange)
        self.done = false
        self.locked = false
        self.score = 0
        self.stars = 0
    }
}


class Levels {
    private var levels : [Level] = []
    private var levelsList = Menu.levelsJSON

    init(parsedLevel: [LevelsParsing]){

        for level in parsedLevel {
            levels.append(Level(parsedLevel: level))
        }
    }

    func getLevels() -> [Level] {
        return levels
    }
}
