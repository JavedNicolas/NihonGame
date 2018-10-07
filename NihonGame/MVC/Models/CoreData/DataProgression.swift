//
//  KanjiProgression.swift
//  NihonGame
//
//  Created by Nicolas on 27/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import CoreData

class DataProgression : NSManagedObject {

    func fill(dataProgression: DataProgression) {
        id = dataProgression.id
        progressionScore = dataProgression.progressionScore
    }

    func fetch(kanjiID: Int) -> Bool {
        guard let context = managedObjectContext else {return false}

        let request : NSFetchRequest<DataProgression> = DataProgression.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i", kanjiID.int16)

        do {
            if let dataProgression = try context.fetch(request).first {
                fill(dataProgression: dataProgression)
                return true
            }
            return false

        } catch let error {
            print(error)
            return false
        }
    }
}
