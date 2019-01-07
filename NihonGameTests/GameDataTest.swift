//
//  GameDataTest.swift
//  NihonGameTests
//
//  Created by Nicolas on 18/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class GameDataTest : XCTestCase {
    var datas : [GameData]?


    override func setUp() {
        super.setUp()
        let modeDatas = Hiragana()
        modeDatas.parseGameData()
        datas = modeDatas.getDatas()
    }
}
