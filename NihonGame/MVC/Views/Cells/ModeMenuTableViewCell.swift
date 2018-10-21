//
//  ModeMenuTableViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 08/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class ModeMenuTableViewCell: MenuTableViewCell {
    // MARK:- Attributs
    private var button : GameModeButton?
    var gameMode : GameMode? = nil {
        didSet {
            if let gameMode = gameMode {
                setGameButton(gameMode: gameMode)
            }
        }
    }

    // MARK:- functions
    /** Remove the button when reuse to avoid duplicate */
    override func prepareForReuse() {
        super.prepareForReuse()

        if let button = button {
            button.removeFromSuperview()
        }
    }

    /** set the game button */
    private func setGameButton(gameMode: GameMode){
        let buttonsize = CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: 400)
        button = GameModeButton(rect: buttonsize)
        if let gameButton = button {
            gameButton.mode = gameMode
            self.addSubview(gameButton)
            gameButton.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor,
                                  padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: -20))
        }
    }
}

