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
        currentViewController.present(gameViewController, animated: true, completion: nil)
    }
}
