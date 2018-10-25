//
//  TrainingCell.swift
//  NihonGame
//
//  Created by Nicolas on 25/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class TrainingCell : UITableViewCell {
    var learningLevel : TrainingViewController.DataToReviewWithLevel? {
        didSet {
            if let learningLevel = learningLevel {
                set(dataElements: learningLevel)
            }
        }
    }

    // MARK:- init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:- setters
    private func set(dataElements: TrainingViewController.DataToReviewWithLevel) {
        let learningLevelLabel = UILabel()
        learningLevelLabel.text = dataElements.learningLevel + " : " + String(dataElements.numberOfData)
        learningLevelLabel.textAlignment = .center
        learningLevelLabel.textColor = .white
        self.backgroundColor = DesignConstant.learningLevelColors[dataElements.learningLevelIndex].withAlphaComponent(0.3)
        self.addSubview(learningLevelLabel)
        learningLevelLabel.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
    }
}
