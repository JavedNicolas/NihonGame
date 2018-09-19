//
//  GroupLevelCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 19/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GroupLevelCoordinator : Coordinator {
    private var groupLevelViewController : GroupLevelViewController
    private var currentViewController : UIViewController
    private var gameMode : GameMode

    init(currentViewController : UIViewController, gameMode: GameMode) {
        self.currentViewController = currentViewController
        self.gameMode = gameMode
        groupLevelViewController = GroupLevelViewController()
    }

    func start() {
        groupLevelViewController.setGameMode(gameMode: gameMode)
        currentViewController.present(groupLevelViewController, animated: true, completion: nil)
    }
}
