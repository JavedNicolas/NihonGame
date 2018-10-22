//
//  QuestionType.swift
//  NihonGame
//
//  Created by Nicolas on 04/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

protocol QuestionType {
    /** number of bad answer to generate */
    var numberOfBadAnswer : Int { get }
    var notificationNameString : String { get }
    /** The user answer result */
    var answered : (hasAnswered: Bool, hasCorrectlyAnswered: Bool) { get }
    /** The height of the level progression bar */
    var barHeight : CGFloat { get}
    /** the current view */
    var game : Game? { get set }
    var view : UIView { get }
    /** setting the question view(s) */
    func setQuestion(question: Question)
    /** setting the answer(s) */
    func setAnswers(question: Question)
    func setLevelProgressBar(game: Game)
    func sendNotification()
}

extension QuestionType {
    var notificationNameString : String {
        return "UserAnswered"
    }

    var barHeight : CGFloat {
        return 70
    }

    func getNumberOfBadAnswer() -> Int {
        return numberOfBadAnswer
    }
}

extension QuestionType where Self : UIView {
    var view : UIView {
        return self
    }

    /**
     Set the progression bar with data from the current Game

     - Parameters:
        - game : The current Game
     */
    func setLevelProgressBar(game: Game){
        let frame = CGRect(x: 0, y: self.frame.height - barHeight, width: self.frame.width, height: barHeight)
        let levelProgressionBar = LevelScoreDisplayBar(frame: frame, game: game)
        addSubview(levelProgressionBar)
    }

    /** The notification saying that the user has answered */
    func sendNotification() {
        let notificationName = Notification.Name(self.notificationNameString)
        let notification = Notification(name: notificationName)
        NotificationCenter.default.post(notification)
    }
}
