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
        let coreDataGameMode = CoreDataGameMode(context: context)
        let success = coreDataGameMode.fetch(modeID: modeID)

        if success {
            return coreDataGameMode
        }else {
            return nil
        }
    }

    func saveProgression(gameMode: GameMode) {
        let gameModeProgression = CoreDataGameMode(context: context)
        gameModeProgression.fill(gameMode: gameMode)

        saveContext()
    }

    func deleteModes(gameModes: [GameMode]) {
        for gameMode in gameModes {
            let coreDataGameMode = CoreDataGameMode(context: context)
            let _ = coreDataGameMode.fetch(modeID: gameMode.id)
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
