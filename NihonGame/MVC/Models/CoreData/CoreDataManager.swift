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
        context = AppDelegate.viewContextForTest
    }

    func fetchMenu(modeID: Int) -> CoreDataGameMode? {
        let requestGameMode : NSFetchRequest<CoreDataGameMode> = CoreDataGameMode.fetchRequest()
        requestGameMode.predicate = NSPredicate(format: "id == %i", modeID.int16)
        requestGameMode.relationshipKeyPathsForPrefetching = ["groups","levels"]
        requestGameMode.returnsObjectsAsFaults = false

        do {
            if let coreDataGameMode = try context.fetch(requestGameMode).first {
                return coreDataGameMode
            }
        } catch let error {
            print(error)
            return nil
        }
        return nil
    }

    func saveProgression(gameMode: GameMode) {
        let gameModeProgression = CoreDataGameMode(context: context)
        gameModeProgression.fill(gameMode: gameMode)

        saveContext()
    }

    func deleteMode(modeID: Int) {
        if let coreDataGameMode = fetchMenu(modeID: modeID) {
            context.delete(coreDataGameMode)
        }
        saveContext()
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
