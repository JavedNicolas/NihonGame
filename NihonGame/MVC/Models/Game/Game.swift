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
        let gameDatas = modes[currentModeID].modeData!.getDatas()
        levelData = level.setGameDataToUse(gameDatas: gameDatas)
        guard let possibleAnswers = modesDataConstructor.answers else {
            self.currentQuestion = nil
            return
        }
        self.currentQuestion = Question(levelData: levelData, dataNames: modesDataConstructor.getDataNameAsArray(), AllAnswers: possibleAnswers)
    }

    func isCorrectAnswer(answer: Answer) -> Bool {
        guard let currentQuestion = currentQuestion, var gameData = levelData.dataAt(id: currentQuestion.goodAnswer.gameDataID) else {
            return false
        }

        if answer == currentQuestion.goodAnswer {
            gameData.incrementScore()
            return true
        }else {
            gameData.decrementScore()
            return false
        }
    }

    func getCurrentQuestion() -> Question? {
        return currentQuestion
    }
}
