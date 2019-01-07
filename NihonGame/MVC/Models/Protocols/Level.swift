//
//  Level.swift
//  NihonGame
//
//  Created by Nicolas on 24/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol Level {
    // MARK-: Attributs
    var levelDatas: [GameData] { get }
    var bestScore : Int64 { get }
    var score : Int64 { get set }
    var newGameData : GameData? { get }
    var questionToAsk : Int { get }
    var stars : Int16 { get }
    var done : Bool { get }

    // MARK:- Functions
    mutating func startLevel()
    mutating func changeScore(increase: Bool)
    func levelFinished()
}

extension Level {
    // MARK:- extension functions
    /** init current score and best score at the start of the level */
    mutating func startLevel() {
        score = 0
    }

    /**
     Change the score.
     - Parameters:
     - increase: if true increase the score, else decrease it
     */
    mutating func changeScore(increase: Bool) {
        if increase {
            score += GameConstant.scoreIncrementation.int64
        }else {
            if score != 0 {
                score -= GameConstant.scoreDecrementation.int64
            }
        }
    }

    // MARK:- Optional methods
    func levelFinished() {}
}
