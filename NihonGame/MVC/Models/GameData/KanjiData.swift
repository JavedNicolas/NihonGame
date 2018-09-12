//
//  ParsingStructs.swift
//  NihonGame
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

enum KanjiLevel : String {
    case N5, N4, N3, N2, N1
}

class KanjiData : GameData {
    // MARK: - Attributs
    var kanjis: [Kanji] {
        guard let data = parseData(for: KanjiData.self, json: "KanjiList") else {
            return []
        }
        return parseAndReformateKanjis(data: data)
    }

    var groups : [Group] {
        return getGroupes()
    }

    /**
     Parse Data from json file and reformate it to conform to Kanji formate
     and return it

     - Parameters:
        - data: Data from the JSON
     */
    private func parseAndReformateKanjis(data : Data) -> [Kanji] {
        var kanjisConstructor : [Kanji] = []
        do {
            let kanjiParsed = try JSONDecoder().decode([KanjiParsing].self, from: data)
            for (index, kanji) in kanjiParsed.enumerated() {
                let id = index + 1
                let level = KanjiLevel(rawValue: kanji.level)
                let kanjiString = kanji.kanji
                let onyomi = kanji.onyomi.split(separator: ",")
                let kunyomi = kanji.kunyomi.split(separator: ",")
                let traduction = kanji.traduction.split(separator: ",")
                let reformatedKanji = Kanji(id: id, level: level!, kanji: kanjiString, onyomi: onyomi, kunyomi: kunyomi, traduction: traduction)
                kanjisConstructor.append(reformatedKanji)
            }
            return kanjisConstructor
        }catch {
            return []
        }
    }

    private func getGroupes() -> [Group]{
        var groupDict = [ KanjiLevel.N5: [Int](), KanjiLevel.N4 : [Int](), KanjiLevel.N3 : [Int](),
                          KanjiLevel.N2 : [Int]() , KanjiLevel.N1 : [Int]() ]
        var groups : [Group] = []

        for kanji in kanjis {
            groupDict[kanji.level]?.append(kanji.id)
        }

        for group in groupDict {
            guard let firstKanjiID = group.value.first, let lastKanjiID = group.value.last else {
                return []
            }

            groups.append(Group(jlptLevel: group.key, kanjiRange: (firstKanjiID, lastKanjiID)))
        }

        return groups
    }
}
