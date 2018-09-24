//
//  GroupLevelCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 19/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GroupMenuCoordinator : Coordinator {
    private var groupLevelViewController : GroupMenuViewController
    private var currentViewController : UIViewController
    private var gameMode : GameMode

    init(currentViewController : UIViewController, gameMode: GameMode) {
        self.currentViewController = currentViewController
        self.gameMode = gameMode
        groupLevelViewController = GroupMenuViewController()
    }

    func start() {
        groupLevelViewController.setGameMode(gameMode: gameMode)
        currentViewController.present(groupLevelViewController, animated: true, completion: nil)
    }
}