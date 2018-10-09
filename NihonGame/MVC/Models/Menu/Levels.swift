//
//  Levels.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class Levels {
    private var levels : [Level] = []

    init(parsedLevels: [LevelsParsing]){
        setLevels(parsedLevels: parsedLevels)
    }

    init(levels: [Level]) {
        self.levels = levels
    }

    private func setLevels(parsedLevels: [LevelsParsing]) {
        for parsedlevel in parsedLevels {
            let level = Level(context: CoreDataManager.shared.getContext())
            level.fill(parsedLevel: parsedlevel)
            levels.append(level)
        }
    }

    func getLevels() -> [Level] {
        return levels
    }
}
