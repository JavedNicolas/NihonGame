//
//  Kanjis.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Kanjis : ModeDatas {
    var name: String = "Kanji_Mode_Name".localize()
    internal var datas : [GameData] = []
    internal var dataJSON = KanjiModeJSONs.kanjiJSON
    internal var groupJSON = KanjiModeJSONs.groupsJSON
    internal var dataNamesString: [[String]] = KanjiDataConstant.dataNamesString

    struct KanjiModeJSONs {
        static let kanjiJSON = "KanjiList"
        static let groupsJSON = "KanjiGroupList"
    }

    init() {}

    func parseGameData() {
        let kanjiData = JSONParser(json: dataJSON, withExtension: "json").data
        let kanjisList = parseData(data: kanjiData)

        for kanji in kanjisList {
            let dataAsString = "kanji:\(kanji.kanji);kunyomi:\(kanji.kunyomi);onyomi:\(kanji.onyomi);traduction:\(kanji.traduction)"
            let gameDataParsed = GameDataParsed(jlptLevel: kanji.level, id: kanji.id, learningScore: 0, data: dataAsString)
            let gameData = GameData(context: CoreDataManager.shared.getContext())
            gameData.fill(parsedData: gameDataParsed)
            datas.append(gameData)
        }
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
}
