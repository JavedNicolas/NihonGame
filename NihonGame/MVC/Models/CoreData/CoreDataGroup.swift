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
            coreDataLevel.parentGroup = self
            addToLevels(coreDataLevel)
        }
    }

    func fetchLevels(forGroupID id: Int16) {
        let requestLevel : NSFetchRequest<CoreDataGroup> = CoreDataGroup.fetchRequest()
        requestLevel.predicate = NSPredicate(format: "id == %i", id)
        requestLevel.returnsObjectsAsFaults = false

        do {
            guard let context = self.managedObjectContext else {
                return
            }

            if let coreDataGroup = try context.fetch(requestLevel).first {
                self.addToLevels(coreDataGroup.levels!)
            }
        } catch let error {
            print(error)
        }
    }

}
