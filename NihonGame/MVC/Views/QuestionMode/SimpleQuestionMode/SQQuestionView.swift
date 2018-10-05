//
//  CircleView.swift
//  NihonGame
//
//  Created by Nicolas on 05/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SQQuestionView : UIView {

    init(frame: CGRect, question: String) {
        super.init(frame: frame)
        draw(frame)
        setLabel(text: question)
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

        self.layer.addSublayer(shapeLayer)
    }

    func setLabel(text: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        label.text = text
        label.textAlignment = .center
        label.textColor = .red
        label.font = UIFont(name: "Arial", size: 25)
        addSubview(label)
        //label.setAnchors(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor)
    }
}
