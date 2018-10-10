//
//  ModeCreatorTest.swift
//  NihonGameTests
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class ModeCreatorTest: XCTestCase {
    let modes = GameModes.shared

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        CoreDataManager.shared.contextForTest()
        for mode in GameModes.shared.getGameModes() {
            CoreDataManager.shared.deleteMode(modeID: mode.id.int)
        }
    }

    func testGivenWeAskForGameModeInCoreDataWhenItEmptyThenWeDoNotGetGameMode() {
        // Given

        // Then
        let gameModes = modes.getGameModes()
        XCTAssertEqual(gameModes.count, 0)
    }

    func testGivenWeWantGameModeWhenAskThemThenWeGetAnArrayOfGameMode() {
    // Given
        
    // When and Then
        let gameModes = modes.getGameModes()
        XCTAssertNotEqual(gameModes.count, 0)
        for mode in gameModes {
            XCTAssertNotNil(mode.name)
        }
    }

    func testGivenWeWantGameModeWithProgressionWhenAskThemThenWeGetAnArrayOfGameModeWithDatasAndNameAndGroups() {
        // Given

        CoreDataManager.shared.saveContext()
        
        // When and Then
        let gameModes = modes.getGameModes()
        XCTAssertNotEqual(gameModes.count, 0)
        for mode in gameModes {
            XCTAssertNotNil(mode.name)

        }
    }

}
