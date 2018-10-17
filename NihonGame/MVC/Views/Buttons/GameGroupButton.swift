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
                if let name = group.name { setContent(text: name) }
                if let levels = group.getLevels() {
                    let doneLevel = levels.filter({$0.done})
                    setProgression(text: "\(doneLevel.count)/\(levels.count)")
                }
                if !group.locked { setArrow() }
                locked = group.locked
            }
        }
    }
}
