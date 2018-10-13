//
//  Question.swift
//  NihonGame
//
//  Created by Nicolas on 01/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Question {
    var question : String = ""
    var goodAnswer : Answer = Answer()
    var badAnswers : [Answer] = []
    var dataChoosed : GameData?
    private var allPossibleAnswer : PossibleAnswers
    private var dataNames = [[String]]()

    init(levelData : [GameData], AllAnswers: PossibleAnswers) {
        self.allPossibleAnswer = AllAnswers
        var dataID = 0
        var goodAnswerString = ""
        var goodAnswerCategory = ""
        var questionString = ""
        guard let dataChoosed = levelData.randomElement() else {
            return
        }

        dataID = dataChoosed.id.int
        if let question = dataChoosed.getQuestionData() {
            questionString = question.questionString
            goodAnswerString = question.goodAnswerString
            goodAnswerCategory = question.answerCategoryName
        }
        self.dataChoosed = dataChoosed

        self.question = questionString
        self.goodAnswer = Answer(gameDataID: dataID, answerString: goodAnswerString, category: goodAnswerCategory)
        generateBadAnswer(levelData: levelData, category: goodAnswerCategory, numberOfBadAnswer: 3)
    }

    func generateBadAnswer(levelData: [GameData], category: String, numberOfBadAnswer: Int) {
        guard let badAnswerPossibility = allPossibleAnswer.getPossibleAnswersList()[category], let mode = GameModes.shared.getCurrentMode(),
        let datas = mode.getDatas(), let firstData = datas.first else {
            return
        }
        let lastGameData = levelData[levelData.endIndex - 1]
        for answersCount in 0...numberOfBadAnswer - 1 {
            repeat {
                let firstBadAnswerID = badAnswerPossibility.startIndex
                var lastBadAnswerIDPossible =  firstData.id.int + 10
                if levelData.startIndex > firstData.id.int + 4 {
                    lastBadAnswerIDPossible = lastGameData.id.int
                }
                let randomNumber = Int.random(in: badAnswerPossibility[firstBadAnswerID].gameDataID..<lastBadAnswerIDPossible)
                if let badAnswer = badAnswerPossibility.randomDataFor(id: randomNumber),
                checkIfBadAnswersCanBeAdded(badAnswer: badAnswer, lastGameDataID: lastGameData.id.int, category: category){
                    self.badAnswers.append(badAnswer)
                }
            }while self.badAnswers.count == answersCount
        }
    }

    func checkIfBadAnswersCanBeAdded(badAnswer: Answer, lastGameDataID: Int, category: String) -> Bool{
        if badAnswer.gameDataID != goodAnswer.gameDataID, badAnswer.answerString != goodAnswer.answerString,
            !self.badAnswers.contains(where: { $0.answerString == badAnswer.answerString }){
            let allAnswersDict = allPossibleAnswer.getPossibleAnswersList()
            if let categoryDict = allAnswersDict[category] {
                return categoryDict.contains(where: {$0.gameDataID == badAnswer.gameDataID && $0.answerString == badAnswer.answerString })
            }
        }
        return false
    }
}
