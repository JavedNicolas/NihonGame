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
        switch learningLevel {
        case "Learning_Level_1".localize(): progressTintColor = .red
        case "Learning_Level_2".localize(): progressTintColor = .orange
        case "Learning_Level_3".localize(): progressTintColor = .yellow
        case "Learning_Level_4".localize(): progressTintColor = .green
        default : progressTintColor = .red
        }
    }
}
