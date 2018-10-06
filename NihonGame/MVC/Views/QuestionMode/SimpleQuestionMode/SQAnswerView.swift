//
//  SimpleQuestionAnswerView.swift
//  NihonGame
//
//  Created by Nicolas on 05/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SQAnswerView : UIView {
    private var answer : Answer
    private var label = UILabel()
    
    init(frame: CGRect, answer: Answer) {
        self.answer = answer
        super.init(frame: frame)
        setLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setFrameFromConstraint() {
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }

    private func setLabel() {
        label.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        label.text = answer.answerString
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 35)
        addSubview(label)
        label.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
    }

    func getlabelText() -> String? {
        return self.label.text
    }
}