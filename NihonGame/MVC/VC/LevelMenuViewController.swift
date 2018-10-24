//
//  LevelMenuViewController.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LevelMenuViewController : UIViewController {
    // MARK:- Attributs
    internal var levels : [GameLevel]?
    private var group : Group?
    private var menuName : UILabel?
    private var levelCollectionView : LevelCollectionView?

    // MARK:- functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setImageBackground()
        if let group = group {
            self.title = group.name
        }
        setCollectionView()
    }

    override func viewWillAppear(_ animated: Bool) {
        if let levelCollectionView = levelCollectionView {
            levelCollectionView.reloadData()
        }
    }

    func setGroup(group: Group) {
        self.group = group
        if let levels = group.getLevels() {
            self.levels = levels
        }
    }

    /** set the table view containing the menu */
    func setCollectionView() {
        if levelCollectionView == nil {
            levelCollectionView = LevelCollectionView(view: self.view)
        }
        if let levelCollectionView = levelCollectionView {
            self.view.addSubview(levelCollectionView)
            levelCollectionView.set(delegate: self, dataSource: self)
            levelCollectionView.setConstraint(view: self.view, topAnchor: view.topAnchor, bottomAnchor: self.view.bottomAnchor)
        }
    }
}
