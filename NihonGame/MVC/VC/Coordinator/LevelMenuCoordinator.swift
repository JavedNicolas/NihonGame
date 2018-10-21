//
//  LevelMenuCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LevelMenuCoordinator : Coordinator {
    // MARK:- attributs
    private var currentViewController : UIViewController
    private var levelMenuViewController : LevelMenuViewController

    // MARK:- init
    init(currentViewController: UIViewController, group: Group) {
        self.currentViewController = currentViewController
        levelMenuViewController = LevelMenuViewController()
        levelMenuViewController.setGroup(group: group)
    }

    // MARK:- functions
    /** launch the viewController */
    func start() {
        if let navigationController = currentViewController.navigationController {
            navigationController.pushViewController(levelMenuViewController, animated: true)
        }
    }
}
