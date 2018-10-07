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
    var modeData : ModeDataConstructor?

    func fill(gameModeName: String, gameModeID: Int, modeData: ModeDataConstructor, gameModeGroups: [Group]) {
        self.name = gameModeName
        self.modeData = modeData
        for group in gameModeGroups {
            group.parentGameMode = self
            self.addToGroups(group)
        }
        self.id = gameModeID.int16
    }
}

