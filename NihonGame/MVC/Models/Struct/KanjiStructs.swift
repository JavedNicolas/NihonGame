//
//  KanjiStructs.swift
//  NihonGame
//
//  Created by Nicolas on 12/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct KanjiParsing : Decodable {
    let level : String
    let kanji : String
    let onyomi : String
    let kunyomi : String
    let traduction : String
}


struct Kanji {
    let id : Int
    let level : KanjiLevel
    let kanji : String
    let onyomi : [Substring]
    let kunyomi : [Substring]
    let traduction : [Substring]
}
