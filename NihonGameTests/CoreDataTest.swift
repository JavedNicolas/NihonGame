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
    let coreDataManager = CoreDataManager()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    func createDataInCoreDataForLevel() {
        let coreDataManager = CoreDataManager()
        let gameMode = GameModes.shared.getGameModes()
        coreDataManager.saveProgression(gameMode: gameMode[0])
    }


    func testGivenWeNeedProgressionWhenWeFetchItFromCoreDataThenWeHaveProgression() {
        // Given
        let coreDataManager = CoreDataManager()
        coreDataManager.contextForTest()
        createDataInCoreDataForLevel()

        // When
        let progression = coreDataManager.fetchMenu(modeID: 0)

        // Then
        XCTAssertNotNil(progression)
    }

}
