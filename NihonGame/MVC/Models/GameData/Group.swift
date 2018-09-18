//
//  Group.swift
//  NihonGame
//
//  Created by Nicolas on 12/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Group: GameDataGroup {
    var groupName : String
    var groupElementRange : (Int, Int)
    //var levels : [Level]

    init(name: String, range: (Int, Int)) {
        self.groupName = name
        self.groupElementRange = range
    }
}
