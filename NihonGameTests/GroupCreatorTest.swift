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
        let kanjiData = KanjiData()
        let kanjis = kanjiData.datas
        groups = GroupCreator().createGroups(dataToSplit: kanjis, groupName: kanjiData.groupNames)
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

}
