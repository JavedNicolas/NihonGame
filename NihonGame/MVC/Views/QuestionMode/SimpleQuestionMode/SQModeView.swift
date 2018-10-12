//
//  SimpleQuestionMode.swift
//  NihonGame
//
//  Created by Nicolas on 04/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SQModeView: UIView, QuestionType {
    // MARK:- Attributs
    private lazy var rectanglePadding = self.frame.width / 10
    private let answerViewColor = [UIColor.orange, UIColor.blue,
                                   UIColor.purple,UIColor.brown]
    private lazy var topAnchors  = [self.safeTopAnchor, self.topAnchor, self.centerYAnchor, self.centerYAnchor]
    private lazy var leadingAnchors = [self.leadingAnchor, self.centerXAnchor, self.leadingAnchor, self.centerXAnchor]
    private lazy var trailingAnchors = [self.centerXAnchor, self.trailingAnchor, self.centerXAnchor, self.trailingAnchor]
    private lazy var bottomAnchors = [self.centerYAnchor, self.centerYAnchor, self.bottomAnchor, self.bottomAnchor]
    private lazy var leftPadding : [CGFloat] = [0, CGFloat(-rectanglePadding), 0, CGFloat(rectanglePadding) ]
    private lazy var rightPadding : [CGFloat] = [CGFloat(rectanglePadding), 0, CGFloat(-rectanglePadding), 0 ]
    var notificationNameString: String = "UserAnswered"
    var answerViews = [SQAnswerView]()
    var levelProgressionBar : LevelScoreDisplayBar?
    var game : Game? = nil {
        didSet {
            if let game = game, let question = game.getCurrentQuestion() {
                setAnswers(question: question)
                setQuestion(question: question)
                setLevelProgressBar(game: game)
            }
        }
    }

    var answered = (hasAnswered: false, hasCorrectlyAnswered: false)

    //MARK:- Setters functions
    func setQuestion(question: Question) {
        let circleSize = CGFloat(200)
        let questionCircleRect = CGRect(x: (frame.width / 2) - (circleSize / 2), y: (frame.height / 2) - (circleSize / 2),
                                        width: circleSize, height: circleSize)
        let questionView = SQQuestionView(frame: questionCircleRect, question: question)
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
            answerView.backgroundColor = answerViewColor[index]
            answerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userAnswered(_:))))
            answerViews.append(answerView)
        }
    }

    func setLevelProgressBar(game: Game) {
        let barHeight = CGFloat(70)
        let frame = CGRect(x: 0, y: self.frame.height - barHeight, width: self.frame.width, height: barHeight)
        levelProgressionBar = LevelScoreDisplayBar(frame: frame, game: game)
        guard let levelProgressionBar = levelProgressionBar else { return }
        addSubview(levelProgressionBar)
    }

    // MARK:- functions
    private func setAnswerView(answer: Answer) -> SQAnswerView {
        let answerRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let answerView = SQAnswerView(frame: answerRect, answer: answer)
        return answerView
    }

    //MARK: - selector
    @objc func userAnswered(_ sender: UITapGestureRecognizer) {
        if let answerView = sender.view as? SQAnswerView, let game = game , let question = game.getCurrentQuestion(){
            answered.hasAnswered = true
            animateAnswer(userAnswer: answerView, question: question)
            let notificationName = Notification.Name(self.notificationNameString)
            let notification = Notification(name: notificationName)
            NotificationCenter.default.post(notification)
        }
    }

    // MARK:- Animate Functions
    func animateAnswer(userAnswer: SQAnswerView, question: Question) {
        if userAnswer.getlabelText() == question.goodAnswer.answerString {
            answered.hasCorrectlyAnswered  = true
            makeAnswerBlink(answerView: userAnswer, color: .green)
        }else {
            answered.hasCorrectlyAnswered = false
            for answer in answerViews {
                answer.isUserInteractionEnabled = false
                if answer.getlabelText() == question.goodAnswer.answerString {
                    makeAnswerBlink(answerView: answer, color: .green)
                }else {
                    userAnswer.backgroundColor = .red
                }
            }
        }
    }

    func makeAnswerBlink(answerView: SQAnswerView, color: UIColor ) {
        for _ in 0...2 {
            UIView.animate(withDuration: 0.25, delay: 0.1, options: [UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
                answerView.backgroundColor = color
            }, completion: nil)
        }
    }
}
