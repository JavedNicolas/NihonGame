//
//  Level.swift
//  NihonGame
//
//  Created by Nicolas on 18/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Level : GameDataGroup {
    var groupName : String
    var groupElementRange : (Int, Int)

    init(name: String, range: (Int, Int)) {
        self.groupName = name
        self.groupElementRange = range
    }
}
