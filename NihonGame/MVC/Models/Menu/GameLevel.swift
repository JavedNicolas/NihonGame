//
//  Level.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class GameLevel : NSManagedObject, Level {
    // MARK:- Attributs
    var newGameDataID : Int?
    /** The game Data that is introduced in this level */
    lazy var newGameData: GameData? = self.setNewGameData()
    /** The datas which will be used to constitue the level questions */
    lazy var levelDatas : [GameData] = self.setGameDataToUse()
    let questionToAsk: Int = GameConstant.questionsByLevel

    // MARK:- functions
    /**
     Fill the level
     - Parameters:
         - level : the level parsed in the JSON
         - firstLevel: true if the level is the first one
         - levelName: The name of the level
     */
    func fill(parsedLevel level: LevelParsing, firstLevel: Bool, levelNumber: Int){
        self.id = level.id.int64
        self.name = "Level_String".localize()  + String(levelNumber)
        self.levelNumber = levelNumber.int64
        self.firstElement = level.startRange.int64
        self.lastElement = level.endRange.int64
        self.done = false
        self.bestScore = 0
        self.locked = !firstLevel
        self.score = 0.int64
        self.stars = 0.int16
    }

    /** set level's stars base on the end level score */
    func setStars() {
        if self.score > self.bestScore {
            let starsScore = score - 500
            self.stars = Int16(starsScore.int / GameConstant.scoreByStar) + 1
            if self.stars > 3 {
                self.stars = 3
            }
        }
    }

    /** is called when the level if finished */
    func levelFinished() {
        unlockNextLevel()
        CoreDataManager.shared.saveContext()
    }

    /** Unlock the next level when the user made a score greater or equal to the score to complete the level */
    func unlockNextLevel() {
        guard let group = parentGroup, let levels = group.getLevels(), let levelIndex = levels.firstIndex(of: self) else {
            return
        }

        if score >= GameConstant.levelCompleteScore {
            setStars()
            done = true
            if bestScore < GameConstant.levelCompleteScore {
                if levelIndex != levels.count - 1 {
                    levels[levelIndex + 1].locked = false
                }else {
                    group.unlockNextGroup(groupBefore: group)
                }
            }
        }
        if score > bestScore {
            self.bestScore = score
        }

    }

    /**
     Get the game Data that will be used in the level based on the id of the first and last element

     - returns: An array of the game data
     */
    private func setGameDataToUse() -> [GameData]{
        var levelDatas = [GameData]()
        guard let group = parentGroup, let mode = group.parentGameMode else {
            return []
        }
        let gameDatas = mode.getDatas()
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

    /**
     Return the game Data for the last element 
     */
    private func setNewGameData() -> GameData? {
        if let gameDataID = newGameDataID {
            return levelDatas.dataAt(id: gameDataID)
        }
        return nil
    }
}
