//
//  GameButtonTableViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 14/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameButtonTableViewCell: UITableViewCell {
    private var gameButton : LevelButton?

    init(style: UITableViewCellStyle, reuseIdentifier: String?, gameData: GameDataModel) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setGameButton(gameData: gameData)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setGameButton(gameData : GameDataModel){
        let buttonsize = CGRect(x: 0, y: 0, width: self.bounds.width / 2, height: 400)
        gameButton = LevelButton(rect: buttonsize, progression: (0,0), title: gameData.name)
        if let gameButton = gameButton {
            self.addSubview(gameButton)
            gameButton.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor,
                                  padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: -20))
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}