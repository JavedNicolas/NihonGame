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
    internal var groupTableView : MenuTableView?
    
    override func viewDidLoad() {
        self.view.setNihonGameBackground()
        if let gameMode = gameMode, let groups = gameMode.getGroups() {
            groupItems = groups
            title = gameMode.name
            createTableView()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if let groupTableView = groupTableView {
            groupTableView.reloadData()
        }
    }

    func setGameMode(gameMode: GameMode){
        self.gameMode = gameMode
    }

    func createTableView() {
        groupTableView = MenuTableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        if let gameButtonTableView = groupTableView{
            gameButtonTableView.set(delegate: self, datasource: self, cellType: GroupMenuTableViewCell.self, identifier: "GroupMenuCell")
            self.view.addSubview(gameButtonTableView)
            gameButtonTableView.setMenuConstraints(view: view, topElementAnchor: view.topAnchor, bottomElementAnchor: view.bottomAnchor)
        }

    }
}
