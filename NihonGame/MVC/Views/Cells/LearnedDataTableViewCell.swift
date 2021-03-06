//
//  LearnedDataTableViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 11/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LearnedDataTableViewCell: UITableViewCell {
    // MARK:- Attributs
    var gameData : GameData? = nil {
        didSet {
            if let gameData = gameData {
                setCell(gameData: gameData)
            }
        }
    }

    // MARK:- init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- setter
    /** set cell with data and progression */
    private func setCell(gameData: GameData) {
        let Elementlabel = setElementIdentifier(gameData: gameData)
        self.addSubview(Elementlabel)
        let stackViewArray = setStackViewArray(gameData: gameData)
        let stackView = UIStackView(arrangedSubviews: stackViewArray)
        setStackView(stackView: stackView)
        self.addSubview(stackView)
        self.backgroundColor = .clear
        stackView.setAnchors(top: self.topAnchor, leading: Elementlabel.trailingAnchor, trailing: self.trailingAnchor,
                                   bottom: self.bottomAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    /** Get the important part to display of the element */
    func setElementIdentifier(gameData: GameData) -> UILabel{
        let label = UILabel(frame: CGRect(x: 0, y: 10, width: self.frame.width / 3, height: self.frame.height))
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        guard let dataString = gameData.data.dataAt(name: gameData.dataNameOrder[0]) else { return UILabel()}
        label.text = dataString.value.flatenArray(separator: ",")
        return label
    }

    /** set progression stackView Array*/
    func setStackViewArray(gameData: GameData) -> [UIView] {
        let learningLevelLabel = UILabel()
        learningLevelLabel.text = gameData.learningLevel
        learningLevelLabel.textAlignment = .center
        learningLevelLabel.textColor = .white
        learningLevelLabel.frame.size.height = self.frame.height / 2

        let progressionView = GameDataProgressionView(progressViewStyle: .bar)
        progressionView.set(learningScore: gameData.learningScore.int, learningLevel: gameData.learningLevel)
        
        return [learningLevelLabel, progressionView]
    }

    func setStackView(stackView: UIStackView) {
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
    }

}
