//
//  LevelProgressionView.swift
//  NihonGame
//
//  Created by Nicolas on 11/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LevelScoreDisplayBar : UIView {
    // MARK:- Attributs
    let stackView = UIStackView()
    var game : Game
    var topScoreLabel = UILabel()
    var currentQuestionNumber = UILabel()
    var currentScoreLabel = UILabel()

    init(frame: CGRect, game: Game) {
        self.game = game
        super.init(frame: frame)
        self.backgroundColor = .black
        setBarContent()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setters
    func setBarContent() {
        setLabelStackView(title: "Best_Score_Text".localize(), value: String(game.level.bestScore), label: topScoreLabel)
        setLabelStackView(title: "Current_Score_Text".localize(), value: String(game.level.score), label: currentScoreLabel)

        addSubview(stackView)
        setStackView(stackView: stackView, axis: .horizontal)
        stackView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height / 1.5)
        stackView.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor,
                             padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    func setLabelStackView(title: String, value: String, label: UILabel) {
        let titleLabel = UILabel()
        titleLabel.text = title
        label.text = value
        setScoreLabel(parentStackView: stackView, labels: [titleLabel, label])
    }

    func setScoreLabel(parentStackView: UIStackView, labels: [UILabel]){
        for label in labels {
            label.textColor = .white
            label.textAlignment = .center
        }
        let stackView = UIStackView(arrangedSubviews: labels)
        parentStackView.addArrangedSubview(stackView)
        setStackView(stackView: stackView, axis: .vertical)
    }

    func setStackView(stackView: UIStackView, axis : NSLayoutConstraint.Axis ) {
        stackView.distribution = .fillEqually
        stackView.axis = axis
        stackView.spacing = 5
        stackView.alignment = .fill
    }

}
