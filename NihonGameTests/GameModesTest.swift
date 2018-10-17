//
//  ModeCreatorTest.swift
//  NihonGameTests
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class GameModesTest: XCTestCase {
    let modes = GameModes.shared
    let beforeTestState = GameModes.shared.getGameModes()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // 
    }

    func testGivenWeWantGameModeBeProgressionWhenAskThemThenWeGetAnArrayOfGameMode() {
        // Given
        CoreDataManager.shared.contextForTest()
        for mode in modes.getGameModes() {
            CoreDataManager.shared.deleteMode(modeID: mode.id.int)
        }
        modes.recreatModes()
        
        // When and Then
        let gameModes = modes.getGameModes()
        XCTAssertNotEqual(gameModes.count, 0)
        for mode in gameModes {
            XCTAssertNotNil(mode.name)
            XCTAssertNotNil(mode.getGroups())
            XCTAssertNotNil(mode.getDatas())
        }
    }

    func testGivenWeWantGameModeWithProgressionWhenAskThemThenWeGetAnArrayOfGameModeWithDatasAndNameAndGroups() {
        // Given
        
        // When and Then
        modes.recreatModes()
        let gameModes = modes.getGameModes()
        XCTAssertNotEqual(gameModes.count, 0)
        for mode in gameModes {
            XCTAssertNotNil(mode.name)
            XCTAssertNotNil(mode.getGroups())
            XCTAssertNotNil(mode.getDatas())
        }
    }
}
