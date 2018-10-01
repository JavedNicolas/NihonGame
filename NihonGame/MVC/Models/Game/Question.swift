//
//  Question.swift
//  NihonGame
//
//  Created by Nicolas on 01/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Question {
    var question : String
    var goodAnswer : Answer
    var badAnswers : [Answer]

    init(levelData : [GameData], dataNames: [String]) {
        let levelDataFirstElement = levelData[levelData.startIndex]
        let levelDataLastElement = levelData[levelData.endIndex - 1]
        let randomComponentsID = Int.random(in: levelDataFirstElement.id...levelDataLastElement.id)
        var dataID = 0
        var goodAnswerString = ""
        var goodAnswerCategorie = ""
        var questionString = ""
        if let chosenData = levelData.dataAt(id: randomComponentsID) {
            dataID = chosenData.id
            if let question = chosenData.getQuestionData() {
                questionString = question.questionString
                goodAnswerString = question.goodAnswerString
                goodAnswerCategorie = question.answerCategoryName
            }
        }
        self.question = questionString
        self.goodAnswer = Answer(gameDataID: dataID, answerString: goodAnswerString, category: goodAnswerCategorie)
        self.badAnswers = []
        generateBadAnswer(lastKanjiLearned: levelDataLastElement)
    }

    func generateBadAnswer(lastKanjiLearned: GameData) {
        let allAnswer = gameModes
    }


}
