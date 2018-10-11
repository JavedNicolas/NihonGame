//
//  LevelTest.swift
//  NihonGameTests
//
//  Created by Nicolas on 10/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class LevelTest: XCTestCase {
    var level : Level?
    let currentModeID = 0
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        CoreDataManager.shared.contextForTest()
        let modes = GameModes.shared.getGameModes()
        let mode = modes[currentModeID]
        GameModes.shared.currentMode = mode
        let group = mode.getGroups()![0]
        level = group.getLevels()![5]
    }

    func testGiveTheLevelisOverWhenWeSetScoreAndStarsThenWeCanFetchThemAndTheyAreNotNil() {
        // Given
        level?.score = 600
        level?.done = true

        // When
        level?.levelfinished()

        // Then
        XCTAssertNotEqual(0, level?.score)
        XCTAssertNotEqual(0, level?.stars)
    }

}
