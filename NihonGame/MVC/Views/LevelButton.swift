//
//  LevelButton.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit
class LevelButton : UIButton {
    private var progression : (Int,Int)
    private var title : String

    init(rect : CGRect, progression : (Int,Int), title: String) {
        self.progression = progression
        self.title = title
        super.init(frame: rect)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




}
