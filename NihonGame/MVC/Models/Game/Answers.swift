//
//  Answers.swift
//  NihonGame
//
//  Created by Nicolas on 01/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Answers {
    private var answerList : [String: [Answer]] = [:]

    init(modeDataCreator: ModeDataConstructor, dataComponentsName: [String]) {
        let modeData = modeDataCreator.datas
        for data in modeData {
            for dataName in dataComponentsName {
                if let dataForDataName = data.dataDictionary[dataName] {
                    for dataComponent in dataForDataName {
                        let answer = Answer(gameDataID: data.id, answerString: String(dataComponent), category: dataName)
                        if answerList[dataName] == nil {
                            answerList[dataName] = [Answer]()
                        }
                        if let isNew = (answerList[dataName]?.contains(where: {$0.answerString == answer.answerString})),
                            !isNew {
                            answerList[dataName]?.append(answer)
                        }
                    }
                }
            }
        }
    }
}
