//
//  Game.swift
//  NihonGame
//
//  Created by Nicolas on 04/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Game {
    var level : Level
    private var levelData : [GameData] = []
    private var numberOfQuestionAsked = 0
    private var currentQuestion : Question? = nil {
        didSet {
            let notificationName = Notification.Name("QuestionLoaded")
            let notification = Notification(name: notificationName)
            NotificationCenter.default.post(notification)
        }
    }

    init(level: Level) {
        self.level = level
        self.level.startLevel()
    }

    /** Set a ne question */
    func setNewQuestion() {
        numberOfQuestionAsked += 1
        if let gameMode = GameModes.shared.getCurrentMode(), let allAnswers = gameMode.possibleAnswers,
            let levelDatas = level.levelDatas {
            self.currentQuestion = Question(levelData: levelDatas, AllAnswers: allAnswers)
        }
    }

    func needToShowTutorial() -> GameData? {
        if let newGameData = level.newGameData, level.bestScore == 0{
            return newGameData
        }
        return nil
    }

    func userAnswered(isCorrect: Bool) {
        guard let question = currentQuestion else {
            return
        }
        question.dataChoosed.changeScore(increase: isCorrect)
        level.changeScore(increase: isCorrect)
    }

    func isLevelSuccess() -> Bool {
        if level.score >= GameConstant.levelCompleteScore {
            return true
        }
        return false
    }

    func isLevelOver() -> Bool{
        if numberOfQuestionAsked >= GameConstant.questionsByLevel {
            return true
        }
        return false
    }

    func getCurrentQuestion() -> Question? {
        return currentQuestion
    }

    func getNumberOfQuestionAsked() -> Int {
        return numberOfQuestionAsked
    }
}
