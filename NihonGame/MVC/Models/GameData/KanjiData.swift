//
//  ParsingStructs.swift
//  NihonGame
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct KanjiParsing : Decodable {
    var level : String
    var kanji : String
    var onyomi : String
    var kunyomi : String
    var traduction : String
}


struct Kanji {
    var level : String
    var kanji : String
    var onyomi : [Substring]
    var kunyomi : [Substring]
    var traduction : [Substring]
}


class KanjiData : GameData {
    // MARK: - Attributs
    var kanjis: [Kanji] {
        guard let data = parseData(for: KanjiData.self, json: "KanjiList") else {
            return []
        }
        return parseAndReformateKanjis(data: data)
    }


    /**
     Parse Data from json file and reformate it to conform to Kanji formate
     and return it

     - Parameters:
        - data: Data from the JSON
     */
    func parseAndReformateKanjis(data : Data) -> [Kanji] {
        var kanjisConstructor : [Kanji] = []
        do {
            let kanjiParsed = try JSONDecoder().decode([KanjiParsing].self, from: data)
            for kanji in kanjiParsed {
                let level = kanji.level
                let kanjiString = kanji.kanji
                let onyomi = kanji.onyomi.split(separator: ",")
                let kunyomi = kanji.kunyomi.split(separator: ",")
                let traduction = kanji.traduction.split(separator: ",")
                let reformatedKanji = Kanji(level: level, kanji: kanjiString, onyomi: onyomi, kunyomi: kunyomi, traduction: traduction)
                kanjisConstructor.append(reformatedKanji)
            }
            return kanjisConstructor
        }catch {
            return []
        }
    }
}
