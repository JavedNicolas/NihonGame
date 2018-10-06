//
//  SimpleQuestionMode.swift
//  NihonGame
//
//  Created by Nicolas on 04/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SQModeView: UIView, QuestionType {
    // Mark:- Attributs
    private lazy var rectanglePadding = self.frame.width / 10
    private let answerViewColor = [[UIColor.orange.cgColor, UIColor.orange.cgColor],
                                   [UIColor.blue.cgColor, UIColor.blue.cgColor],
                                   [UIColor.green.cgColor, UIColor.green.cgColor],
                                   [UIColor.brown.cgColor, UIColor.brown.cgColor]]
    private lazy var topAnchors  = [self.safeTopAnchor, self.topAnchor, self.centerYAnchor, self.centerYAnchor]
    private lazy var leadingAnchors = [self.leadingAnchor, self.centerXAnchor, self.leadingAnchor, self.centerXAnchor]
    private lazy var trailingAnchors = [self.centerXAnchor, self.trailingAnchor, self.centerXAnchor, self.trailingAnchor]
    private lazy var bottomAnchors = [self.centerYAnchor, self.centerYAnchor, self.bottomAnchor, self.bottomAnchor]
    private lazy var leftPadding : [CGFloat] = [0, CGFloat(-rectanglePadding), 0, CGFloat(rectanglePadding) ]
    private lazy var rightPadding : [CGFloat] = [CGFloat(rectanglePadding), 0, CGFloat(-rectanglePadding), 0 ]
    var notificationNameString: String = "UserAnswered"
    var answerViews = [SQAnswerView]()
    var question : Question? = nil {
        didSet {
            if let question = question {
                setAnswers(question: question)
                setQuestion(question: question)
            }
        }
    }
    var answered = (hasAnswered: false, hasCorrectlyAnswered: false)

    //Mark:- Functions
    func setQuestion(question: Question) {
        let circleSize = CGFloat(200)
        let questionCircleRect = CGRect(x: (frame.width / 2) - (circleSize / 2), y: (frame.height / 2) - (circleSize / 2),
                                        width: circleSize, height: circleSize)
        let questionView = SQQuestionView(frame: questionCircleRect, question: question.question)
        questionView.backgroundColor = .clear
        addSubview(questionView)
    }

    func setAnswers(question: Question) {
        var answers = question.badAnswers
        answers.append(question.goodAnswer)
        answers.shuffle()

        for (index, answer) in answers.enumerated() {
            let answerView = setAnswerView(answer: answer)
            self.addSubview(answerView)
            answerView.setAnchors(top: topAnchors[index], leading: leadingAnchors[index], trailing: trailingAnchors[index], bottom: bottomAnchors[index],
                                  padding: UIEdgeInsets(top: 0, left: leftPadding[index], bottom: 0, right: rightPadding[index]))
            answerView.setFrameFromConstraint()
            answerView.setGrandiantBackground(colors: answerViewColor[index])
            answerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userAnswered(_:))))
            answerViews.append(answerView)
        }
    }

    private func setAnswerView(answer: Answer) -> SQAnswerView {
        let answerRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let answerView = SQAnswerView(frame: answerRect, answer: answer)
        return answerView
    }

    @objc func userAnswered(_ sender: UITapGestureRecognizer) {
        if let answerView = sender.view as? SQAnswerView, let question = question {
            answered.hasAnswered = true
            if answerView.getlabelText() == question.goodAnswer.answerString {
                answered.hasCorrectlyAnswered  = true
            }else {
                answered.hasCorrectlyAnswered = false
            }
            let notificationName = Notification.Name(self.notificationNameString)
            let notification = Notification(name: notificationName)
            NotificationCenter.default.post(notification)
        }
    }
}
