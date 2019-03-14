//
//  MainCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 13/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class StandardModeMainCoordinator : Coordinator {
    // MARK:- Attributs
    private var tabBarController = UITabBarController()
    private var currentVC : UIViewController!
    private var tabIconsName = ["Game_Icon","Training_Icon","Learned_Icon","Settings_Icon"]
    private var tabName = ["Main_Menu_VC".localize(),"Training_VC".localize(),"Learned_Data_VC".localize(), "Settings_VC".localize()]

    // MARK:- init
    init(currentVC: UIViewController){
        self.currentVC = currentVC
    }

    // MARK:- functions
    /** launch the viewController */
    func start() {
        if let currentVC = currentVC {
            setTabs()
            setTabBarController()
            currentVC.show(tabBarController, sender: self)
        }
    }

    /** set app tabs*/
    private func setTabs() {

        var tabViewController : [UIViewController] = []
        tabViewController.append(StandarModeMainMenuVC())
        tabViewController.append(TrainingViewController())
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
