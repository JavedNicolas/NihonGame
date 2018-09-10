//
//  LevelButton.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit
class LevelButton  {
    private var button : UIButton
    private var progression : (Int,Int)
    private var title : String



    init(rect : CGRect, progression : (Int,Int), title: String) {
        self.button = UIButton(frame: rect)
        self.progression = progression
        self.title = title
    }




}
