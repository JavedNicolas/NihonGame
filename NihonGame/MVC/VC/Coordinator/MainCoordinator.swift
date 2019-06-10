//
//  MainCoordinator.swift
//  NihonGame
//
//  Created by Nicolas on 17/01/2019.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit

class MainCoordinator : Coordinator {
    // MARK:- Attributs
    private var appDelegate : AppDelegate
    private var loginViewController : LoginViewController!

    // MARK:- init
    init(appDelegate: AppDelegate){
        self.appDelegate = appDelegate
        loginViewController = LoginViewController()
    }

    // MARK:- functions
    /** launch the viewController */
    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window!.rootViewController = loginViewController
        appDelegate.window!.makeKeyAndVisible()
    }
}
