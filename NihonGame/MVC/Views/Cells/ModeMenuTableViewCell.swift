//
//  ModeMenuTableViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 08/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class ModeMenuTableViewCell: MenuTableViewCell {
    private var gameButton : GameModeButton?
    var gameMode : GameMode? = nil {
        didSet {
            if let gameMode = gameMode {
                setGameButton(gameMode: gameMode)
            }
        }
    }

    private func setGameButton(gameMode: GameMode){
        let buttonsize = CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: 400)
        gameButton = GameModeButton(rect: buttonsize)
        if let gameButton = gameButton {
            gameButton.mode = gameMode
            self.addSubview(gameButton)
            gameButton.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor,
                                  padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: -20))
        }
    }
}

