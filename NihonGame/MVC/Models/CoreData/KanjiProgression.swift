//
//  KanjiProgression.swift
//  NihonGame
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class KanjiProgression : NSManagedObject {
    private lazy var coreDataManager = CoreDataManager()
    private lazy var context = coreDataManager.getContext()

    func fetchProgression() -> [KanjiProgression]? {
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

    func saveKanjiProgression(kanjis: [Kanji]) {
        for kanji in kanjis {
            let kanjiProgression = KanjiProgression(context: context)
            kanjiProgression.id = Int16(kanji.id)
            kanjiProgression.progressionScore = Int64(kanji.learningScore)
        }

        coreDataManager.saveContext()
    }
}
