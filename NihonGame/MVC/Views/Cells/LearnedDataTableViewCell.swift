//
//  LearnedDataTableViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 11/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LearnedDataTableViewCell: UITableViewCell {
    var gameData : GameData? = nil {
        didSet {
            if let gameData = gameData {
                setCell(gameData: gameData)
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setCell(gameData: GameData) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        label.text = gameData.dataString
        self.addSubview(label)
    }

}
