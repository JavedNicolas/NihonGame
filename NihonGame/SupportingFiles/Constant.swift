//
//  Constant.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import UIKit

struct GameConstant {
    static let levelCompleteScore = 500
    static let scoreIncrementation = 50
    static let scoreDecrementation = 50
    static let questionsByLevel = 20
    static let scoreByStar = 200
}

struct GameDataConstant {
    static let scoreIncrementation = 10
    static let scoreDecrementation = 10
    static let learningLevelSteps = [0.int64 ,300.int64, 600.int64, 900.int64]
    static let learningLevelNames = ["Learning_Level_0".localize(), "Learning_Level_1".localize(),
                                     "Learning_Level_2".localize(), "Learning_Level_3".localize()]
    static let MaxScoreForLearningLevel = 1200
}

struct TrainingConstant {
    static let questionsByTraining = 30
    static let numberOfDataByTraining = 4
}

struct DesignConstant {
    static let gray5Alpha = UIColor(red: GrayColorComponents.redColor, green: GrayColorComponents.greenColor,
                                    blue: GrayColorComponents.blueColor, alpha: 0.5)
    static let black5Alpha = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    static let black7Alpha = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    static let black1Alpha = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    static let blue1Alpha = UIColor(red: BlueColorComponents.redColor, green: BlueColorComponents.greenColor,
                                    blue: BlueColorComponents.blueColor, alpha: 1)
    static let green7Alpha = UIColor.green.withAlphaComponent(0.7)
    static let red7Alpha = UIColor.red.withAlphaComponent(0.7)
    static let learningLevelColors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green]
}

struct GrayColorComponents {
    static let redColor = CGFloat(CGFloat(149)/CGFloat(255))
    static let greenColor = CGFloat(CGFloat(149)/CGFloat(255))
    static let blueColor = CGFloat(CGFloat(149)/CGFloat(255))
}

struct BlueColorComponents {
    static let redColor = CGFloat(CGFloat(0)/CGFloat(255))
    static let greenColor = CGFloat(CGFloat(94)/CGFloat(255))
    static let blueColor = CGFloat(CGFloat(160)/CGFloat(255))
}
