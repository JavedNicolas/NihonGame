//
//  LevelButton.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit
class LevelButton : MenuButton {
    var level : Level? = nil {
        didSet {
            if let level = level {
                setContent(title: level.name)
                locked = level.locked
            }
        }
    }
}
