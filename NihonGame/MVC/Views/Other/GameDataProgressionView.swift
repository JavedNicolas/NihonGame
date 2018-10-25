//
//  GameDataProgressionView.swift
//  NihonGame
//
//  Created by Nicolas on 15/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameDataProgressionView : UIProgressView {
    // MARK:- setters
    func set(learningScore: Int, learningLevel: String) {
        let maxScoreForLearningLevel = GameDataConstant.MaxScoreForLearningLevel
        let progression : Float = Float(learningScore) / Float(maxScoreForLearningLevel)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.setProgress(Float(progression), animated: true)

        let learningLevelNames = GameDataConstant.learningLevelNames
        for (index, name) in learningLevelNames.enumerated() {
            if name == learningLevel {
                progressTintColor = DesignConstant.learningLevelColors[index]
            }
        }
    }
}
