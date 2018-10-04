//
//  Kanjis.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Kanjis : ModeDataConstructor {
    var name: String = "Kanji_Mode_Name".localize()
    internal var datas : [GameData] = []
    internal var kanjisJSON = KanjiModeJSONs.kanjiJSON
    internal var groupJSON = KanjiModeJSONs.groupsJSON
    internal var answers: PossibleAnswers?

    init() {
        let kanjiData = JSONParser(json: kanjisJSON, withExtension: "json").data
        let kanjisList = parseData(data: kanjiData)

        for kanji in kanjisList {
            datas.append(Kanji(parsedKanji: kanji))
        }
        createAnswer()
    }

    private func parseData(data: Data?) -> [KanjiParsing] {
        guard let data = data else {
            return []
        }

        do {
            let parsedGroups = try JSONDecoder().decode([KanjiParsing].self, from: data)
            return parsedGroups
        } catch {
            return []
        }
    }

    internal func createAnswer() {
        let dataNamesString = getDataNameAsArray()
        answers = PossibleAnswers(modeDataCreator: self, dataComponentsName: dataNamesString)
    }

    func getDataNameAsArray() -> [String] {
        var dataNamesString : [String] = []
        for names in KanjiDataNames.allCases {
            dataNamesString.append(names.rawValue)
        }
        return dataNamesString
    }
}
