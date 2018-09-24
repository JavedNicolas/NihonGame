//
//  KanjiStructs.swift
//  NihonGame
//
//  Created by Nicolas on 12/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct KanjiParsing : Decodable {
    let id : Int
    let level : String
    let kanji : String
    let onyomi : String
    let kunyomi : String
    let traduction : String
}


struct Kanji : GameData {
    var id : Int
    var groupName : String
    var value : String
    let onyomi : [Substring]
    let kunyomi : [Substring]
    let traduction : [Substring]
    var learningScore : Int

    init(id: Int, groupName: String, value: String, onyomi: [Substring], kunyomi: [Substring], traduction: [Substring], learningScore: Int = 0){
        self.id = id
        self.groupName = groupName
        self.value = value
        self.onyomi = onyomi
        self.kunyomi = kunyomi
        self.traduction = traduction
        self.learningScore = learningScore
    }
}
