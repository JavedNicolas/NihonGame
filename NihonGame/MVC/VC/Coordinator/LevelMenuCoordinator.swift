//
//  LevelMenuCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LevelMenuCoordinator : Coordinator {
    private var currentViewController : UIViewController
    private var levelMenuViewController : LevelMenuViewController
    
    init(currentViewController: UIViewController, group: Group) {
        self.currentViewController = currentViewController
        levelMenuViewController = LevelMenuViewController()
        levelMenuViewController.setGroup(group: group)
    }

    func start() {
        if let navigationController = currentViewController.navigationController {
            navigationController.pushViewController(levelMenuViewController, animated: true)
        }
    }
}
