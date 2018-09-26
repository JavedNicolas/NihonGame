//
//  GroupLevelViewController.swift
//  NihonGame
//
//  Created by Nicolas on 18/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GroupMenuViewController : UIViewController {
    internal var groupItems : [Group]?
    private var gameMode: GameMode?
    internal var menuName : UILabel?
    internal var gameButtonTableView : MenuTableView?
    
    override func viewDidLoad() {
        self.view.setNihonGameBackground()
        if let gameMode = gameMode {
            groupItems = gameMode.groups
            createMenuTitle()
            createTableView()
        }
    }

    func setGameMode(gameMode: GameMode){
        self.gameMode = gameMode
    }

    func createMenuTitle() {
        menuName = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        guard let menuName = menuName else {
            return
        }
        menuName.text = "Kanji_Mode_Menu".localize()
        menuName.textAlignment = .center
        view.addSubview(menuName)
        menuName.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor,
                            trailing: view.trailingAnchor, bottom: nil, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }

    func createTableView() {
        gameButtonTableView = MenuTableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        if let gameButtonTableView = gameButtonTableView, let menuName = menuName {
            gameButtonTableView.set(delegate: self, datasource: self, cellType: GroupMenuTableViewCell.self, identifier: "GroupMenuCell")
            self.view.addSubview(gameButtonTableView)
            gameButtonTableView.setMenuConstraints(view: view, topElementAnchor: menuName.bottomAnchor, bottomElementAnchor: view.bottomAnchor)
        }

    }
}
