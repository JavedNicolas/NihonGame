//
//  Group.swift
//  NihonGame
//
//  Created by Nicolas on 12/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Group {
    var jlptLevel : KanjiLevel
    var kanjiRange : (Int, Int)
    //var levels : [Level]

    init(jlptLevel: KanjiLevel, kanjiRange: (Int, Int)){
        self.jlptLevel = jlptLevel
        self.kanjiRange = kanjiRange
    }
    
}
