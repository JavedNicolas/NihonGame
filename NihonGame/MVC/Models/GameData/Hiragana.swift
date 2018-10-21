//
//  Hiragana.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

/** This if a class which generate a mode */
class Hiragana : ModeDatas {
    // MARK:- Attributs
    /** The Order in which the data component need to be used*/
    var dataNameOrder: [String] = ["kana", "prononciation"]
     /** Name of the mode */
    var name: String = "Hiragana"
    /** Data names ordered in arrays which determine with which data they can be paired as question / answer */
    lazy var dataNames = [[self.dataNameOrder[0]],[self.dataNameOrder[1]]]
    var datas: [GameData] = []
    var groupJSON: String = HiraganaModeJSONs.groupJSON
    var dataJSON: String = HiraganaModeJSONs.dataJSON

    // MARK:- structs
    struct HiraganaModeJSONs {
        static let groupJSON = "HiraganaGroupList"
        static let dataJSON = "HiraganaList"
    }

    // MARK:- init
    init() {}

    // MARK:- functions
    /**
     Parse Hiragana data and create GameDatas
     */
    func parseGameData() {
        let hiraganaData = JSONParser(json: dataJSON, withExtension: "json").data
        let hiraganasList = parseData(data: hiraganaData)

        for hiragana in hiraganasList {
            let dataAsString = "\(dataNameOrder[0]):\(hiragana.kana);\(dataNameOrder[1]):\(hiragana.prononciation)"
            let gameDataParsed = GameDataParsed(id: hiragana.id, learningScore: 0, data: dataAsString)
            let gameData = GameData(context: CoreDataManager.shared.getContext())
            gameData.fill(parsedData: gameDataParsed)
            datas.append(gameData)
        }
    }

    /**
     Parse Hiragana data

     - Parameters:
     - data : the data parsed by the JSON Parser

     - returns: return an array of HiraganaParsing struct
     */
    private func parseData(data: Data? ) -> [HiraganaParsing] {
        guard let data = data else { return [] }

        do {
            let parsedGroups = try JSONDecoder().decode([HiraganaParsing].self, from: data)
            return parsedGroups
        } catch {
            return []
        }
    }


}
