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
        self.view.backgroundColor = .white
    }

    override func viewDidAppear(_ animated: Bool) {
        initLevel()
    }

    func initLevel() {
        guard let level = level, let currentModeID = tabBarController?.selectedIndex else {
            return
        }
    }

}
