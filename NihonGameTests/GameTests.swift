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
    let currentModeID = 0
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let modes = GameModes.shared.getGameModes()
        let mode = modes[currentModeID]
        let group = mode.groups[0]
        level = group.levels[5]
    }
    
    func testGivenUserSelectedALevelThenWeGenerateAGameAndAQuestion() {
        //Given
            //in the setup

        // Then
        let game = Game(currentModeID: currentModeID, level: level!)

        XCTAssertNotNil(game)
        XCTAssertNotNil(game.getCurrentQuestion())
    }

    func testGivenUserAnsweredToTheQuestionIfTheResponseIsCorrectThenWeReturnTrue() {
        // Given
        let game = Game(currentModeID: currentModeID, level: level!)
        let answer = game.getCurrentQuestion()!.goodAnswer

        // Then
        let isCorrectAnswer = game.isCorrectAnswer(answer: answer)
        XCTAssert(isCorrectAnswer)
    }

    func testGivenUserAnsweredToTheQuestionIfTheResponseIsNotCorrectThenWeReturnTrue() {
        // Given
        let game = Game(currentModeID: currentModeID, level: level!)
        let answer = game.getCurrentQuestion()!.badAnswers[0]

        // Then
        let isCorrectAnswer = game.isCorrectAnswer(answer: answer)
        XCTAssertFalse(isCorrectAnswer)
    }
    
}
