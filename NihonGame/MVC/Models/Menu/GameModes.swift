//
//  GameModes.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class GameModes {
    private var gameModes : [GameMode] = []
    private let modesData : [ModeDatas] = [Kanjis()]
    var currentMode : GameMode?
    static let shared = GameModes()


    private init() {
        createModesList()
    }

    func createModesList() {
        gameModes = []
        for modeID in 0..<modesData.count {
            let modeDatas = modesData[modeID]
            if let gameModeInCoreData = getSavedProgression(forModeID: modeID), let _ = gameModeInCoreData.name{
                let gameMode = gameModeInCoreData
                gameMode.fill(modeData: modeDatas)
                gameModes.append(gameMode)
            }else {
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
