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

    func getQuestion() -> [Substring]{
        let valueSubstring = value.split(separator: ",")
        let possibleChoiceArray : [[[Substring]]] = [[valueSubstring],[kunyomi,onyomi,traduction]]
        let randomNumber = Int.random(in: 0..<possibleChoiceArray.count)
        if randomNumber == 0 {
            return possibleChoiceArray[randomNumber][0]
        }else {
            let newPossibleChoice = possibleChoiceArray[randomNumber]
            let randomNumber2 = Int.random(in: 0..<newPossibleChoice.count)
            return newPossibleChoice[randomNumber2]
        }
    }

    func getAnswer() {

    }
}
