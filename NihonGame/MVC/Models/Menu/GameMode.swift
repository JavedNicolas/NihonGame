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
    var modeData : ModeDatas?
    var dataNames : [[String]] = []
    var possibleAnswers : PossibleAnswers?

    /** Fill GameMode for the first CoreData DataBase creation**/
    func fill(gameModeName: String, gameModeID: Int, modeData: ModeDatas, gameModeGroups: [Group]) {
        self.name = gameModeName
        self.modeData = modeData
        self.dataNames = modeData.dataNamesString
        for data in modeData.getDatas() {
            data.mode = self
            self.addToDatas(data)
        }
        for group in gameModeGroups {
            group.parentGameMode = self
            self.addToGroups(group)
        }
        self.id = gameModeID.int16
        self.possibleAnswers = createAnswer()
    }

    /** Fill GameMode with the non CoreData Datas */
    func fill(modeData: ModeDatas) {
        self.modeData = modeData
        self.dataNames = modeData.dataNamesString
        if let datas = getDatas() {
            for data in datas {
                let data = data
                data.createDataDictionary()
                addToDatas(data)
            }
        }
        self.possibleAnswers = createAnswer()
    }

    func getDatas() -> [GameData]?{
        if let nsDatas = datas, var datas = nsDatas.allObjects as? [GameData] {
            datas.sort(by: {$0.id < $1.id})
            return datas
        }
        return nil
    }

    func createAnswer() -> PossibleAnswers? {
        guard let data = getDatas() else{
            return nil
        }
        return PossibleAnswers(modeData: data, dataComponentsName: dataNames)
    }
}

