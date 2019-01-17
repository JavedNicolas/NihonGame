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
    // MARK: - Attributs
    var dataNameOrder = [String]()
    lazy var data = self.setDataAsStruct()
    var  learningLevel : String {
        get {
            return setLearningLevelString()
        }
    }

    // MARK:- functions
    /**
     Fill with data parsed from a JSON file
     - Parameters:
        - parsedData: dataParsed
     */
    func fill(parsedData: GameDataParsed){
        self.id = parsedData.id.int64
        self.learningScore = parsedData.learningScore.int64
        self.dataString = parsedData.data
    }

    /**
     Set Datas content Array from the dataString
     - returns: An Aray of Array of Data Components
     */
    func setDataAsStruct() -> [[DataComponents]] {
        var finalData = [[DataComponents]]()
        if let dataString = self.dataString {
            let dataByCategories = dataString.split(separator: ";")
            var tmpData = [DataComponents]()
            for dataString in dataByCategories {
                let datasplit = dataString.split(separator: ":")
                let category = String(datasplit[0])
                let dataForCategory = datasplit[1].split(separator: ",")
                let data = DataComponents(name: category, value: dataForCategory)
                tmpData.append(data)
            }
            finalData.append(tmpData)
        }
        return finalData
    }

    /**
     Create question Data
     - returns: question data for self
     */
    func getQuestionData() -> QuestionData?{
        /** Random question */
        guard let randomDataArray = data.randomElement(), let randomData = randomDataArray.randomElement(),
            let randomQuestionString = randomData.value.randomElement() else{
            return nil
        }
        let questionCategoryName = randomData.name
        let questionString = String(randomQuestionString)

        /** Random Answer */
        var randomIsOK = false
        var answerCategoryName = ""
        var answerString = ""
        repeat {
            guard let answerRandomArray = data.randomElement(), let randomData = answerRandomArray.randomElement() else {
                return nil
            }

            if checkIfAnswerIsGood(question: questionCategoryName, answer: randomData.name) {
                if let answerSubString = randomData.value.randomElement() {
                    answerString = String(answerSubString)
                    answerCategoryName = randomData.name
                    randomIsOK = true
                }
            }
        }while randomIsOK == false

        return QuestionData(questionCategory: questionCategoryName, questionString: questionString, goodAnswerString: answerString,
                            answerCategoryName: answerCategoryName)

    }

    /**
        Check if an Answer is correct. That means it check if the answer which was random is not from the same array.
        To Understand that it's important to get that each array (first layer of array) containt data that can be paired
        as question and answer, but the content of the same array cannot containt the question and the answer.
     */
    func checkIfAnswerIsGood(question: String, answer: String) -> Bool{
        guard  let mode = mode else { return false }

        if let indexOfQuestion = mode.dataNames.getIndexFor(string: question),
            let indexOfAnswer = mode.dataNames.getIndexFor(string: answer) {
            if indexOfQuestion != indexOfAnswer {
                return true
            }
        }
        return false
    }

    /**
     Change the learningScore
     - Parameters:
        - increase: if true increase the score, else decrease it.
     */
    func changeScore(increase: Bool) {
        if increase {
            if learningScore != GameDataConstant.MaxScoreForLearningLevel.int64 {
                learningScore += GameDataConstant.scoreIncrementation.int64
            }
        }else {
            if learningScore != 0 && learningScore != GameDataConstant.scoreDecrementation.int64 {
                learningScore -= GameDataConstant.scoreDecrementation.int64
            }
        }
    }

    /** Set the learning level of self */
    func setLearningLevelString () -> String {
        let learningLevelSteps = GameDataConstant.learningLevelSteps

        if learningScore > learningLevelSteps[learningLevelSteps.count - 1] {
            let learningLevel = GameDataConstant.learningLevelNames[learningLevelSteps.count - 1]
            return learningLevel
        }

        for learningStepIndex in 0..<learningLevelSteps.count - 1 {
            let startStepScore = learningLevelSteps[learningStepIndex] + 1
            let endStepScore = learningLevelSteps[learningStepIndex + 1]
            if startStepScore...endStepScore ~= learningScore {
                let learningLevel = GameDataConstant.learningLevelNames[learningStepIndex]
                return learningLevel
            }
        }
        return ""
    }
}
