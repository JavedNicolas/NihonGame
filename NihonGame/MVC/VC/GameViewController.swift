//
//  GameViewController.swift
//  NihonGame
//
//  Created by Nicolas on 04/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    private var notificationName = Notification.Name(rawValue: "UserAnswered")
    var level : Level?
    var questionMode : QuestionType?
    var numberOfQuestionAsked = 0
    var question : Question? = nil {
        didSet{
            if let question = question {
                setQuestionMode(question: question)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setGrandiantBackground(colors: [UIColor.orange.cgColor, UIColor.yellow.cgColor])
        if let tabBarController = tabBarController {
            tabBarController.tabBar.isHidden = true
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        if let tabBarController = tabBarController {
            tabBarController.tabBar.isHidden = false
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        initQuestion()
    }

    func initQuestion() {
        guard let level = level, let currentModeID = tabBarController?.selectedIndex else {
            return
        }
        let gameModeConstructor = GameModes.shared.getModeData(id: currentModeID)
        let gameData = gameModeConstructor.getDatas()
        let dataNames = gameModeConstructor.getDataNameAsArray()
        if let allAnswers = gameModeConstructor.getAnswerList() {
            self.question = Question(levelData: level.setGameDataToUse(gameDatas: gameData), dataNames: dataNames, AllAnswers: allAnswers)
        }
    }

    func setQuestionMode(question: Question) {
        let questionMode = SQModeView(frame: self.view.frame)
        questionMode.question = question
        // Handle duplicate of the observer
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(userhasAnswered), name: notificationName, object: nil)
        view.addSubview(questionMode)
        self.questionMode = questionMode
    }

    @objc func userhasAnswered() {
        if let questionMode = questionMode{
            if questionMode.answered.hasAnswered {
                numberOfQuestionAsked += 1
                let hasCorrectlyAnswered = questionMode.answered.hasCorrectlyAnswered
                let popUpImageView = setAnswerStatutView(isCorrect: hasCorrectlyAnswered)
                updateScores(AnswerIsCorrect: hasCorrectlyAnswered)
                if let questionModeasView = questionMode as? UIView {
                    questionModeasView.removeFromSuperview()
                    self.view.addSubview(popUpImageView)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                    popUpImageView.removeFromSuperview()
                    if !self.isLevelOver() {
                        self.initQuestion()
                    }
                }
            }
        }
    }

    func isLevelOver() -> Bool {
        if numberOfQuestionAsked >= GameConstant.questionsByLevel {
            let popUpMessage = PopUpMessageView(parentframe: self.view.frame, size: CGSize(width: self.view.frame.width, height: 100))
            if let level = level, level.score >= GameConstant.levelCompleteScore {
                popUpMessage.message = "Level_Success".localize()
                level.done = true
            }else {
                popUpMessage.message = "Level_Failed".localize()
            }
            self.view.addSubview(popUpMessage)
            return true
        }
        return false

    }

    private func updateScores(AnswerIsCorrect: Bool) {
        guard let question = question else {
            return
        }
        if let level = level{
            question.dataChoosed.changeScore(increase: AnswerIsCorrect)
            level.changeScore(increase: AnswerIsCorrect)
        }
    }

    private func setAnswerStatutView(isCorrect: Bool) -> PopUpImageView{
        let popUpImageView = PopUpImageView(parentframe: self.view.frame, size: CGSize(width: self.view.frame.width, height: 100))
        var image = UIImage(named: "NotCorrect")
        if isCorrect {
            image = UIImage(named: "Correct")
        }

        if let image = image {
            popUpImageView.image = image
        }

        return popUpImageView
    }
}
