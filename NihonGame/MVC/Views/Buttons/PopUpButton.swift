//
//  PopUpButton.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class PopUpButton : UIButton {
    // MARK:- setters
    func setButton(text: String, image: UIImage? = nil, container: UIView) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.setImage(image, for: .normal)
        self.backgroundColor = DesignConstant.blue1Alpha
        self.layer.cornerRadius = container.layer.cornerRadius
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    func setButtonHeight(height: CGFloat) {
        self.setHeight(height: height)
    }
}
