//
//  PopUpView.swift
//  NihonGame
//
//  Created by Nicolas on 06/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class BandPopUpView : UIView{
    internal var barView = UIView()

    init(parentframe frame: CGRect) {
        super.init(frame: frame)
        self.setWhiteAlphaBackgroud()
        initBarView()
        barView.alpha = 1
    }

    private func initBarView() {
        let size = CGSize(width: self.frame.width, height: 100)
        barView.frame = CGRect(origin: CGPoint(x: 0, y: (frame.height / 2) - (size.height / 2)), size: size)
        barView.backgroundColor = .lightGray
        self.addSubview(barView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
