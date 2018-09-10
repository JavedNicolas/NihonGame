//
//  ParsingStructs.swift
//  NihonGame
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct KanjiStruct : Decodable {
    var level : String?
    var kanji : String?
    var onyomi : String?
    var kunyomi : String?
    var traduction : String?
}

class Kanji : GameData {
    var kanjistruct: [KanjiStruct]
    init(parsedData : [KanjiStruct]) {
        self.kanjistruct = parsedData
    }
}
