//
//  GameGroupButton.swift
//  NihonGame
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameGroupButton : MenuButton {
    var group : Group? = nil {
        didSet {
            if let group = group {
                setContent(title: group.name)
                locked = group.locked
            }
        }
    }
}
