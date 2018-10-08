//
//  Answers.swift
//  NihonGame
//
//  Created by Nicolas on 01/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class PossibleAnswers {
    private var possibleAnswerList : [String: [Answer]] = [:]

    init(modeData: [GameData], dataComponentsName: [[String]]){
        let dataComponentsName = dataComponentsName.flatenArray()
        for data in modeData {
            for dataName in dataComponentsName {
                if let dataForDataName = data.dataDictionary[dataName] {
                    for dataComponent in dataForDataName {
                        let answer = Answer(gameDataID: data.id.int, answerString: String(dataComponent), category: dataName)
                        if possibleAnswerList[dataName] == nil {
                            possibleAnswerList[dataName] = [Answer]()
                        }
                        if let isNew = (possibleAnswerList[dataName]?.contains(where: {$0.answerString == answer.answerString})),
                            !isNew {
                            possibleAnswerList[dataName]?.append(answer)
                        }
                    }
                }
            }
        }
    }

    func getPossibleAnswersList() -> [String: [Answer]] {
        return possibleAnswerList
    }
}
