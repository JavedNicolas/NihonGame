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
    
    init(currentViewController: UIViewController, levels : [Level]) {
        self.currentViewController = currentViewController
        levelMenuViewController = LevelMenuViewController()
        levelMenuViewController.setLevels(levels: levels)
    }

    func start() {
        currentViewController.present(levelMenuViewController, animated: true, completion: nil)
    }
}
