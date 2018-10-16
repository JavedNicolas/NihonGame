//
//  GameViewController.swift
//  NihonGame
//
//  Created by Nicolas on 04/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    // MARK: Attributs
    private var userAnsweredNotificationName = Notification.Name(rawValue: "UserAnswered")
    private var questionSetNotificationName = Notification.Name(rawValue: "QuestionLoaded")
    private lazy var questionTypes : [QuestionType] = [SQModeView(frame: self.view.frame)]
    private var game : Game?
    var level : Level?
    var questionMode : QuestionType?
    var numberOfQuestionAsked = 0

    // MARK/- VC Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setAndRemoveObservater(set: true)
        initVC()
        guard let level = level else { return }
        self.game = Game(level: level)
        if let game = game, let newGameData = game.needToShowTutorial() {
            showTutorial(gameData: newGameData)
        }
        newQuestion()

    }

    // MARK:- functions
    private func initVC() {
        self.view.setGrandiantBackground(colors: [UIColor.orange.cgColor, UIColor.yellow.cgColor])
        if let tabBarController = tabBarController { tabBarController.tabBar.isHidden = true  }
    }

    override func viewWillDisappear(_ animated: Bool) {
        setAndRemoveObservater(set: false)
        if let tabBarController = tabBarController {
            tabBarController.tabBar.isHidden = false
        }
    }

    func setAndRemoveObservater(set: Bool ) {
        if set {
            NotificationCenter.default.addObserver(self, selector: #selector(setQuestionMode), name: questionSetNotificationName, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(userhasAnswered), name: userAnsweredNotificationName, object: nil)
        }else {
            NotificationCenter.default.removeObserver(self, name: questionSetNotificationName, object: nil)
            NotificationCenter.default.removeObserver(self, name: userAnsweredNotificationName, object: nil)
        }
    }

    func newQuestion() {
        if let game = game {
            game.setNewQuestion()
            self.title = "Current_Question_Number".localize() + " \(game.getNumberOfQuestionAsked())/\(GameConstant.questionsByLevel)"
        }
    }

    @objc func setQuestionMode() {
        guard var questionMode = questionTypes.randomElement(), let game = game else {
            self.errorHandling(error: ErrorList.unknowError)
            return
        }

        questionMode.game = game
        view.addSubview(questionMode.view)
        self.questionMode = questionMode

    }

    func showTutorial(gameData: GameData) {
        let tutorialView = GameDataPresentationViewController()
        tutorialView.gameData = gameData
        tutorialView.navController = self.navigationController
        tutorialView.modalTransitionStyle = .crossDissolve
        tutorialView.modalPresentationStyle = .overCurrentContext
        self.present(tutorialView, animated: true, completion: nil)

    }

    func showEndLevelPopUp() {
        let endLevelViewController = EndLevelViewController()
        endLevelViewController.level = level
        endLevelViewController.modalTransitionStyle = .crossDissolve
        endLevelViewController.modalPresentationStyle = .overCurrentContext
        self.present(endLevelViewController, animated: true, completion: nil)
        endLevelViewController.navController = self.navigationController
    }

    @objc func userhasAnswered() {
        guard let questionMode = questionMode, let game = game else { return }

        if questionMode.answered.hasAnswered {
            let hasCorrectlyAnswered = questionMode.answered.hasCorrectlyAnswered
            game.userAnswered(isCorrect: hasCorrectlyAnswered)
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
                if !self.isLevelOver() {
                    if let questionModeasView = questionMode as? UIView {
                        questionModeasView.removeFromSuperview()
                    }
                    self.newQuestion()
                }
            }
        }
    }

    func isLevelOver() -> Bool {
        if let game = game, game.isLevelOver() {
            if game.isLevelSuccess() {
                game.level.levelfinished()
            }
            CoreDataManager.shared.saveContext()
            showEndLevelPopUp()
            return true
        }
        return false
    }
}
