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
    private var tabIconsName = ["Game_Icon","Learned_Icon","Settings_Icon"]
    private var tabName = ["Main_Menu_VC".localize(),"Learned_Data_VC".localize(), "Settings_VC".localize()]

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

        tabBarController.viewControllers = tabViewController.enumerated().map{ (index, viewController) in
            viewController.tabBarItem.image = UIImage(named: tabIconsName[index])
            viewController.title = tabName[index]
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.navigationBar.barStyle = UIBarStyle.black
            return navigationController
        }
    }

    private func setTabBarController() {
        tabBarController.tabBar.barStyle = .black
    }
}
