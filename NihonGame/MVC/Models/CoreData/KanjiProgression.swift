//
//  KanjiProgression.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class KanjiProgression : NSManagedObject {

    func fill(kanjiProgression: KanjiProgression) {
        id = kanjiProgression.id
        progressionScore = kanjiProgression.progressionScore
    }

    func fetch(kanjiID: Int) -> Bool {
        guard let context = managedObjectContext else {return false}

        let request : NSFetchRequest<KanjiProgression> = KanjiProgression.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", kanjiID.int16)

        do {
            if let kanjiProgression = try context.fetch(request).first {
                fill(kanjiProgression: kanjiProgression)
                return true
            }
            return false

        } catch let error {
            print(error)
            return false
        }
    }
}
