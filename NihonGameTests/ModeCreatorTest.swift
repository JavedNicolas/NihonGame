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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testGivenWeWantGameModeWhenAskThemThenWeGetAnArrayOfGameModeWithDatasAndNameAndGroups() {
    // Given

    // When and Then
        let modes = ModeCreator()
        let gameModes = modes.getModes()
        XCTAssertNotEqual(gameModes.count, 0)
        for mode in gameModes {
            XCTAssertNotNil(mode.gameModeName)
            XCTAssertNotEqual(mode.gameDatas.count, 0)
            XCTAssertNotEqual(mode.gameModeGroups.count, 0)
        }
    }

}
