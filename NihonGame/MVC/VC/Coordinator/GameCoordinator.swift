//
//  GameCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameCoordinator : Coordinator {
    private var currentViewController : UIViewController
    private var gameViewController : GameViewController

    init(currentViewController: UIViewController, level : Level) {
        self.currentViewController = currentViewController
        self.gameViewController = GameViewController()
        gameViewController.level = level
    }

    func start() {
        if let navigationController = currentViewController.navigationController {
            navigationController.pushViewController(gameViewController, animated: true)
        }
    }
}
