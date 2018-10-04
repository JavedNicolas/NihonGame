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
            coreDataGroup.parentGameMode = self
            addToGroups(coreDataGroup)
        }
    }
}
