//
//  SimpleQuestionAnswerView.swift
//  NihonGame
//
//  Created by Nicolas on 05/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SQAnswerView : UIView {
    // MARK:- Attributs
    private var answer : Answer
    private var label = UILabel()
    
    init(frame: CGRect, answer: Answer) {
        self.answer = answer
        super.init(frame: frame)
        self.backgroundColor = .clear
        setLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- setters
    func setFrameFromConstraint() {
        self.layer.borderWidth = 3
        self.layer.borderColor = DesignConstant.black5Alpha.cgColor
    }

    private func setLabel() {
        label.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        label.text = answer.answerString
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 40)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
    }

    func getlabelText() -> String? {
        return self.label.text
    }
}
