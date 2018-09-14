//
//  LevelButton.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit
class LevelButton : UIView {
    private var progression : (Int,Int)
    private var title : String

    init(rect : CGRect, progression : (Int,Int), title: String) {
        self.progression = progression
        self.title = title
        super.init(frame: rect)
        style()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func style() {
        self.layer.cornerRadius = 10
        self.contentMode = .left
        self.backgroundColor = .blue
    }




}
