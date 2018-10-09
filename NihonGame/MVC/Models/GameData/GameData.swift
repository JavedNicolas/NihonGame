//
//  Kanji.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class GameData : NSManagedObject {
    var dataDictionary : [String: [Substring]] = [:]

    func fill(parsedData: GameDataParsed){
        self.id = parsedData.id.int16
        self.learningScore = parsedData.learningScore.int64
        self.dataString = parsedData.data
        createDataDictionary()
    }

    func createDataDictionary() {
        if let dataString = self.dataString {
            let dataByCategories = dataString.split(separator: ";")
            for data in dataByCategories {
                let datasplit = data.split(separator: ":")
                let category = String(datasplit[0])
                let dataForCategory = datasplit[1].split(separator: ",")
                dataDictionary[category] = dataForCategory
            }
        }
    }
    
    func getQuestionData() -> QuestionData?{
        /** Random question */
        guard let questionRandomDict = dataDictionary.randomElement(),let questionSubString = questionRandomDict.value.randomElement() else{
            return nil
        }
        let questionCategoryName = questionRandomDict.key
        let questionString = String(questionSubString)

        /** Random Answer */
        var randomIsOK = false
        var answerCategoryName = ""
        var answerString = ""
        repeat {
            guard let answerRandomDict = dataDictionary.randomElement() else{
                return nil
            }

            if checkIfAnswerIsGood(question: questionCategoryName, answer: answerRandomDict.key) {
                if let answerSubString = answerRandomDict.value.randomElement() {
                    answerString = String(answerSubString)
                    answerCategoryName = answerRandomDict.key
                    randomIsOK = true
                }
            }
        }while randomIsOK == false

        return QuestionData(questionCategory: questionCategoryName, questionString: questionString, goodAnswerString: answerString,
                            answerCategoryName: answerCategoryName)

    }

    func checkIfAnswerIsGood(question: String, answer: String) -> Bool{
        guard  let mode = mode else {
            return false
        }

        if let indexOfQuestion = mode.dataNames.getIndexFor(string: question),
            let indexOfAnswer = mode.dataNames.getIndexFor(string: answer) {
            if indexOfQuestion != indexOfAnswer {
                return true
            }
        }
        return false
    }

    func changeScore(increase: Bool) {
        if increase {
            learningScore += GameDataConstant.scoreIncrementation.int64
        }else {
            if learningScore != 0 {
                learningScore -= GameDataConstant.scoreDecrementation.int64
            }
        }
    }

}
