//
//  CircleView.swift
//  NihonGame
//
//  Created by Nicolas on 05/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SQQuestionView : UIView {
    // MARK:- init
    init(frame: CGRect, question: Question) {
        super.init(frame: frame)
        setCircleView()
        setLabels(question: question)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- setters
    func setCircleView() {
        self.setSize(size: CGSize(width: 200, height: 200))
        self.layer.cornerRadius = self.frame.width / 2
        self.backgroundColor = DesignConstant.black1Alpha
    }

    func setLabels(question: Question) {
        let stackView = PopUpStackView(frame: self.frame)
        stackView.distribution = .fillProportionally
        setLabel(stackView: stackView, text: question.question,fontSize: 60)
        setLabel(stackView: stackView, text: "Find_Text".localize() + "\n\(question.goodAnswer.category)", fontSize: 15)
        self.addSubview(stackView)
        stackView.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor,
                             padding: UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10))
    }

    func setLabel(stackView: UIStackView, text : String, fontSize: CGFloat) {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: fontSize)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label)
    }
}
