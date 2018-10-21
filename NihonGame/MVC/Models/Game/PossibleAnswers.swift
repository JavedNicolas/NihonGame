//
//  Answers.swift
//  NihonGame
//
//  Created by Nicolas on 01/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class PossibleAnswers {
    // MARK:- attributs
    private var possibleAnswerList : [String: [Answer]] = [:]

    // MARK:- init
    /**
     Create a list of all the possible answer

     - Parameters:
         - modeDatas: The data for the current mode
         - dataComponentsName: The array which containt component of the data
     */
    init(modeDatas: [GameData], dataComponentsName: [[String]]){
        for modeData in modeDatas {
            for dataArray in modeData.data {
                for data in dataArray {
                    for element in data.value {
                        let answer = Answer(gameDataID: modeData.id.int, answerString: String(element), category: data.name)
                        if possibleAnswerList[data.name] == nil {
                            possibleAnswerList[data.name] = [Answer]()
                        }
                        if let value = possibleAnswerList[data.name],
                            !value.contains(where: {$0.answerString == answer.answerString}) {
                            possibleAnswerList[data.name]?.append(answer)
                        }
                    }
                }
            }
        }
    }

    // MARK:- functions
    func getPossibleAnswersList() -> [String: [Answer]] {
        return possibleAnswerList
    }
}
