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
    let modeID = 0

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        coreDataManager.contextForTest()
    }

    override func tearDown() {
        for gameMode in GameModes.shared.getGameModes() {
            coreDataManager.deleteMode(modeID: gameMode.id)
        }
    }

    func createDataInCoreDataForLevel() {
        let gameMode = GameModes.shared.getGameModes()
        coreDataManager.contextForTest()
        coreDataManager.saveProgression(gameMode: gameMode[0])
    }


    func testGivenWeNeedProgressionWhenWeFetchItFromCoreDataThenWeHaveProgression() {
        // Given
        createDataInCoreDataForLevel()

        // When
        let progression = coreDataManager.fetchMenu(modeID: modeID)

        // Then
        XCTAssertNotNil(progression)
    }

    func testGivenWeLaunchTheAppForTheFirstTimeWhenWeTryToAccessCoreDataDatasThenWeFindNothing() {
        // Given
            // in the setup
        // When
        let progression = coreDataManager.fetchMenu(modeID: modeID)

        // Then
        XCTAssertNil(progression)
    }

    func testGivenUserWantToResetAGameModeThenWeRemoveDataFromToMode() {
        // Given
        coreDataManager.contextForTest()
        createDataInCoreDataForLevel()

        // when
        coreDataManager.deleteMode(modeID: modeID)

        // Then
        let progression = coreDataManager.fetchMenu(modeID: modeID)
        XCTAssertNil(progression)

        
    }

}
