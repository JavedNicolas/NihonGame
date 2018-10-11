//
//  QuestionType.swift
//  NihonGame
//
//  Created by Nicolas on 04/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

protocol QuestionType {
    var notificationNameString : String{ get set }
    var answered : (hasAnswered: Bool, hasCorrectlyAnswered: Bool) { get }
    var game : Game? { get }

    func setQuestion(question: Question)
    func setAnswers(question: Question)
}
