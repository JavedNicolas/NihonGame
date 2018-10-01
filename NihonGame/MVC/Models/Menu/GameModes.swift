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


    init() {
        createModesList()
    }

    private func createModesList() {
        createKanjiMode()
    }

    private func createKanjiMode() {
        var gameDatas : [GameData] = []
        var groups : [Group] = []

        for modeID in 0..<modesData.count {
//            if let progression = getSavedProgression(forModeID: modeID)  {
//                kanjis = Kanjis().getKanjis()
//                groups = Groups(coreDataGroups: progression.groups).getGroups()
//            }else {
                gameDatas = modesData[modeID].getDatas()
                let groupJSON = modesData[modeID].getGroupJSON()
                groups = Groups(json: groupJSON).getGroups()
//            }
            gameModes.append(GameMode(gameModeName: "Kanji_Mode_Name".localize(), gameModeID: modeID, gameDatas: gameDatas, gameModeGroups: groups))
        }
    }

    private func getSavedProgression(forModeID: Int) -> CoreDataGameMode? {
        let coreDataGameMode = coreDataManager.fetchMenu(modeID: forModeID)

        return coreDataGameMode
    }

    func getGameModes() -> [GameMode]{
        return gameModes
    }
}
