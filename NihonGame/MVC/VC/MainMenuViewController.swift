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
    internal var gameButtonTableView : MenuTableView?
    internal var backButton : UIButton?
    internal var model : ModeCreator?
    internal var menuItems : [GameMode]?

    override func viewDidLoad() {
        self.view.backgroundColor = .white
        model = ModeCreator(completionHandler: { (menuItems) in
            self.menuItems = menuItems
            self.createMenuTitle()
            self.createTableView()
        })
    }

    func createMenuTitle() {
        menuName = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        guard let menuName = menuName else {
            return
        }
        menuName.text = "Main_Menu_Title".localize()
        menuName.textAlignment = .center
        view.addSubview(menuName)
        menuName.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor,
                            trailing: view.trailingAnchor, bottom: nil, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))

    }

    func createTableView() {
        gameButtonTableView = MenuTableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        if let gameButtonTableView = gameButtonTableView, let menuName = menuName {
            gameButtonTableView.set(delegate: self, datasource: self)
            self.view.addSubview(gameButtonTableView)
            gameButtonTableView.setMenuConstraints(view: view, topElementAnchor: menuName.bottomAnchor, bottomElementAnchor: view.bottomAnchor)
        }

    }
}
