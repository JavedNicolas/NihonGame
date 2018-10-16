//
//  GameModeButton.swift
//  NihonGame
//
//  Created by Nicolas on 08/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit
class GameModeButton : MenuButton {
    var mode : GameMode? = nil {
        didSet {
            if let mode = mode {
                if let name = mode.name {
                    setContent(title: name)
                    setArrow()
                }
            }
        }
    }
}
