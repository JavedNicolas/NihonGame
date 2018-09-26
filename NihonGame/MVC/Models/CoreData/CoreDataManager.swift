//
//  CoreDataManager.swift
//  NihonGame
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    private var context = AppDelegate.viewContext

    init() {}

    /* Context for test */
    func contextForTest() {
        context = AppDelegate.persistentConainer.newBackgroundContext()
    }

    func fetchMenu(modeID: Int) -> [CoreDataGameMode]? {
        var progressions : [CoreDataGameMode]?
        let request : NSFetchRequest<CoreDataGameMode> = CoreDataGameMode.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", modeID.int16)

        do {
            progressions = try context.fetch(request)
        } catch let error {
            print(error)
            return nil
        }

        return progressions
    }

    func saveProgression(gameMode: GameMode) {
        let gameModeProgression = CoreDataGameMode(context: context)
        gameModeProgression.id = gameMode.id.int16
        gameModeProgression.name = gameMode.name
        for group in gameMode.groups {
            gameModeProgression.addToGroups(createCoreDataGroup(group: group))
        }
        saveContext()
    }

    private func createCoreDataGroup(group: Group) -> CoreDataGroup {
        let coreDataGroup = CoreDataGroup(context: context)
        coreDataGroup.id = group.id.int16
        coreDataGroup.firstElement = group.elementRange.0.int16
        coreDataGroup.lastElement = group.elementRange.1.int16
        for level in group.levels {
            coreDataGroup.addToLevels(createCoreDataLevel(level: level))
        }
        return coreDataGroup
    }

    private func createCoreDataLevel(level: Level) -> CoreDataLevel {
        let coreDataLevel = CoreDataLevel(context: context)
        coreDataLevel.id = level.id.int16
        coreDataLevel.firstElement = level.elementRange.0.int16
        coreDataLevel.lastElement = level.elementRange.1.int16
        coreDataLevel.levelScore = level.score.int64
        coreDataLevel.stars = level.stars.int16
        return coreDataLevel
    }

    func getContext() -> NSManagedObjectContext{
        return context
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {}
    }
}
