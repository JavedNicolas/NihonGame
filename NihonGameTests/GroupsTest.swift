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
        let groupJSON = KanjiModeJSONs.groupsJSON
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

    func testGivenWeHaveGroupsWhenWeWantToUseThemThenTheyHaveNameAndRange() {
        // Given
            // in the setup
        // When
            // in the setup
        // Then
        for group in groups {
            XCTAssertNotNil(group.name)
            XCTAssertNotNil(group.elementRange)
        }
    }

    func testGivenWeHaveGroupsWhenNeedTheirLevelThenWeCanFetchThem() {
        // Given
            // int the setup
        // When
        for group in groups {
            // Then
            XCTAssertNotEqual(0, group.levels.count)
        }
    }

}
