//
//  SquarePopUpView.swift
//  NihonGame
//
//  Created by Nicolas on 09/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SquarePopUpView : UIView {

    init(parentframe frame: CGRect, size: CGSize) {
        super.init(frame: frame)
        self.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        self.setSize(size: size)
        self.setImageBackground(imageName: "background_popup.png")
        self.layer.cornerRadius = 25
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
