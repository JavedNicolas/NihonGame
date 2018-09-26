//
//  Kanji.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

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

    init(parsedKanji kanji: KanjiParsing){
        self.id = kanji.id
        self.groupName = kanji.level
        self.value = kanji.kanji
        self.onyomi = kanji.onyomi.split(separator: ",")
        self.kunyomi = kanji.kunyomi.split(separator: ",")
        self.traduction = kanji.traduction.split(separator: ",")
        self.learningScore = 0

        if let kanjiProgression = getKanjiProgression() {
            let progression = hasProgression(kanjiID: kanji.id, kanjiProgression: kanjiProgression)
            if progression.0 {
                learningScore = progression.1
            }
        }
    }
    
    private func getKanjiProgression() -> [KanjiProgression]? {

        return nil
    }

    private func hasProgression(kanjiID: Int, kanjiProgression: [KanjiProgression]) -> (Bool, Int){
        let comparingKanjiProgression = KanjiProgression(context: CoreDataManager().getContext())
        comparingKanjiProgression.id = Int16(kanjiID)
        if let progression = kanjiProgression.firstIndex(of: comparingKanjiProgression)  {
            let currentProgression = Int(kanjiProgression[progression].progressionScore)
            return (true, currentProgression)
        } else {
            return (false, 0)
        }
    }
}

class Kanjis {
    private var kanjis : [Kanji] = []
    private var kanjisJSON = MenuJSON.kanjiJSON

    init() {
        let kanjiData = JSONParser(json: kanjisJSON, withExtension: "json").data
        let kanjisList = parseData(data: kanjiData)

        for kanji in kanjisList {
            kanjis.append(Kanji(parsedKanji: kanji))
        }
    }

    private func parseData(data: Data?) -> [KanjiParsing] {
        guard let data = data else {
            return []
        }

        do {
            let parsedGroups = try JSONDecoder().decode([KanjiParsing].self, from: data)
            return parsedGroups
        } catch let error {
            print(error)
            return []
        }
    }

    func getKanjis() -> [Kanji] {
        return kanjis
    }
}
