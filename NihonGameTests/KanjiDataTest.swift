//
//  KanjiDataTest.swift
//  NihonGameTests
//
//  Created by Nicolas on 12/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class KanjiDataTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    func testGivenWeWantAllAvailableKanjiWhenWeAskForItThenWeGetAnArrayOfKanji() {
        // Given

        // When
        let kanjis = KanjiData().datas

        // Then
        XCTAssertNotEqual(kanjis.count, 0)
    }

    func testGivenWeWantToParseDataFromJSONWhenWeGiveWrongBundleThenWeGetANilValue() {
    // Given
        let kanjiData = KanjiData()
    // When
        let parsedData = kanjiData.parseData(for: KanjiDataTest.self, json: "KanjiList")
    // Then
        XCTAssertNil(parsedData)
    }

    func testGivenWeWantToParseDataFromJSONWhenWeGiveWrongJSONThenWeGetANilValue() {
        // Given
        let kanjiData = KanjiData()
        // When
        let parsedData = kanjiData.parseData(for: KanjiData.self, json: "BadJSOName")
        // Then
        XCTAssertNil(parsedData)
    }
}
