//
//  GameMode.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class GameMode : NSManagedObject {
    // MARK:- Attributs
    var modeData : ModeDatas?
    var dataNames = [[String]]()
    var possibleAnswers : PossibleAnswers?

    // MARK:- functions
    /** Fill GameMode for the first CoreData DataBase creation**/
    func fill(gameModeName: String, gameModeID: Int, modeData: ModeDatas, gameModeGroups: [Group]) {
        self.name = gameModeName
        self.modeData = modeData
        self.dataNames = modeData.dataNames
        for data in modeData.getDatas() {
            data.mode = self
            data.dataNameOrder = modeData.dataNameOrder
            self.addToDatas(data)
        }
        for group in gameModeGroups {
            group.parentGameMode = self
            self.addToGroups(group)
        }
        self.id = gameModeID.int16
        self.possibleAnswers = createAnswer()
    }

    /** Fill GameMode with every that must be calculated because it's not in the core data
     bdd. */
    func fill(modeData: ModeDatas) {
        self.modeData = modeData
        self.dataNames = modeData.dataNames
        if let datas = getDatas() {
            for data in datas {
                let data = data
                data.dataNameOrder = modeData.dataNameOrder
                self.addToDatas(data)
            }
        }
        if let groups = getGroups() {
            for group in groups {
                if let groupLevel = group.getLevels() {
                    group.setData(levels: groupLevel)
                }
            }
        }
        self.possibleAnswers = createAnswer()
    }

    /** return formated gameData of the mode */
    func getDatas() -> [GameData]?{
        if let nsDatas = datas, var datas = nsDatas.allObjects as? [GameData] {
            datas.sort(by: {$0.id < $1.id})
            return datas
        }
        return nil
    }

    /** return formated groups */
    func getGroups() -> [Group]? {
        if let nsGroups = groups, let groups = nsGroups.allObjects as? [Group] {
            return groups.sorted(by: { $0.id < $1.id})
        }
        return nil
    }

    /** Create the array with all the possible Answer */
    func createAnswer() -> PossibleAnswers? {
        guard let data = getDatas() else{
            return nil
        }
        return PossibleAnswers(modeDatas: data, dataComponentsName: dataNames)
    }
}

