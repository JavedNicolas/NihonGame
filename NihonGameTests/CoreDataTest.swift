//
//  CoreDataTest.swift
//  NihonGameTests
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class CoreDataTest: XCTestCase {
    let coreDataManager = CoreDataManager.shared
    let modeID = 0

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        coreDataManager.contextForTest()
    }

    override func tearDown() {
        for gameMode in GameModes.shared.getGameModes() {
            coreDataManager.deleteMode(modeID: gameMode.id.int)
        }
    }
}
