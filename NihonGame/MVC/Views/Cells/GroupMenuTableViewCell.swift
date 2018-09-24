//
//  GroupTableViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GroupMenuTableViewCell: MenuTableViewCell {
    private var gameButton : GameGroupButton?
    var group : Group? = nil {
        didSet {
            if let group = group {
                setGameButton(group: group)
            }
        }
    }

    private func setGameButton(group: Group){
        let buttonsize = CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: 400)
        gameButton = GameGroupButton(rect: buttonsize)
        if let gameButton = gameButton {
            gameButton.group = group
            self.addSubview(gameButton)
            gameButton.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor,
                                  padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: -20))
        }
    }

    func islocked() -> Bool? {
        guard let gameButton = gameButton else {
            return nil
        }

        return gameButton.islocked()
    }
}
