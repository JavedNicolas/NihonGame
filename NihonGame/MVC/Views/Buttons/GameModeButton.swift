//
//  LevelButton.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit
class GameModeButton : MenuButton {
    var mode : GameMode? = nil {
        didSet {
            if let mode = mode {
                setContent(title: mode.name)
            }
        }
    }
}
