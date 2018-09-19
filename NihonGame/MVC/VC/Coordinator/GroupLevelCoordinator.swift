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

    init(currentViewController : UIViewController) {
        self.currentViewController = currentViewController
        groupLevelViewController = GroupLevelViewController()
    }

    func start() {
        currentViewController.present(groupLevelViewController, animated: true, completion: nil)
    }
}
