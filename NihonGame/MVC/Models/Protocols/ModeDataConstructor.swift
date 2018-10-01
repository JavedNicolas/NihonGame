//
//  Mode.swift
//  NihonGame
//
//  Created by Nicolas on 01/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol ModeDataConstructor {
    var datas : [GameData] { get }
    var groupJSON : String { get }
    var answers : Answers? { get }
    func createAnswer()
    func getGroupJSON() -> String
    func getDatas() -> [GameData]
    func getDataNameAsArray() -> [String]
}

extension ModeDataConstructor {
    func getGroupJSON() -> String {
        return groupJSON
    }

    func getDatas() -> [GameData] {
        return datas
    }

    func getAnswerList() -> Answers? {
        return answers
    }
}
