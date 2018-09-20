//
//  GameButtonTableViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 14/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameButtonTableViewCell: UITableViewCell {
    private var gameButton : GameModeButton?

    init(style: UITableViewCellStyle, reuseIdentifier: String?, gameData: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        set(gameData: gameData)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(gameData: String){
        setGameButton(gameData: gameData)
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }

    func setGameButton(gameData : String){
        let buttonsize = CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: 400)
        gameButton = GameModeButton(rect: buttonsize, progression: (0,0), title: gameData)
        if let gameButton = gameButton {
            self.addSubview(gameButton)
            gameButton.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor,
                                  padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: -20))
        }
    }
}
