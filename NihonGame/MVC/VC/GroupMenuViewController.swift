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
        if let gameMode = gameMode, let groups = gameMode.groups, let gameModeGroups = groups.allObjects as? [Group]  {
            groupItems = gameModeGroups.sorted(by: { $0.id < $1.id })
            title = gameMode.name
            createTableView()
        }
    }

    func setGameMode(gameMode: GameMode){
        self.gameMode = gameMode
    }

    func createTableView() {
        gameButtonTableView = MenuTableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        if let gameButtonTableView = gameButtonTableView{
            gameButtonTableView.set(delegate: self, datasource: self, cellType: GroupMenuTableViewCell.self, identifier: "GroupMenuCell")
            self.view.addSubview(gameButtonTableView)
            gameButtonTableView.setMenuConstraints(view: view, topElementAnchor: view.topAnchor, bottomElementAnchor: view.bottomAnchor)
        }

    }
}
