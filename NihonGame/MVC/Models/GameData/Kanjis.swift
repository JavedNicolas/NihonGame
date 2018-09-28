//
//  Kanjis.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

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
