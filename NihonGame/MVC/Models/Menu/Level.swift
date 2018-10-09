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
    var newGameDataID : Int?
    lazy var newGameData: GameData? = self.setNewGameData()
    lazy var levelDatas : [GameData]? = self.setGameDataToUse()
    
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

    func setStars() {
        if self.score >= 500 {
            let starsScore = score - 500
            self.stars = Int16(starsScore.int / GameConstant.scoreByStar)
        }
    }

    func levelfinished() {
        unlockNextLevel()
        CoreDataManager.shared.saveContext()

    }

    /** Unlock the next level when */
    func unlockNextLevel() {
        guard let group = parentGroup, let levels = group.getLevels() else {
            return
        }

        for (index, level) in levels.enumerated() {
            if level == self {
                if level.score > 500 {
                    level.done = true
                    level.setStars()
                    if index != levels.count - 1 {
                        levels[index + 1].locked = false
                    }else {
                        group.unlockNextGroup(groupBefore: group)
                    }
                }
                break
            }
        }
    }

    private func setGameDataToUse() -> [GameData]?{
        var levelDatas = [GameData]()
        guard let group = parentGroup, let mode = group.parentGameMode, let gameDatas = mode.getDatas() else {
            return nil
        }

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

    private func setNewGameData() -> GameData? {
        if let gameDataID = newGameDataID {
            if let levelData = levelDatas {
                return levelData.dataAt(id: gameDataID)
            }
        }
        return nil
    }
}

