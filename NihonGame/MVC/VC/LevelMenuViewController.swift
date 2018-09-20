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
    private var menuName : UILabel?
    private var levelCollectionView : LevelCollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setNihonGameBackground()
        createMenuTitle()
        setCollectionView()
    }

    func setLevels(levels: [Level]) {
        self.levels = levels
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

    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 50, height: 50)
        levelCollectionView = LevelCollectionView(frame: self.view.frame, collectionViewLayout: layout)
        if let menuName = menuName, let levelCollectionView = levelCollectionView {
            self.view.addSubview(levelCollectionView)
            levelCollectionView.set(delegate: nil, dataSource: self)
            levelCollectionView.setConstraint(view: self.view, topAnchor: menuName.bottomAnchor, bottomAnchor: self.view.bottomAnchor)
        }
    }
}
