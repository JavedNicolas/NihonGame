//
//  Answer.swift
//  NihonGame
//
//  Created by Nicolas on 01/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct Answer {
    var gameDataID : Int = 0
    var answerString : String = ""
    var category : String = ""

    static func == (lhs: Answer, rhs: Answer) -> Bool {
        if lhs.gameDataID == rhs.gameDataID, lhs.answerString == rhs.answerString, lhs.category == rhs.category {
            return true
        }
        return false
    }
}
