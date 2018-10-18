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

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the
        CoreDataManager.shared = FakeCoreDataManager()
    }

    func testGivenWeWantGameModeBeProgressionWhenAskThemThenWeGetAnArrayOfGameMode() {
        // Given
        
        // When and Then
        let gameModes = GameModes.shared.getGameModes()
        XCTAssertNotEqual(gameModes.count, 0)
        for mode in gameModes {
            XCTAssertNotNil(mode.name)
            XCTAssertNotNil(mode.getGroups())
            XCTAssertNotNil(mode.getDatas())
        }
    }
}
