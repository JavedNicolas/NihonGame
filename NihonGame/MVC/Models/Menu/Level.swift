//
//  Level.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
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

    init(parsedLevel level: LevelsParsing){
        self.id = level.id
        self.name = "Level_String".localize() + ": \(level.startRange)-\(level.endRange)"
        self.elementRange = (level.startRange,level.endRange)
        self.done = false
        self.locked = (id == 1 && level.startRange == 1 ? false : true)
        self.score = 0
        self.stars = 0
    }

    init(coreDataLevel level: CoreDataLevel){
        self.id = level.id.int
        self.name = "\(level.firstElement)-\(level.lastElement)"
        self.elementRange = (level.firstElement.int ,level.lastElement.int)
        self.done = (level.levelScore < GameConstant.levelCompleteScore ? true : false)
        self.locked = level.locked
        self.score = level.levelScore.int
        self.stars = level.stars.int
    }

    func setGameDataToUse(gameDatas: [GameData]) -> [GameData]{
        var levelDatas : [GameData] = []
        let startElement = elementRange.0
        let endElement = elementRange.1

        if startElement == endElement {
            if let elementToAdd = gameDatas.dataAt(id: startElement) {
                levelDatas.append(elementToAdd)
            }
        }else {
            if startElement != 1{
                let randomKanjiID = Int.random(in: 1..<startElement)
                if let elementToAdd = gameDatas.dataAt(id: randomKanjiID) {
                    levelDatas.append(elementToAdd)
                }
            }
            for elementID in startElement...endElement {
                if let elementToAdd = gameDatas.dataAt(id: elementID) {
                    levelDatas.append(elementToAdd)
                }
            }
        }
        return levelDatas
    }
}

