//
//  MainMenuModel.swift
//  NihonGame
//
//  Created by Nicolas on 13/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

enum GameModeNames : String {
    case Kanji
}

class ModeCreator {
    private var menuItems : [GameMode] = []
    private var gameModeDatas : [GameMode] = []
    private var coreDataManager = CoreDataManager()

    init() {}

    func getModes() -> [GameMode]{
        return []
//        menuItems.append(createModeData(modeName: "Kanji_Mode_Name".localize(), dataParser: KanjiData(), id: 0))
//        return menuItems
    }
//
//    private func createModeData(modeName: String, dataParser: GameDataParser, id: Int) -> GameMode{
//        let gameDatas = dataParser.datas
//        let groups = GroupCreator().createGroups(dataToSplit: gameDatas)
//        createCoreDataGameMode(id: id, name: modeName)
//        return GameMode(gameModeName: modeName, gameDatas: gameDatas, gameModeGroups: groups)
//    }
//
//    private func createCoreDataGameMode(id: Int, name: String) {
//        coreDataManager.saveProgression(gameMode: (name, id))
//    }
}
