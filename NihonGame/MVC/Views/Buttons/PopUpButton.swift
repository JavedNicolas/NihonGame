//
//  PopUpButton.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class PopUpButton : UIButton {
    func setButton(text: String, image: UIImage? = nil, container: UIView) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setImage(image, for: .normal)
        self.backgroundColor = .white
        self.alpha = 0.8
        self.layer.cornerRadius = container.layer.cornerRadius
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
