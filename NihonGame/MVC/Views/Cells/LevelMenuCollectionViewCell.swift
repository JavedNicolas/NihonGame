//
//  LevelMenuCollectionViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LevelMenuCollectionviewCell : UICollectionViewCell {
    // MARK:- Attribut
    private var button : LevelButton?
    var level : GameLevel? = nil {
        didSet {
            if let level = level {
                set(level: level)
            }
        }
    }

    // MARK:- init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- functions
    /** Remove the button when reuse to avoid duplicate */
    override func prepareForReuse() {
        super.prepareForReuse()

        if let button = button {
            button.removeFromSuperview()
        }
    }

    // MARK:- setters
    private func set(level: GameLevel) {
        self.backgroundColor = .clear
        setLevelButton(level: level)
    }

    private func setLevelButton(level: GameLevel){
        button = LevelButton(rect: self.frame)

        if let button = button {
            button.level = level
            self.addSubview(button)
            button.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor)
        }
    }

    func islocked() -> Bool? {
        guard let button = button else {
            return nil
        }

        return button.islocked()
    }
}
