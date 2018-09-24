//
//  MainMenuModel.swift
//  NihonGame
//
//  Created by Nicolas on 13/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class ModeCreator {
    private var menuItems : [GameMode] = []
    private var gameModeDatas : [GameMode] = []

    init() {}

    func getModes() -> [GameMode]{
        menuItems.append(createModeData(modeName: "Kanji_Mode_Name".localize(), dataParser: KanjiData()))
        return menuItems
    }

    private func createModeData(modeName: String, dataParser: GameDataParser) -> GameMode{
        let gameDatas = dataParser.datas
        let groups = GroupCreator().createGroups(dataToSplit: gameDatas)
        return GameMode(gameModeName: modeName, gameDatas: gameDatas, gameModeGroups: groups)
    }

}
