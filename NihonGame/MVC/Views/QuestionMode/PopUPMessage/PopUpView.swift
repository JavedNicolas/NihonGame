//
//  PopUpView.swift
//  NihonGame
//
//  Created by Nicolas on 06/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class PopUpView : UIView{
    internal var popUpView = UIView()

    init(parentframe frame: CGRect, size: CGSize) {
        popUpView.frame = CGRect(origin: CGPoint(x: 0, y: (frame.height / 2) - (size.height / 2)), size: size)
        popUpView.backgroundColor = .lightGray
        super.init(frame: frame)
        addSubview(popUpView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
