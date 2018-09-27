//
//  CoreDataLevel.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class CoreDataLevel : NSManagedObject {

    func fill(level: Level) {
        id = level.id.int16
        firstElement = level.elementRange.0.int16
        lastElement = level.elementRange.1.int16
        levelScore = level.score.int64
        stars = level.stars.int16
    }
}
