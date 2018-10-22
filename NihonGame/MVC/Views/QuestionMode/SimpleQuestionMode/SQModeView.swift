//
//  SimpleQuestionMode.swift
//  NihonGame
//
//  Created by Nicolas on 04/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SQModeView: UIView, QuestionType {
    // MARK:- Answers Anchors arrays
    private lazy var topAnchors  = [self.topAnchor, self.topAnchor, self.centerYAnchor, self.centerYAnchor]
    private lazy var leadingAnchors = [self.leadingAnchor, self.centerXAnchor, self.leadingAnchor, self.centerXAnchor]
    private lazy var trailingAnchors = [self.centerXAnchor, self.trailingAnchor, self.centerXAnchor, self.trailingAnchor]
    private lazy var bottomAnchors = [self.centerYAnchor, self.centerYAnchor, self.bottomAnchor, self.bottomAnchor]
    private lazy var leftPadding : [CGFloat] = [0, CGFloat(-rectanglePadding), 0, CGFloat(rectanglePadding) ]
    private lazy var rightPadding : [CGFloat] = [CGFloat(rectanglePadding), 0, CGFloat(-rectanglePadding), 0 ]
    // MARK:- Attributs
    /** Handle answers rectangle little padding */
    private lazy var rectanglePadding = self.frame.width / 10
    internal var numberOfBadAnswer = 3
    var answerViews = [SQAnswerView]()
    var answered = (hasAnswered: false, hasCorrectlyAnswered: false)
    /** Current game */
    var game : Game? = nil {
        didSet {
            if let game = game, let question = game.getCurrentQuestion() {
                self.setImageBackground(imageName: "background_SQ.png")
                setAnswers(question: question)
                setQuestion(question: question)
                setLevelProgressBar(game: game)
            }
        }
    }

    //MARK:- Setters functions
    func setQuestion(question: Question) {
        let circleSize = 200
        let questionCircleRect = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
        let questionView = SQQuestionView(frame: questionCircleRect, question: question)
        addSubview(questionView)
        questionView.centerView(x: self.centerXAnchor, y: self.centerYAnchor)
    }

    func setAnswers(question: Question) {
        for (index, answer) in question.answers.enumerated() {
            let answerView = setAnswerView(answer: answer)
            self.addSubview(answerView)
            answerView.setAnchors(top: topAnchors[index], leading: leadingAnchors[index], trailing: trailingAnchors[index], bottom: bottomAnchors[index],
                                  padding: UIEdgeInsets(top: 0, left: leftPadding[index], bottom: 0, right: rightPadding[index]))
            answerView.setFrameFromConstraint()
            answerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userAnswered(_:))))
            answerViews.append(answerView)
        }
    }
    
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
            sendNotification()
        }
    }

    // MARK:- Animate Functions
    /** Make the choosed answer blink green if good, or red if bad */
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

    /** make a view blink */
    func makeAnswerBlink(answerView: SQAnswerView, color: UIColor ) {
        for _ in 0...2 {
            UIView.animate(withDuration: 0.25, delay: 0.1, options: [UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
                answerView.backgroundColor = color
            }, completion: nil)
        }
    }
}
