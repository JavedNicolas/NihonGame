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
    private let coreDataManager = CoreDataManager()
    private let modesData : [ModeDataConstructor] = [Kanjis()]
    static let shared = GameModes()

    private init() {
        createModesList()
    }

    private func createModesList() {
        var groups : [Group] = []

        for modeID in 0..<modesData.count {
//            if let gameModeInCoreData = getSavedProgression(forModeID: modeID), let _ = gameModeInCoreData.name{
//                let gameMode = GameMode(coreDataGameMode: gameModeInCoreData, modeData: modesData[modeID])
//                gameModes.append(gameMode)
//            }else {
                let groupJSON = modesData[modeID].getGroupJSON()
                groups = Groups(json: groupJSON).getGroups()
                let gameMode = GameMode(gameModeName: modesData[modeID].name, gameModeID: modeID, modeData: modesData[modeID], gameModeGroups: groups)
                gameModes.append(gameMode)
                coreDataManager.saveProgression(gameMode: gameModes[modeID])
//            }
        }
    }

    private func getSavedProgression(forModeID: Int) -> CoreDataGameMode? {
        let coreDataGameMode = coreDataManager.fetchMenu(modeID: forModeID)
        return coreDataGameMode
    }

    func getModeData(id: Int) -> ModeDataConstructor {
        return modesData[id]
    }

    func getGameModes() -> [GameMode]{
        return gameModes
    }
}
