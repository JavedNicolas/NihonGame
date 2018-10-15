//
//  MainMenuViewController.swift
//  NihonGame
//
//  Created by Nicolas on 08/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    internal var menuName : UILabel?
    internal var gameButtonTableView : MenuTableView?
    internal var menuItems : [GameMode] = []

    override func viewDidLoad() {
        self.title = "Main_Menu_VC".localize()
        self.view.setImageBackground()
        createTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.menuItems = GameModes.shared.getGameModes()
        guard let tableView = gameButtonTableView else {
            self.errorHandling(error: ErrorList.unknowError)
            return
        }

        tableView.reloadData()
    }

    func createTableView() {
        gameButtonTableView = MenuTableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        if let gameButtonTableView = gameButtonTableView {
            gameButtonTableView.set(delegate: self, datasource: self, cellType: ModeMenuTableViewCell.self, identifier: "ModeMenuCell")
            self.view.addSubview(gameButtonTableView)
            gameButtonTableView.setMenuConstraints(view: view, topElementAnchor: view.topAnchor, bottomElementAnchor: view.bottomAnchor)
        }
    }
}

