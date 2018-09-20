//
//  LevelColletionView.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LevelCollectionView : UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(delegate : UICollectionViewDelegate?, dataSource: UICollectionViewDataSource?) {
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "LevelCell")
        self.delegate = delegate
        self.dataSource = dataSource
        self.backgroundColor = .clear
    }

    func setConstraint(view: UIView, topAnchor: NSLayoutYAxisAnchor, bottomAnchor: NSLayoutYAxisAnchor) {
        self.setAnchors(top: topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: bottomAnchor,
                        padding:  UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0))
    }
}
