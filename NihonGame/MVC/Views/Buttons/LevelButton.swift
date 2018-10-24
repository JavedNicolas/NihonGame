//
//  LevelButton.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit
class LevelButton : MenuButton {
    // MARK:- Attributs
    private let starsView = SmallStarsView(stars: 0)
    var level : GameLevel? = nil {
        didSet {
            if let level = level {
                if let name = level.name {
                    setContent(text: name)
                }
                if !level.locked {
                    setStars(stars: level.stars.int)
                }
                locked = level.locked
            }
        }
    }

    //MARK:- setters
    /** display level stars */
    func setStars(stars: Int) {
        starsView.stars = stars
        starsView.contentMode = .scaleAspectFit
        self.addSubview(starsView)
        starsView.setAnchors(top: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor,
                             padding: UIEdgeInsets(top: 0, left: 0, bottom: -self.frame.height / 7, right: 0))
        starsView.setSize(size: CGSize(width: self.frame.width , height: self.frame.height / 2 ))
    }
}
