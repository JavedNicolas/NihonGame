//
//  GameDataModel.swift
//  NihonGame
//
//  Created by Nicolas on 13/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol GameData {
    var id : Int { get }
    var groupName : String { get }
    var dataDictionary : [String: [Substring]] { get }
    var learningScore : Int { get }
    func getQuestionData() -> QuestionData?
}
