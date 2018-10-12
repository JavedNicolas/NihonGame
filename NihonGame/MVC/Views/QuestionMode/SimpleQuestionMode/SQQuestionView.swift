//
//  CircleView.swift
//  NihonGame
//
//  Created by Nicolas on 05/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SQQuestionView : UIView {

    init(frame: CGRect, question: Question) {
        super.init(frame: frame)
        draw(frame)
        setLabels(question: question)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        self.backgroundColor = .clear
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2,y: frame.height / 2), radius: CGFloat(rect.width / 2),
                                      startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath

        //change the fill color
        shapeLayer.fillColor = UIColor.gray.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 0

        self.layer.insertSublayer(shapeLayer, at: 1)
    }

    func setLabels(question: Question) {
        let stackView = PopUpStackView(frame: self.frame)
        stackView.distribution = .fillProportionally
        setLabel(stackView: stackView, text: question.question,fontSize: 40)
        setLabel(stackView: stackView, text: "Find_Text".localize() + "\n\(question.goodAnswer.category)", fontSize: 15)
        self.addSubview(stackView)
        stackView.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor,
                             padding: UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10))
    }

    func setLabel(stackView: UIStackView, text : String, fontSize: CGFloat) {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: fontSize)
        stackView.addArrangedSubview(label)
    }
}
