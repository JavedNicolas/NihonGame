//
//  ParsingStructs.swift
//  NihonGame
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class KanjiData : GameDataParsing {
    // MARK: - Attributs
    var kanjis: [Kanji] {
        guard let data = parseData(for: KanjiData.self, json: "KanjiList") else {
            return []
        }
        return parseAndReformateKanjis(data: data)
    }

    var groups : [Group] {
        return createGroupes()
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
                let groupName = KanjiGroups.init(rawValue: kanji.level)
                let kanjiString = kanji.kanji
                let onyomi = kanji.onyomi.split(separator: ",")
                let kunyomi = kanji.kunyomi.split(separator: ",")
                let traduction = kanji.traduction.split(separator: ",")
                let reformatedKanji = Kanji(id: id, groupName: groupName!, value: kanjiString, onyomi: onyomi, kunyomi: kunyomi, traduction: traduction)
                kanjisConstructor.append(reformatedKanji)
            }
            return kanjisConstructor
        }catch {
            return []
        }
    }

    private func createGroupes() -> [Group]{
        var groupDict = [ KanjiGroups.N5 : [Int](), KanjiGroups.N4 : [Int](), KanjiGroups.N3 : [Int](),
        KanjiGroups.N2 : [Int](), KanjiGroups.N1 : [Int]()]
        var groups : [Group] = []

        for kanji in kanjis {
            groupDict[kanji.groupName]?.append(kanji.id)
        }

        for group in groupDict {
            guard let firstKanjiID = group.value.first, let lastKanjiID = group.value.last else {
                return []
            }

            groups.append(Group(groupName: group.key.rawValue, groupElementRange: (firstKanjiID, lastKanjiID)))
        }

        return groups
    }
}
