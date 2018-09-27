//
//  CoreDataGameMode.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class CoreDataGameMode : NSManagedObject {

    func fill(gameMode: GameMode){
        guard let context = managedObjectContext else {
            return
        }
        id = gameMode.id.int16
        name = gameMode.name
        for group in gameMode.groups {
            let coreDataGroup = CoreDataGroup(context: context)
            coreDataGroup.fill(group: group)
            addToGroups(coreDataGroup)
        }
    }

    private func fill(coreDataGameMode: CoreDataGameMode) {
        id = coreDataGameMode.id
        name = coreDataGameMode.name
        guard let groups = coreDataGameMode.groups else { return }
        for group in groups {
            if let group = group as? NSSet {
                addToGroups(group)
            }
        }
    }

    func fetch(modeID: Int) -> Bool {
        guard let context = managedObjectContext else {return false}

        let request : NSFetchRequest<CoreDataGameMode> = CoreDataGameMode.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", modeID.int16)

        do {
            if let coreDataGameMode = try context.fetch(request).first {
                fill(coreDataGameMode: coreDataGameMode)
                return true
            }
            return false

        } catch let error {
            print(error)
            return false
        }
    }
}
