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

    func fill(parsedData: GameDataParsed){
        self.id = parsedData.id.int64
        self.learningScore = parsedData.learningScore.int64
        self.dataString = parsedData.data
    }

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

    func changeScore(increase: Bool) {
        if increase {
            learningScore += GameDataConstant.scoreIncrementation.int64
        }else {
            if learningScore != 0{
                learningScore -= GameDataConstant.scoreDecrementation.int64
            }
        }
    }

    func setLearningLevelString () -> String {
        let firstStep = GameDataConstant.firstLearningStep.int64
        let secondStep = GameDataConstant.secondLearningStep.int64
        let thirdStep = GameDataConstant.thirdLearningStep.int64

        switch learningScore {
        case 0...firstStep : return "Learning_Level_1".localize()
        case (firstStep + 1)...secondStep : return "Learning_Level_2".localize()
        case (secondStep + 1)...thirdStep : return "Learning_Level_3".localize()
        case let score where score > thirdStep : return "Learning_Level_4".localize()
        default : return "Learning_Level_4".localize()
        }
    }

}
