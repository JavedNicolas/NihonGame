//
//  NihonGameTests.swift
//  NihonGameTests
//
//  Created by Nicolas on 04/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import XCTest
@testable import NihonGame

class NihonGameTests: XCTestCase {
    var level : Level?
    var group : Group?
    let currentModeID = 0
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        CoreDataManager.shared.contextForTest()
        GameModes.shared.createModesList()
        let modes = GameModes.shared.getGameModes()
        let mode = modes[currentModeID]
        GameModes.shared.currentMode = mode
        group = mode.getGroups()![0]
        level = group!.getLevels()![4]
    }
    
    func testGivenUserSelectedALevelThenWeGenerateAGameAndAQuestion() {
        //Given
            //in the setup

        // Then
        let game = Game(level: level!)

        XCTAssertNotNil(game)
        XCTAssertNotNil(game.getCurrentQuestion())
    }

    func testGivenUserAnsweredToTheQuestionCorrectlyIThenWeUpgradeScores() {
        // Given
        let game = Game(level: level!)

        // Then
        game.userAnswered(isCorrect: true)
        XCTAssertNotEqual(0, game.level.score)
    }

    func testGivenUserDidNotAnsweredToTheQuestionCorrectlyIThenWeUpgradeScores() {
        // Given
        let game = Game(level: level!)

        // Then
        game.userAnswered(isCorrect: false)
        XCTAssertEqual(0, game.level.score)
    }

    func testGiveTheUserHasAnsweredAndTheGameIsOverWhenWeCheckIfTheUserSuccessedThenItReturnTrueAdnUnlockNextLevel() {
        // Given
        let game = Game(level: level!)
        for _ in 0..<GameConstant.questionsByLevel {
            game.userAnswered(isCorrect: true)
            game.setNewQuestion()
        }
        game.level.unlockNextLevel()
        XCTAssertTrue(game.isLevelOver())
        XCTAssertTrue(game.isLevelDone())
    }

    func testGiveTheUserHasAnsweredAndTheGameIsOverAndTheGameIsTheLastofTheGroupWhenWeCheckIfTheUserSuccessedThenItReturnTrueAdnUnlockNextGroup() {
        // Given
        level = group!.getLevels()!.last
        let game = Game(level: level!)

        for _ in 0..<GameConstant.questionsByLevel {
            game.userAnswered(isCorrect: true)
            game.setNewQuestion()
        }

        game.level.unlockNextLevel()
        XCTAssertTrue(game.isLevelOver())
        XCTAssertTrue(game.isLevelDone())
    }

    func testGiveTheUserHasAnsweredAndTheGameIsOverWhenWeCheckIfTheUserSuccessedThenItReturnFalse() {
        // Given
        let game = Game(level: level!)
        for _ in 0..<GameConstant.questionsByLevel {
            game.userAnswered(isCorrect: false)
            game.setNewQuestion()
        }
        XCTAssertTrue(game.isLevelOver())
        XCTAssertFalse(game.isLevelDone())
    }

    func testGivenTheLevelJustStartedWhenItLaunchThenTheLevelNeedATutorial() {
        // Given
        level?.score = 0

        // then
        let game = Game(level: level!)

        // When
        XCTAssertNotNil(game.needToShowTutorial())
    }

    func testGivenTheLevelJustStartedButUserHasAlreadyplayedItWhenItLaunchThenTheLevelDontNeedATutorial() {
        // Given
        level?.score = 10

        // then
        let game = Game(level: level!)

        // When
        XCTAssertNil(game.needToShowTutorial())
    }
    
}
