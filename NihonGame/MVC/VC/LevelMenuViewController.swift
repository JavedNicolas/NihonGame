//
//  LevelMenuViewController.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LevelMenuViewController : UIViewController {
    internal var levels : [Level]?
    private var group : Group?
    private var menuName : UILabel?
    private var levelCollectionView : LevelCollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setNihonGameBackground()
        if let group = group {
            self.title = group.name
        }
        setCollectionView()
    }

    func setGroup(group: Group) {
        self.group = group
        if let groupLevels = group.levels?.allObjects as? [Level] {
            self.levels = groupLevels
        }
    }

    func setCollectionView() {
        levelCollectionView = LevelCollectionView(view: self.view)
        if let levelCollectionView = levelCollectionView {
            self.view.addSubview(levelCollectionView)
            levelCollectionView.set(delegate: self, dataSource: self)
            levelCollectionView.setConstraint(view: self.view, topAnchor: view.topAnchor, bottomAnchor: self.view.bottomAnchor)
        }
    }
}
