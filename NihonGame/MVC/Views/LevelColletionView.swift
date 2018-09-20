//
//  LevelColletionView.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LevelCollectionView : UICollectionView {
    init(view: UIView) {
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)

        let cellSize = view.frame.width / 4
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10

        super.init(frame: frame, collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(delegate : UICollectionViewDelegate?, dataSource: UICollectionViewDataSource?) {
        self.register(LevelMenuCollectionviewCell.self, forCellWithReuseIdentifier: "LevelCell")
        self.delegate = delegate
        self.dataSource = dataSource
        self.backgroundColor = .clear
    }

    func setConstraint(view: UIView, topAnchor: NSLayoutYAxisAnchor, bottomAnchor: NSLayoutYAxisAnchor) {
        self.setAnchors(top: topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: bottomAnchor,
                        padding:  UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0))
    }
}
