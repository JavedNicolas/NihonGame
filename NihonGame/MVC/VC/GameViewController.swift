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
    private lazy var questionTypes : [QuestionType] = []
    private var game : Game?
    var currentPath : CurrentMenuPath?
    var questionMode : QuestionType?
    var numberOfQuestionAsked = 0

    // MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setAndRemoveObservater(set: true)
        initVC()

        guard let currentPath = currentPath else { return }
        self.game = Game(currentPath: currentPath)
        if let game = game, let newGameData = game.needToShowTutorial() {
            showNewGameDataInfos(gameData: newGameData)
        }
        newQuestion()
    }

    private func initVC() {
        self.view.setImageBackground()
        if let tabBarController = tabBarController { tabBarController.tabBar.isHidden = true  }
    }

    override func viewWillDisappear(_ animated: Bool) {
        setAndRemoveObservater(set: false)
        if let tabBarController = tabBarController {
            tabBarController.tabBar.isHidden = false
        }
    }

    /** set a remove the observer the controller use */
    func setAndRemoveObservater(set: Bool ) {
        if set {
            NotificationCenter.default.addObserver(self, selector: #selector(setQuestionMode), name: questionSetNotificationName, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(userhasAnswered), name: userAnsweredNotificationName, object: nil)
        }else {
            NotificationCenter.default.removeObserver(self, name: questionSetNotificationName, object: nil)
            NotificationCenter.default.removeObserver(self, name: userAnsweredNotificationName, object: nil)
        }
    }

    /** generate un new question */
    func newQuestion() {
        questionTypes = [SwipeQuestionModeView(frame: self.view.frame), SQModeView(frame: self.view.frame)]
        if let game = game, let questionMode = questionTypes.randomElement() {
            self.questionMode = questionMode
            let numberOfBadAnswer = questionMode.getNumberOfBadAnswer()
            game.setNewQuestion(numberOfBadAnswer: numberOfBadAnswer)
            self.title = "Current_Question_Number".localize() + " \(game.getNumberOfQuestionAsked())/\(game.level.questionToAsk)"
        }
    }

    /** random a question Mode */
    @objc func setQuestionMode() {
        guard var questionMode = self.questionMode, let game = game, let _ = game.getCurrentQuestion() else {
            self.errorHandling(error: ErrorList.unknowError)
            return
        }

        questionMode.game = game
        view.addSubview(questionMode.view)
    }

    /** Display a modal with the information about the new game Data*/
    func showNewGameDataInfos(gameData: GameData) {
        let newGameDataView = GameDataPresentationViewController()
        newGameDataView.gameData = gameData
        newGameDataView.navController = self.navigationController
        newGameDataView.modalTransitionStyle = .crossDissolve
        newGameDataView.modalPresentationStyle = .overCurrentContext
        self.present(newGameDataView, animated: true, completion: nil)

    }

    /** Display a modal with the end level information */
    func showEndLevelPopUp() {
        guard let game = game else { return }
        let endLevelViewController = EndLevelViewController()
        endLevelViewController.level = game.level
        endLevelViewController.modalTransitionStyle = .crossDissolve
        endLevelViewController.modalPresentationStyle = .overCurrentContext
        self.present(endLevelViewController, animated: true, completion: nil)
        endLevelViewController.navController = self.navigationController
    }

    /**
     Return a bool descripting the state of the game.
     true if the game is over, false if not.
     */
    func isLevelOver() -> Bool {
        if let game = game, game.isLevelOver() {
            game.level.levelFinished()
            if game.level is TrainingLevel {
                navigationController?.popViewController(animated: true)
            }
            showEndLevelPopUp()
            return true
        }
        return false
    }

    // MARK:- selector
    /** handle the user answers */
    @objc func userhasAnswered() {
        guard let questionMode = questionMode, let game = game else { return }

        if questionMode.answered.hasAnswered {
            let hasCorrectlyAnswered = questionMode.answered.hasCorrectlyAnswered
            game.userAnswered(isCorrect: hasCorrectlyAnswered)
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
                if !self.isLevelOver() {
                    if let questionModeasView = questionMode as? UIView {
                        questionModeasView.removeFromSuperview()
                        self.newQuestion()
                    }
                }
            }
        }
    }


}
