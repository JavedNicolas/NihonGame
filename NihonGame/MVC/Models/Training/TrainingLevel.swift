//
//  TrainingLevel.swift
//  NihonGame
//
//  Created by Nicolas on 24/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class TrainingLevel: Level {
    var levelDatas: [GameData]
    var bestScore: Int64 = 0
    var score: Int64 = 0
    var stars: Int16 = 0
    var newGameData: GameData?
    let questionToAsk: Int = TrainingConstant.questionsByTraining
    var done : Bool = false

    init(levelDatas: [GameData]) {
        self.levelDatas = levelDatas
    }

    func levelFinished() {
        CoreDataManager.shared.saveContext()
    }
}
