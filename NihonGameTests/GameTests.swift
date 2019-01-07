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
    var level : GameLevel?
    var group : Group?
    let currentModeID = 0
    var currentPath: CurrentMenuPath? = nil
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        GameModes.shared.creatModes()
        let modes = GameModes.shared.getGameModes()
        let mode = modes[currentModeID]
        group = mode.getGroups()![0]
        level = group!.getLevels()![4]
        currentPath = CurrentMenuPath(gameMode: mode, level: level!)
    }
    
    func testGivenUserSelectedALevelThenWeGenerateAGameAndAQuestion() {
        //Given
            //in the setup

        // Then
        let game = Game(currentPath: currentPath!)
        game.setNewQuestion(numberOfBadAnswer: 2)

        XCTAssertNotNil(game)
        XCTAssertNotNil(game.getCurrentQuestion())
    }

    func testGivenUserAnsweredToTheQuestionCorrectlyIThenWeUpgradeScores() {
        // Given
        let game = Game(currentPath: currentPath!)
        game.setNewQuestion(numberOfBadAnswer: 2)
        // Then
        game.userAnswered(isCorrect: true)
        XCTAssertNotEqual(0, game.level.score)
    }

    func testGivenUserDidNotAnsweredToTheQuestionCorrectlyIThenWeUpgradeScores() {
        // Given
        let game = Game(currentPath: currentPath!)

        // Then
        game.userAnswered(isCorrect: false)
        XCTAssertEqual(0, game.level.score)
    }

    func testGiveTheUserHasAnsweredAndTheGameIsOverWhenWeCheckIfTheUserSuccessedThenItReturnTrueAndUnlockNextLevel() {
        // Given
        let game = Game(currentPath: currentPath!)
        for _ in 0..<GameConstant.questionsByLevel {
            game.userAnswered(isCorrect: true)
            game.setNewQuestion(numberOfBadAnswer: 2)
        }
        game.level.levelFinished()
        XCTAssertTrue(game.isLevelOver())
        XCTAssertTrue(game.level.done)
    }

    func testGiveTheUserHasAnsweredAndTheGameIsOverAndTheGameIsTheLastofTheGroupWhenWeCheckIfTheUserSuccessedThenItReturnTrueAndUnlockNextGroup() {
        // Given
        level = group!.getLevels()!.last
        let game = Game(currentPath: currentPath!)

        for _ in 0..<GameConstant.questionsByLevel {
            game.userAnswered(isCorrect: true)
            game.setNewQuestion(numberOfBadAnswer: 2)
        }

        game.level.levelFinished()
        XCTAssertTrue(game.isLevelOver())
        XCTAssertTrue(game.level.done)
    }

    func testGiveTheUserHasAnsweredAndTheGameIsOverWhenWeCheckIfTheUserSuccessedThenItReturnFalse() {
        // Given
        let game = Game(currentPath: currentPath!)
        for _ in 0..<GameConstant.questionsByLevel {
            game.userAnswered(isCorrect: false)
            game.setNewQuestion(numberOfBadAnswer: 2)
        }
        XCTAssertTrue(game.isLevelOver())
        XCTAssertFalse(game.level.done)
    }

    func testGivenTheLevelJustStartedWhenItLaunchThenTheLevelNeedATutorial() {
        // Given
        level?.newGameData?.learningScore = 0

        // then
        let game = Game(currentPath: currentPath!)

        // When
        XCTAssertNotNil(game.needToShowTutorial())
    }

    func testGivenTheLevelJustStartedButUserHasAlreadyplayedItWhenItLaunchThenTheLevelDontNeedATutorial() {
        // Given

        // then
        let game = Game(currentPath: currentPath!)
        game.level.changeScore(increase: true)
        game.level.newGameData?.learningScore = 10
        // When
        XCTAssertNil(game.needToShowTutorial())
    }
    
}
