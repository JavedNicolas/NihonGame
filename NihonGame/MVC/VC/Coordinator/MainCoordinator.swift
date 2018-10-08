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
    private var tabBarController = UITabBarController()

    init(appDelegate: AppDelegate){
        self.appDelegate = appDelegate
    }

    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        setTabBarController()
        setTabs()
        appDelegate.window!.rootViewController = tabBarController
        appDelegate.window!.makeKeyAndVisible()
    }

    private func setTabs() {
        var tabViewController : [UIViewController] = []
        tabViewController.append(MainMenuViewController())
        tabViewController.append(LearnedDataViewController())
        tabViewController.append(SettingsViewController())

        tabBarController.viewControllers = tabViewController.map{
            let navigationController = UINavigationController(rootViewController: $0)
            navigationController.navigationBar.barStyle = UIBarStyle.black
            return navigationController
        }
    }

    private func setTabBarController() {
        tabBarController.tabBar.barStyle = .black
    }
}
