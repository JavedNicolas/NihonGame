//
//  LevelProgression.swift
//  NihonGame
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class LevelProgression : NSManagedObject {
    private lazy var coreDataManager = CoreDataManager()
    private lazy var context = coreDataManager.getContext()

    func fetchProgression() -> [LevelProgression]? {
        var progressions : [LevelProgression]?
        let request : NSFetchRequest<LevelProgression> = LevelProgression.fetchRequest()
        do {
            progressions = try context.fetch(request)
        } catch let error {
            print(error)
            return nil
        }

        return progressions
    }

    func saveProgression(levels: [Level]) {
        for level in levels {
            if level.score != 0 {
                let levelProgression = LevelProgression(context: context)
                levelProgression.id = level.id
                levelProgression.levelScore = Int64(level.score)
                levelProgression.stars = Int16(level.stars)
            }
        }

        coreDataManager.saveContext()
    }
}
