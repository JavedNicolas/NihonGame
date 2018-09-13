//
//  MainMenuCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 13/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class MainMenuCoordinator : Coordinator {
    private let presenter : UIWindow

    init(window : UIWindow) {
        self.presenter = window
    }

    func start() {
        navigateToMainMenu()
    }

    private func navigateToMainMenu() {
        let VC = MainMenuViewController(nibName: nil, bundle: nil)
        presenter.rootViewController = VC
    }
}
