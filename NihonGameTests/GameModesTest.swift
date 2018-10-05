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
        modes.coreDataForTest()
    }

    func testGivenWeWantGameModeWhenAskThemThenWeGetAnArrayOfGameMode() {
    // Given
        
    // When and Then
        let gameModes = modes.getGameModes()
        XCTAssertNotEqual(gameModes.count, 0)
        for mode in gameModes {
            XCTAssertNotNil(mode.name)
            XCTAssertNotEqual(mode.modeData.datas.count, 0)
            XCTAssertNotEqual(mode.groups.count, 0)
        }
    }

    func testGivenWeWantGameModeWithProgressionWhenAskThemThenWeGetAnArrayOfGameModeWithDatasAndNameAndGroups() {
        // Given
        let coreDataManager = CoreDataManager()
        coreDataManager.contextForTest()

        coreDataManager.saveProgression(gameMode: modes.getGameModes()[0])
        
        // When and Then
        let gameModes = modes.getGameModes()
        XCTAssertNotEqual(gameModes.count, 0)
        for mode in gameModes {
            XCTAssertNotNil(mode.name)
            XCTAssertNotEqual(mode.modeData.datas.count, 0)
            XCTAssertNotEqual(mode.groups.count, 0)
        }
    }

}
