//
//  Katakana.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

/** This if a class which generate a mode */
class Katakana : ModeDatas {
    // MARK:- attributs
    /** Name of the mode */
    var name: String = "Katakana"
    /** The Order in which the data component need to be used*/
    var dataNameOrder: [String] = ["kana", "prononciation"]
    /** Data names ordered in arrays which determine with which data they can be paired as question / answer */
    lazy var dataNames = [[self.dataNameOrder[0]],[self.dataNameOrder[1]]]
    var datas: [GameData] = []
    var groupJSON: String = KatakanaModeJSONs.groupJSON
    var dataJSON: String = KatakanaModeJSONs.dataJSON

    // MARK:- structs
    struct KatakanaModeJSONs {
        static let groupJSON = "KatakanaGroupList"
        static let dataJSON = "KatakanaList"
    }

    // MARK:- init
    init() {}

    // MARK:- functions
    /**
     Parse Katakana data and create GameDatas
     */
    func parseGameData() {
        let katakanaData = JSONParser(json: dataJSON, withExtension: "json").data
        let katakanasList = parseData(data: katakanaData)

        for katakana in katakanasList {
            let dataAsString = "\(dataNameOrder[0]):\(katakana.kana);\(dataNameOrder[1]):\(katakana.prononciation)"
            let gameDataParsed = GameDataParsed(id: katakana.id, learningScore: 0, data: dataAsString)
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
    private func parseData(data: Data? ) -> [KatakanaParsing] {
        guard let data = data else { return [] }

        do {
            let parsedGroups = try JSONDecoder().decode([KatakanaParsing].self, from: data)
            return parsedGroups
        } catch {
            return []
        }
    }


}
