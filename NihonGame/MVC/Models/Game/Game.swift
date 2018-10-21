//
//  Game.swift
//  NihonGame
//
//  Created by Nicolas on 04/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Game {
    // MARK:- Attributs
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

    // MARK:- init
    init(level: Level) {
        self.level = level
        self.level.startLevel()
    }

    // MARK:- functions
    /** random a ne question */
    func setNewQuestion() {
        numberOfQuestionAsked += 1
        if let gameMode = GameModes.shared.getCurrentMode(), let allAnswers = gameMode.possibleAnswers,
            let levelDatas = level.levelDatas {
            self.currentQuestion = Question(levelData: levelDatas, AllAnswers: allAnswers)
        }
    }

    /**
     return a gameData if the level need to show the content of an unseen Game Data
     - returns: a game data if there is an unseen data
     */
    func needToShowTutorial() -> GameData? {
        if let newGameData = level.newGameData, newGameData.learningScore == 0 {
            return newGameData
        }
        return nil
    }

    /** if the user answered correctly increase the score */
    func userAnswered(isCorrect: Bool) {
        guard let question = currentQuestion, let dataChoosed = question.dataChoosed else {
            return
        }
        dataChoosed.changeScore(increase: isCorrect)
        level.changeScore(increase: isCorrect)
    }

    /** if the level score is greater of equal to the score to complete the level return true */
    func isLevelSuccess() -> Bool {
        if level.score >= GameConstant.levelCompleteScore {
            return true
        }
        return false
    }

    /** return true if the number of question for this level have been asked */
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
