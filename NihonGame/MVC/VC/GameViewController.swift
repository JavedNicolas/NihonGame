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
    var question : Question? = nil {
        didSet{
            if let question = question {
                let questionMode = SQModeView(frame: self.view.frame)
                questionMode.question = question
                NotificationCenter.default.addObserver(self, selector: #selector(userhasAnswered), name: notificationName, object: nil)
                view.addSubview(questionMode)
                self.questionMode = questionMode
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
        initLevel()
    }

    func initLevel() {
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

    @objc func userhasAnswered() {
        if let questionMode = questionMode{
            if questionMode.answered.hasAnswered {
                let popUpImage = PopUpImageView(parentframe: self.view.frame, size: CGSize(width: self.view.frame.width, height: 100))
                if questionMode.answered.hasCorrectlyAnswered {
                    popUpImage.image = UIImage(named: "Correct")!
                }else {
                    popUpImage.image = UIImage(named: "NotCorrect")!
                }

                if let questionModeasView = questionMode as? UIView {
                    questionModeasView.removeFromSuperview()
                    self.view.addSubview(popUpImage)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                    popUpImage.removeFromSuperview()
                    self.initLevel()
                }
            }
        }
    }

}
