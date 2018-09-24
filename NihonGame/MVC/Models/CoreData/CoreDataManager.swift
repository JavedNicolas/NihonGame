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

    func getContext() -> NSManagedObjectContext{
        return context
    }

    func saveContext() {
        do {
         try context.save()
        } catch {}
    }
}