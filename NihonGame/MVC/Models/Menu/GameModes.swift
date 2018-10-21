//
//  GameModes.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class GameModes {
    // MARK:- Attributs
    private var gameModes : [GameMode] = []
    private var modesData : [ModeDatas] = []
    var currentMode : GameMode?
    static let shared = GameModes()

    // MARK:- inits
    private init() {
        creatModes()
    }

    /** create the game modes for the main menu */
    func creatModes() {
        gameModes = []
        modesData = [Hiragana(), Katakana(), Kanjis()]
        createModesList()
    }

    /** create the modes */
    private func createModesList() {
        for modeID in 0..<modesData.count {
            let modeDatas = modesData[modeID]
            if let gameModeInCoreData = getSavedProgression(forModeID: modeID), let _ = gameModeInCoreData.name{
                // Fill data with core data content
                let gameMode = gameModeInCoreData
                gameMode.fill(modeData: modeDatas)
                gameModes.append(gameMode)
            }else {
                // Create data from JSON
                modeDatas.parseGameData()
                let groupJSON = modeDatas.getGroupJSON()
                let groups = Groups(json: groupJSON).getGroups()
                let gameMode = GameMode(context: CoreDataManager.shared.getContext())
                gameMode.fill(gameModeName: modeDatas.name, gameModeID: modeID, modeData: modeDatas, gameModeGroups: groups)
                gameModes.append(gameMode)
                CoreDataManager.shared.saveContext()
            }
        }
    }

    /**
     Get the mode in core Data

     - Parameters:
        - forModeID : for this mode id

     - returns: return a gameMode if the mode existe in core data, else return nil
     */
    private func getSavedProgression(forModeID: Int) -> GameMode? {
        let coreDataGameMode = CoreDataManager.shared.fetchMenu(modeID: forModeID)
        return coreDataGameMode
    }

    func getCurrentMode() -> GameMode? {
        return currentMode
    }

    func getGameModes() -> [GameMode]{
        return gameModes
    }
}
