//
//  CoreDataGroup.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class CoreDataGroup : NSManagedObject {

    func fill(group: Group) {
        guard let context = managedObjectContext else {
            return
        }

        id = group.id.int16
        name = group.name
        firstElement = group.elementRange.0.int16
        lastElement = group.elementRange.1.int16
        for level in group.levels {
            let coreDataLevel = CoreDataLevel(context: context)
            coreDataLevel.fill(level: level)
            addToLevels(coreDataLevel)
        }

    }

}
