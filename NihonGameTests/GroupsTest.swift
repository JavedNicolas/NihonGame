//
//  GroupCreatorTest.swift
//  NihonGameTests
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class GroupCreatorTest: XCTestCase {
    var groups : [Group] = []

    override func setUp() {
        let groupJSON = GameModes.shared.getGameModes()[0].modeData!.getGroupJSON()
        groups = Groups(json: groupJSON).getGroups()
    }

    func testGivenWeHaveGameDatapWhenWeWantToSplitThemToMakeGroupsThenWeGetGroups() {
        // Given
            // in the setup
        // When
            // in the setup
        // Then
        XCTAssertNotEqual(groups.count, 0)
    }

    func testGivenWeHaveGroupsWeCanAccessToTheirNameAndRange() {
        // Given
            // in the setup
        // When
            // in the setup
        // Then
        for group in groups {
            XCTAssertNotNil(group.name)
        }
    }

    func testGivenWeHaveGroupsWeCanAccessTheirLevels() {
        // Given
            // int the setup
        // When
        for group in groups {
            // Then
            XCTAssertNotNil(group.levels)
        }
    }

}
