//
//  LevelMenuCollectionViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LevelMenuCollectionviewCell : UICollectionViewCell {
    private var button : LevelButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(level: Level) {
        self.backgroundColor = .clear
        setLevelButton(level: level)
    }

    func setLevelButton(level: Level){
        button = LevelButton(rect: self.frame, progression: (0,0), title: level.groupName)

        if let button = button {
            self.addSubview(button)
            button.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor)
        }
    }
}
