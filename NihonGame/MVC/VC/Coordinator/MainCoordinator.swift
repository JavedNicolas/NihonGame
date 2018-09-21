//
//  MainCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 13/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class MainCoordinator : Coordinator {
    private var appDelegate : AppDelegate
    private var mainMenuCoordinator : MainMenuCoordinator?
    private var navigationController = UINavigationController()

    init(appDelegate: AppDelegate){
        self.appDelegate = appDelegate
    }

    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)

        appDelegate.window!.rootViewController = navigationController
        appDelegate.window!.makeKeyAndVisible()
        showMainMenu()
    }

    private func showMainMenu() {
        mainMenuCoordinator = MainMenuCoordinator(window: appDelegate.window!)
        navigationController.viewControllers = [MainMenuViewController()]
        mainMenuCoordinator!.start()
    }
}
