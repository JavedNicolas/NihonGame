//
//  ParsingStructs.swift
//  NihonGame
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class KanjiData : GameDataParsing, GameMode {
    // MARK: - Attributs
    var groupName : String = "Kanji".localize()
    var kanjis: [Kanji] = []
    var groups : [Group] = []

    // MARK: - init
    init() {
        self.kanjis = parseAndReformateKanjis()
        self.groups = createGroupes()
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
            for (index, kanji) in kanjiParsed.enumerated() {
                let id = index + 1
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

    /** Init groups from the kanjis */
    private func createGroupes() -> [Group]{
        let groupNames = ["N5","N4","N3","N2","N1"]
        return GameDataGroupCreator().createGroups(dataToSplit: kanjis, groupName: groupNames)
    }
}
