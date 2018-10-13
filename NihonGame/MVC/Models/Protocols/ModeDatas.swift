//
//  Mode.swift
//  NihonGame
//
//  Created by Nicolas on 01/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol ModeDatas {
    var name : String { get }
    /** Order of the datas Components */
    var dataNameOrder : [String] { get }
    /** Allow The Game The correctly Random both components of que question
     (The game cannot random two element in the same index of the second array)
     */
    var dataNames : [[String]] { get }
    var datas : [GameData] { get }
    var groupJSON : String { get }
    var dataJSON : String { get }
    func parseGameData()
    func getGroupJSON() -> String
    func getDatas() -> [GameData]
}

extension ModeDatas {
    func getGroupJSON() -> String {
        return groupJSON
    }

    func getDatas() -> [GameData] {
        return datas
    }
}
