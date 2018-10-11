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
    var dataNameOrder : [String] { get }
    var datas : [GameData] { get }
    var groupJSON : String { get }
    var dataJSON : String { get }
    var dataNamesString : [[String]] { get }
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
