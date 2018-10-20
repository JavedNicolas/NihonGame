//
//  QuestionType.swift
//  NihonGame
//
//  Created by Nicolas on 04/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

protocol QuestionType {
    var notificationNameString : String { get }
    var answered : (hasAnswered: Bool, hasCorrectlyAnswered: Bool) { get }
    var barHeight : CGFloat { get}
    var game : Game? { get set }
    var view : UIView { get }
    func setQuestion(question: Question)
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
}

extension QuestionType where Self : UIView {
    var view : UIView {
        return self
    }

    func setLevelProgressBar(game: Game){
        let frame = CGRect(x: 0, y: self.frame.height - barHeight, width: self.frame.width, height: barHeight)
        let levelProgressionBar = LevelScoreDisplayBar(frame: frame, game: game)
        addSubview(levelProgressionBar)
    }

    func sendNotification() {
        let notificationName = Notification.Name(self.notificationNameString)
        let notification = Notification(name: notificationName)
        NotificationCenter.default.post(notification)
    }
}
