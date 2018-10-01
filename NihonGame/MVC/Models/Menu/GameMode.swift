//
//  GameMode.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class GameMode {
    var name : String
    var id : Int
    var modeData : ModeDataConstructor
    var groups : [Group]

    init(gameModeName: String, gameModeID: Int, modeData: ModeDataConstructor, gameModeGroups: [Group]) {
        self.name = gameModeName
        self.modeData = modeData
        self.groups = gameModeGroups
        self.id = gameModeID
    }

}

