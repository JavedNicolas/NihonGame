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
        self.frame = CGRect(origin: CGPoint(x: (frame.width / 2)  - (size.width / 2),
                                                 y: (frame.height / 2) - (size.height / 2)), size: size)
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 25
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
