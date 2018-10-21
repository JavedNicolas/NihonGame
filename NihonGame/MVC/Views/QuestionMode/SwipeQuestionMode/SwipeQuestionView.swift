//
//  SwipeQuestionView.swift
//  NihonGame
//
//  Created by Nicolas on 20/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SwipeQuestionView : UIView {
    // MARK:- Attributs
    private let questionLabel = UILabel()
    private let answerTitle = UILabel()
    private let answerLabel = UILabel()
    private let sidePadding : CGFloat = 20
    var style : Style = .standard {
        didSet {
            changeBackgroundColor(style: style)
        }
    }

    // MARK:- enum
    enum Style {
        case standard, correct, inCorrect
    }

    // MARK:- init
    override init(frame: CGRect) {
        super.init(frame: frame)
        changeBackgroundColor(style: .standard)
        self.layer.cornerRadius = 25
        self.setSize(size: CGSize(width: frame.width / 1.5 , height: frame.height / 2))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- setter functions
    func setQuestion(text: String) {
        setLabel(label: questionLabel, text: text, font: UIFont.boldSystemFont(ofSize: 70))
        questionLabel.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: nil,
                                 padding: UIEdgeInsets(top: self.frame.height / 10 , left: sidePadding, bottom: 0, right: sidePadding))
    }

    func setAnswer(title: String ,text: String) {
        setLabel(label: answerTitle, text: title + " :", font: UIFont.boldSystemFont(ofSize: 30))
        setLabel(label: answerLabel, text: text, font: UIFont.systemFont(ofSize: 20))

        answerTitle.setAnchors(top: nil, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: nil)
        answerLabel.setAnchors(top: answerTitle.bottomAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor,
                               padding: UIEdgeInsets(top: 10, left: sidePadding, bottom: 40, right: sidePadding))
    }

    func setLabel(label: UILabel, text: String, font: UIFont) {
        label.text = text
        label.textColor = .white
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = font
        addSubview(label)
    }

    /** change background color based on user answer */
    private func changeBackgroundColor(style: Style) {
        switch style {
        case .standard: self.backgroundColor = DesignConstant.black7Alpha
        case .correct:  self.backgroundColor = DesignConstant.green7Alpha
        case .inCorrect : self.backgroundColor = DesignConstant.red7Alpha
        }
    }
}
