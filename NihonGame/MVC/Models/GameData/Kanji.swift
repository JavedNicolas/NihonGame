//
//  Kanji.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Kanji : GameData {
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

    init(parsedKanji kanji: KanjiParsing){
        self.id = kanji.id
        self.groupName = kanji.level
        self.value = kanji.kanji
        self.onyomi = kanji.onyomi.split(separator: ",")
        self.kunyomi = kanji.kunyomi.split(separator: ",")
        self.traduction = kanji.traduction.split(separator: ",")
        self.learningScore = 0
        updateProgression()
    }

    private func updateProgression(){
        let kanjiProgression = KanjiProgression(context: CoreDataManager().getContext())
        if kanjiProgression.fetch(kanjiID: id) {
            if kanjiProgression.progressionScore != 0 {
                learningScore = kanjiProgression.progressionScore.int
            }
        }
    }
}
