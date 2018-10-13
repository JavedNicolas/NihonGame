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
    let id : Int
}

struct HiraganaParsing : Decodable {
    let kana : String
    let prononciation : String
    let id : Int
}


