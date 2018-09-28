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
        initLevel()
    }

    func initLevel() {
        let modes = AppDelegate.modes.getGameModes()
//        guard let level = level, let currentModeID = tabBarController?.selectedIndex else {
//            return
//        }
//
//        let gameDatas = modes[currentModeID].gameDatas
//
//        level.setGameDataToUse(gameDatas: gameDatas)
    }
}
