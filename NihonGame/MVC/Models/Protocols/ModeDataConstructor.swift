//
//  Mode.swift
//  NihonGame
//
//  Created by Nicolas on 01/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol ModeDataConstructor {
    var datas : [GameData] { get }
    func getGroupJSON() -> String
    func getDatas() -> [GameData]
}
