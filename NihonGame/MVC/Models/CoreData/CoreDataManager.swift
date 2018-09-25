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

    // Mark: - Kanji
    func fetchKanjiProgression() -> [KanjiProgression]? {
        var progressions : [KanjiProgression]?
        let request : NSFetchRequest<KanjiProgression> = KanjiProgression.fetchRequest()
        do {
            progressions = try context.fetch(request)
        } catch let error {
            print(error)
            return nil
        }
        return progressions
    }

    func saveProgression(kanjis: [Kanji]) {
        for kanji in kanjis {
            if kanji.learningScore != 0 {
                let kanjiProgression = KanjiProgression(context: context)
                kanjiProgression.id = Int16(kanji.id)
                kanjiProgression.progressionScore = Int64(kanji.learningScore)
            }
        }
        saveContext()
    }



    // Mark: - Level
    func fetchLevelProgression() -> [CoreDataLevel]? {
        var progressions : [CoreDataLevel]?
        let request : NSFetchRequest<CoreDataLevel> = CoreDataLevel.fetchRequest()
        do {
            progressions = try context.fetch(request)
        } catch let error {
            print(error)
            return nil
        }

        return progressions
    }

    func saveProgression(levels: [Level], gameMode: GameModeNames) {
        for level in levels {
            if level.score != 0 {
                let levelProgression = CoreDataLevel(context: context)
                levelProgression.id = "\(level.id)"
                levelProgression.levelScore = Int64(level.score)
                levelProgression.stars = Int16(level.stars)
            }
        }

        saveContext()
    }

    func fetchGameModeProgression() -> [CoreDataGameMode]? {
        var progressions : [CoreDataGameMode]?
        let request : NSFetchRequest<CoreDataGameMode> = CoreDataGameMode.fetchRequest()
        do {
            progressions = try context.fetch(request)
        } catch let error {
            print(error)
            return nil
        }

        return progressions
    }

    func saveProgression(gameMode: (String, Int)) {
        let gameModeProgression = CoreDataGameMode(context: context)
        gameModeProgression.id = Int16(gameMode.1)
        gameModeProgression.name = gameMode.0

        saveContext()
    }

    func fetchGameGroupProgression() -> [CoreDataGroup]? {
        var progressions : [CoreDataGroup]?
        let request : NSFetchRequest<CoreDataGroup> = CoreDataGroup.fetchRequest()
        do {
            progressions = try context.fetch(request)
        } catch let error {
            print(error)
            return nil
        }

        return progressions
    }

    func saveProgression(gameGroup: (String, Int)) {
        let gameModeProgression = CoreDataGroup(context: context)
        gameModeProgression.id = Int16(gameGroup.1)
        gameModeProgression.name = gameGroup.0

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
