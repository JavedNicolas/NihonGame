//
//  GameModes.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class GameMode {
    var gameModeName : String
    var gameDatas : [GameData]
    var gameModeGroups : [Group]

    init(gameModeName: String, gameDatas: [GameData], gameModeGroups: [Group]) {
        self.gameModeName = gameModeName
        self.gameDatas = gameDatas
        self.gameModeGroups = gameModeGroups
    }
}


class GameModes {
    private var gameModes : [GameMode] = []
    private var gameModeFile = Menu.gameModesJSON
    private var modes : [GameMode] = []

    init() {
        createModesList()
    }

    private func createModesList() {
        let kanjis = Kanjis().getKanjis()
        let groups = Groups().getGroups()
        print(kanjis)
        gameModes.append(GameMode(gameModeName: "Kanji_Mode_Name".localize(), gameDatas: kanjis, gameModeGroups: groups))
    }

    func getGameModes() -> [GameMode]{
        return gameModes
    }
}
