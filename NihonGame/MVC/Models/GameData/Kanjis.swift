//
//  Kanjis.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

/** This if a class which generate a mode */
class Kanjis : ModeDatas {
    // MARK:- Attributs
    /** The Order in which the data component need to be used*/
    var dataNameOrder = ["kanji","onyomi","kunyomi","traduction"]
    /** Name of the mode */
    var name: String = "Kanji_Mode_Name".localize()
    /** Data names ordered in arrays which determine with which data they can be paired as question / answer */
    lazy var dataNames = [[self.dataNameOrder[0]],[self.dataNameOrder[1],self.dataNameOrder[2],self.dataNameOrder[3]]]
    internal var datas : [GameData] = []
    internal var dataJSON = KanjiModeJSONs.kanjiJSON
    internal var groupJSON = KanjiModeJSONs.groupsJSON

    // MARK:- struct
    struct KanjiModeJSONs {
        static let kanjiJSON = "KanjiList"
        static let groupsJSON = "KanjiGroupList"
    }

    // MARK:- init
    init() {}

    // MARK:- functions
    /**
     Parse Kanji data and create GameDatas
     */
    func parseGameData() {
        let kanjiData = JSONParser(json: dataJSON, withExtension: "json").data
        let kanjisList = parseData(data: kanjiData)

        for kanji in kanjisList {
            let dataAsString = "\(dataNameOrder[0]):\(kanji.kanji);\(dataNameOrder[1]):\(kanji.kunyomi);\(dataNameOrder[2]):\(kanji.onyomi);\(dataNameOrder[3]):\(kanji.traduction)"
            let gameDataParsed = GameDataParsed(id: kanji.id, learningScore: 0, data: dataAsString)
            let gameData = GameData(context: CoreDataManager.shared.getContext())
            gameData.fill(parsedData: gameDataParsed)
            datas.append(gameData)
        }
    }

    /**
     Parse Kanji data

     - Parameters:
     - data : the data parsed by the JSON Parser

     - returns: return an array of KanjiParsing struct
     */
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
