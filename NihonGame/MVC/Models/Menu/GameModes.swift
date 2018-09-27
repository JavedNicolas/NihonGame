//
//  GameModes.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct GameMode {
    var name : String
    var id : Int
    var gameDatas : [GameData]
    var groups : [Group]

    init(gameModeName: String, gameModeID: Int, gameDatas: [GameData], gameModeGroups: [Group]) {
        self.name = gameModeName
        self.gameDatas = gameDatas
        self.groups = gameModeGroups
        self.id = gameModeID
    }

}


class GameModes {
    private var gameModes : [GameMode] = []
    private var gameModeFile = MenuJSON.gameModesJSON
    private var modes : [GameMode] = []
    private let coreDataManager = CoreDataManager()

    init() {
        createModesList()
    }

    private func createModesList() {
        createKanjiMode()
    }

    private func createKanjiMode() {
        var kanjis : [Kanji] = []
        var groups : [Group] = []

        for modeID in 0...0 {
            if let progression = getSavedProgression(forModeID: modeID)  {
                kanjis = Kanjis().getKanjis()
                groups = Groups(coreDataGroups: progression.groups).getGroups()
            }else {
                kanjis = Kanjis().getKanjis()
                groups = Groups().getGroups()
            }
            gameModes.append(GameMode(gameModeName: "Kanji_Mode_Name".localize(), gameModeID: modeID, gameDatas: kanjis, gameModeGroups: groups))
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
