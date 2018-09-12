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

    var kanjiData : KanjiData?
    
    override func setUp() {
        super.setUp()
        kanjiData = KanjiData()
    }

    func testGivenWeWantAllAvailableKanjiWhenWeAskForItThenWeGetAnArrayOfKanji() {
        // Given

        // When
        let kanjis = kanjiData?.kanjis

        // Then
        XCTAssertNotNil(kanjis)
    }
}
