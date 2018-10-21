//
//  SwipeQuestionModeView.swift
//  NihonGame
//
//  Created by Nicolas on 20/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SwipeQuestionModeView : UIView, QuestionType {
    // MARK:- Attribut
    /** The view Containing the question */
    private var questionView : SwipeQuestionView?
    private var isCorrect = false
    private let imageLeft = UIImageView(image: UIImage(named: "inCorrect.png"))
    private let imageRight = UIImageView(image: UIImage(named: "Correct.png"))
    var answered = (hasAnswered: false, hasCorrectlyAnswered: false)
    var game: Game? = nil {
        didSet {
            if let game = game, let question = game.getCurrentQuestion() {
                setQuestion(question: question)
                setAnswers(question: question)
                setLevelProgressBar(game: game)
                setInstruction()
            }
        }
    }

    /** set the game Instructions */
    private func setInstruction() {
        let label = UILabel()
        label.text = "Swipe_Question_Text".localize()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 30)
        self.addSubview(label)
        label.setAnchors(top: self.safeTopAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: nil,
                         padding: UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10))
        setSideImageView()
    }

    /** Set the image which indicate which side is for correct answer and bad answer */
    private func setSideImageView() {
        addSubview(imageLeft)
        imageLeft.backgroundColor = DesignConstant.black7Alpha
        imageLeft.layer.cornerRadius = 10
        imageLeft.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        imageLeft.centerView(x: nil, y: centerYAnchor)
        imageLeft.setAnchors(top: nil, leading: self.leadingAnchor, trailing: nil, bottom: nil)

        addSubview(imageRight)
        imageRight.backgroundColor = DesignConstant.black7Alpha
        imageRight.layer.cornerRadius = 10
        imageRight.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        imageRight.centerView(x: nil, y: centerYAnchor)
        imageRight.setAnchors(top: nil, leading: nil, trailing: self.trailingAnchor, bottom: nil)
    }

    // MARK:- setter function
    func setQuestion(question: Question) {
        questionView = SwipeQuestionView(frame: self.frame)
        if let questionView = questionView {
            questionView.setQuestion(text: question.question)
            self.addSubview(questionView)
            questionView.centerView(x: self.centerXAnchor, y: self.centerYAnchor)
            let leftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(userAnswering(_:)))
            leftGestureRecognizer.direction = .left
            let rightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(userAnswering(_:)))
            rightGestureRecognizer.direction = .right
            questionView.addGestureRecognizer(leftGestureRecognizer)
            questionView.addGestureRecognizer(rightGestureRecognizer)
        }
    }

    func setAnswers(question: Question) {
        if let answer = question.answers.randomElement(), let questionView = questionView {
            if question.goodAnswer.answerString == answer.answerString {
                isCorrect = true
            }
            questionView.setAnswer(title: answer.category,text: answer.answerString)
        }
    }

    // MARK:- Answering functions
    /** Set a style to question view based on the sens of the swipe, then move the view */
    private func transformQuestionView(gesture : UISwipeGestureRecognizer) {
        guard let questionView = questionView else { return }
        let translation = gesture.direction

        self.imageLeft.removeFromSuperview()
        self.imageRight.removeFromSuperview()
        if translation == .right {
            questionView.style = .correct
            pushQuestionViewAway(questionView: questionView, answer: true)
        } else if translation == .left {
            questionView.style = .inCorrect
            pushQuestionViewAway(questionView: questionView, answer: false)
        }
    }

    /** Check if the anser is the good one */
    private func answerQuestion() {
        guard let questionView = questionView else { return }
        switch questionView.style {
        case .correct:
            displayUserAnswer(hasCorrectlyAnswered: isCorrect)
            sendNotification()
        case .inCorrect:
            displayUserAnswer(hasCorrectlyAnswered: !isCorrect)
            sendNotification()
        default : break
        }
    }

    /** Move the view according tto the sens of the swipe */
    private func pushQuestionViewAway(questionView: SwipeQuestionView, answer : Bool) {
        UIView.animate(withDuration: 0.2) {
            let sens : CGFloat = (answer ? 1 : -1)
            let xTransform =  sens * self.frame.width + sens * questionView.frame.width
            questionView.transform = CGAffineTransform(translationX: xTransform, y: 0)
        }
    }

    /** display if the user correctly answered the question */
    private func displayUserAnswer(hasCorrectlyAnswered: Bool) {
        answered = (hasAnswered: true, hasCorrectlyAnswered: hasCorrectlyAnswered)
        let imageName = (hasCorrectlyAnswered ? "Correct.png" : "inCorrect.png")
        let reponseImageView = UIImageView(image: UIImage(named: imageName))
        reponseImageView.backgroundColor = DesignConstant.black7Alpha
        reponseImageView.contentMode = .center
        addSubview(reponseImageView)
        reponseImageView.centerView(x: centerXAnchor, y: centerYAnchor)
        reponseImageView.setWidth(width: frame.width / 4)
        reponseImageView.squareSize()
        reponseImageView.layoutIfNeeded()
        reponseImageView.layer.cornerRadius = reponseImageView.frame.width / 2
        UIView.animate(withDuration: 0.8, delay: 1, options: [], animations: {
            reponseImageView.transform = CGAffineTransform(scaleX: self.frame.width, y: self.frame.width)
        }, completion: { _ in
            reponseImageView.removeFromSuperview()
        })
    }

    // MARK:- selector
    @objc func userAnswering(_ sender : UISwipeGestureRecognizer) {
        transformQuestionView(gesture: sender)
        answerQuestion()
    }


}
