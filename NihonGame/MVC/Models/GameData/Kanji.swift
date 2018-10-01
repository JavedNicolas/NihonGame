//
//  Kanji.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Kanji : GameData {
    internal var id : Int
    internal var groupName : String
    internal var dataDictionary : [String: [Substring]] = [:]
    var learningScore : Int = 0

    init(parsedKanji kanji: KanjiParsing){
        self.id = kanji.id
        self.groupName = kanji.level
        dataDictionary[KanjiDataNames.kanji.rawValue] = kanji.kanji.split(separator: ",")
        dataDictionary[KanjiDataNames.onyomi.rawValue] = kanji.onyomi.split(separator: ",")
        dataDictionary[KanjiDataNames.kunyomi.rawValue] = kanji.kunyomi.split(separator: ",")
        dataDictionary[KanjiDataNames.traduction.rawValue] = kanji.traduction.split(separator: ",")
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

    func getQuestionData() -> QuestionData?{
        /** Random question */
        guard let questionRandomDict = dataDictionary.randomElement(),let questionSubString = questionRandomDict.value.randomElement() else{
            return nil
        }
        let questionCategoryName = questionRandomDict.key
        let questionString = String(questionSubString)

        /** Random Answer */
        var randomIsOK = false
        var answerCategoryName = ""
        var answerString = ""
        repeat {
            guard let answerRandomDict = dataDictionary.randomElement() else{
                return nil
            }

            if (questionCategoryName == KanjiDataNames.kanji.rawValue && answerRandomDict.key != KanjiDataNames.kanji.rawValue) ||
                (questionCategoryName != KanjiDataNames.kanji.rawValue && answerRandomDict.key == KanjiDataNames.kanji.rawValue) {
                if let answerSubString = answerRandomDict.value.randomElement() {
                    answerString = String(answerSubString)
                    answerCategoryName = answerRandomDict.key
                    randomIsOK = true
                }
            }
        }while randomIsOK == false

        return QuestionData(questionCategory: questionCategoryName, questionString: questionString, goodAnswerString: answerString,
                            answerCategoryName: answerCategoryName)

    }

    func getNameForID(idToSearch: Int) -> String{
        var index = 0
        for name in KanjiDataNames.allCases {
            if index == idToSearch {
                return name.rawValue
            }else {
                index += 1
            }
        }
        return ""
    }

}
