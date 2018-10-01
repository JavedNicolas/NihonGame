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
    private var levelData : [GameData] = []
    private var question : Question?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        initLevel()
    }

    func initLevel() {
        guard let level = level, let currentModeID = tabBarController?.selectedIndex else {
            return
        }

        let modes = gameModes.getGameModes()
        let modesDataConstructor = gameModes.getModeData(id: currentModeID)
        let gameDatas = modes[currentModeID].modeData.getDatas()
        levelData = level.setGameDataToUse(gameDatas: gameDatas)
        setQuestion(dataNames: modesDataConstructor.getDataNameAsArray())
    }

    func setQuestion(dataNames: [String]) {
        self.question = Question(levelData: levelData, dataNames: dataNames)
        if let question = question {
            print("Question : \(question.question)\n")
            print("Reponse : \(question.goodAnswer.answerString), de type : \(question.goodAnswer.category)")
        }
    }
}
