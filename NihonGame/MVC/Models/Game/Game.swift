//
//  Game.swift
//  NihonGame
//
//  Created by Nicolas on 04/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Game {
    private var levelData : [GameData] = []
    private var currentQuestion : Question?

    init(currentModeID: Int, level: Level) {
        let modes = GameModes.shared.getGameModes()
        let modesDataConstructor = GameModes.shared.getModeData(id: currentModeID)
        let gameDatas = modes[currentModeID].modeData.getDatas()
        levelData = level.setGameDataToUse(gameDatas: gameDatas)
        guard let possibleAnswers = modesDataConstructor.answers else {
            self.currentQuestion = nil
            return
        }
        self.currentQuestion = Question(levelData: levelData, dataNames: modesDataConstructor.getDataNameAsArray(), AllAnswers: possibleAnswers)
    }
}
