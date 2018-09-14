//
//  MainMenuViewController.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    internal var menuName : UILabel?
    internal var gameButtonTV : UITableView?
    internal var backButton : UIButton?
    internal var model : MainMenuModel?
    internal var menuItems : [GameDataModel]?

    override func viewDidLoad() {
        view.backgroundColor = .white
        model = MainMenuModel(completionHandler: { (menuItems) in
            self.menuItems = menuItems
            self.setView()
        })
    }
}
