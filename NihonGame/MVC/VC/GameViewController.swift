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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        initLevel()
    }

    func initLevel() {
        let modes = gameModes.getGameModes()
        guard let level = level, let currentModeID = tabBarController?.selectedIndex else {
            return
        }

        let gameDatas = modes[currentModeID].gameDatas

        let levelData = level.setGameDataToUse(gameDatas: gameDatas)
        print("levelData : ")
        for data in levelData {
            print(data.id)
        }
        let question = levelData[0].getQuestion()
        //print(question.first)
        

    }
}
