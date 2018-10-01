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

    init(parsedLevel: [LevelsParsing]){
        setLevels(parsedLevel: parsedLevel)
    }

    init(coreDataLevels: NSSet?) {
        setLevels(coreDataLevels: coreDataLevels)
    }

    private func setLevels(parsedLevel: [LevelsParsing]) {
        for level in parsedLevel {
            levels.append(Level(parsedLevel: level))
        }
    }

    private func setLevels(coreDataLevels: NSSet?) {
        guard let coreDataLevels = coreDataLevels else {
            return
        }

        for element in coreDataLevels.enumerated() {
            if let level = element.element as? CoreDataLevel {
                levels.append(Level(coreDataLevel: level))
            }
        }
    }

    func getLevels() -> [Level] {
        return levels
    }
}
