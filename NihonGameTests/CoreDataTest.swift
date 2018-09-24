//
//  CoreDataTest.swift
//  NihonGameTests
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class CoreDataTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        CoreDataManager().contextForTest()
    }

    func createDataInCoreDataForKanji() -> [Kanji] {
        var kanjis : [Kanji] = []

        var kanji = Kanji(id: 1, groupName: " ", value: " ", onyomi: [Substring](), kunyomi: [Substring](), traduction: [Substring]())
        kanji.learningScore = 10
        kanjis.append(kanji)

        return kanjis
    }

    func createDataInCoreDataForLevel() -> [Level] {
        var levels : [Level] = []

        var level = Level(groupName: " ", groupElementRange: (0,0))
        level.score = 10
        levels.append(level)

        return levels
    }

    func testGivenWeNeedKanjiProgressionWhenWeFetchItFromCoreDataThenWeHaveKanjiProgression() {
    // Given
        let coreDataManager = CoreDataManager()
        coreDataManager.saveProgression(kanjis: createDataInCoreDataForKanji())

    // When
        let progression = coreDataManager.fetchKanjiProgression()

    // Then
        XCTAssertNotNil(progression)
        
    }

    func testGivenWeNeedLevelProgressionWhenWeFetchItFromCoreDataThenWeHaveLevelProgression() {
        // Given
        let coreDataManager = CoreDataManager()
        coreDataManager.saveProgression(levels: createDataInCoreDataForLevel())

        // When
        let progression = coreDataManager.fetchLevelProgression()

        // Then
        XCTAssertNotNil(progression)

    }

}
