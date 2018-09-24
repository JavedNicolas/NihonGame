//
//  ParsingStructs.swift
//  NihonGame
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class KanjiData : GameDataParser {
    // MARK: - Attributs
    var datas: [GameData] = [Kanji]()

    // MARK: - init
    init() {
        self.datas = parseAndReformateKanjis()
    }

    // MARK: - Functions
    /**
     Parse Data from json file and reformate it to conform to Kanji formate
     and return it

     - Parameters:
        - data: Data from the JSON
     */
    private func parseAndReformateKanjis() -> [Kanji] {
        guard let data = parseData(for: KanjiData.self, json: "KanjiList") else {
            return []
        }

        var kanjisConstructor : [Kanji] = []
        do {
            let kanjiParsed = try JSONDecoder().decode([KanjiParsing].self, from: data)
            for kanji in kanjiParsed {
                let id = kanji.id
                let groupName = kanji.level
                let kanjiString = kanji.kanji
                let onyomi = kanji.onyomi.split(separator: ",")
                let kunyomi = kanji.kunyomi.split(separator: ",")
                let traduction = kanji.traduction.split(separator: ",")
                let reformatedKanji = Kanji(id: id, groupName: groupName, value: kanjiString, onyomi: onyomi, kunyomi: kunyomi, traduction: traduction)
                kanjisConstructor.append(reformatedKanji)
            }
            return kanjisConstructor
        }catch {
            return []
        }
    }
}
