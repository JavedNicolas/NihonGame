//
//  GameCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameCoordinator : Coordinator {
    // MARK: attributs
    private var currentViewController : UIViewController
    private var gameViewController : GameViewController

    // MARK:- init
    init(currentViewController: UIViewController, level : Level) {
        self.currentViewController = currentViewController
        self.gameViewController = GameViewController()
        gameViewController.level = level
    }

    // MARK:- functions
    /** launch the viewController */
    func start() {
        if let navigationController = currentViewController.navigationController {
            navigationController.pushViewController(gameViewController, animated: true)
        }
    }
}
