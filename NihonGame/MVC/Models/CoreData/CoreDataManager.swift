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
    static var shared = CoreDataManager()
    internal init() {}

    func fetchMenu(modeID: Int) -> GameMode? {
        let requestGameMode : NSFetchRequest<GameMode> = GameMode.fetchRequest()
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

    func deleteMode(modeID: Int) {
        if let coreDataGameMode = fetchMenu(modeID: modeID) {
            context.delete(coreDataGameMode)
        }
        saveContext()
    }


    func getContext() -> NSManagedObjectContext{
        return context
    }

    func saveContext() {
        do {
            try context.save()
        } catch {}
    }
}
