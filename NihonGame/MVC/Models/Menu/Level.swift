//
//  Level.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class Level : NSManagedObject {
    var done = false
    
    func fill(parsedLevel level: LevelsParsing){
        self.id = level.id.int16
        self.name = "Level_String".localize() + ": \(level.startRange)-\(level.endRange)"
        self.firstElement = level.startRange.int16
        self.lastElement = level.endRange.int16
        self.done = false
        self.locked = (id == 1 && level.startRange == 1 ? false : true)
        self.score = 0.int64
        self.stars = 0.int16
    }

    func changeScore(increase: Bool) {
        if increase {
            score += GameConstant.scoreIncrementation.int64
        }else {
            if score != 0 {
                score -= GameConstant.scoreDecrementation.int64
            }
        }
    }

    func setGameDataToUse(gameDatas: [GameData]) -> [GameData]{
        var levelDatas : [GameData] = []

        if firstElement == lastElement {
            if let elementToAdd = gameDatas.dataAt(id: firstElement.int) {
                levelDatas.append(elementToAdd)
            }
        }else {
            if firstElement != 1{
                let randomKanjiID = Int.random(in: 1..<firstElement.int)
                if let elementToAdd = gameDatas.dataAt(id: randomKanjiID) {
                    levelDatas.append(elementToAdd)
                }
            }
            for elementID in firstElement.int...lastElement.int{
                if let elementToAdd = gameDatas.dataAt(id: elementID) {
                    levelDatas.append(elementToAdd)
                }
            }
        }
        return levelDatas
    }
}

