//
//  TrainingVCExtension.swift
//  NihonGame
//
//  Created by Nicolas on 25/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

// MARK:- Handle Data to train
extension TrainingViewController {
    // MARK:- struct
    struct DataToReview {
        var modeID : Int
        var modeName: String
        var datas : [GameData]
    }

    struct DataToReviewWithLevel {
        var learningLevel: String
        var learningLevelIndex: Int
        var numberOfData : Int

        init(learningLevel: String, numberOfData: Int) {
            self.learningLevel = learningLevel
            self.numberOfData = numberOfData
            guard let index = GameDataConstant.learningLevelNames.firstIndex(where: {$0 == learningLevel}) else {
                learningLevelIndex = 0
                return
            }
            learningLevelIndex = index
        }
    }

    /** Get Data to review from all the modes */
    internal func getDataToReview() -> [DataToReview] {
        var knowData = [DataToReview]()
        for gameMode in GameModes.shared.getGameModes() {
            guard let name = gameMode.name else { return [] }
            var dataToReview = DataToReview(modeID: gameMode.id.int, modeName: name, datas: [])
            for data in gameMode.getDatas() {
                let lastLearningScoreIndex = GameDataConstant.learningLevelSteps.count - 1
                let lastLearningScore = GameDataConstant.learningLevelSteps[lastLearningScoreIndex]
                if 1...lastLearningScore ~= data.learningScore {
                    dataToReview.datas.append(data)
                }
            }
            knowData.append(dataToReview)
        }
        return knowData
    }

    internal func getDataByLearningLevel(dataToReview: DataToReview) -> [DataToReviewWithLevel]{
        var dataByLearningLevel : [DataToReviewWithLevel] = []
        for data in dataToReview.datas {
            let dataLearningLevelInArray = dataByLearningLevel.firstIndex(where: { $0.learningLevel == data.learningLevel})
            if let index = dataLearningLevelInArray {
                dataByLearningLevel[index].numberOfData += 1
            }else {
                let dataWithLearningLevel = DataToReviewWithLevel(learningLevel: data.learningLevel, numberOfData: 1)
                dataByLearningLevel.append(dataWithLearningLevel)
            }
        }
        dataByLearningLevel.sort(by: {$0.learningLevelIndex < $1.learningLevelIndex})
        return dataByLearningLevel
    }
}
