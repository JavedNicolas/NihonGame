//
//  GameViewController.swift
//  NihonGame
//
//  Created by Nicolas on 04/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var level : Level?
    var question : Question? = nil {
        didSet{
            if let question = question {
                view.addSubview(SQModeView(frame: self.view.frame, question: question))
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

}
