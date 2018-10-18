//
//  File.swift
//  NihonGameTests
//
//  Created by Nicolas on 18/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
@testable import NihonGame

class FakeCoreDataManager : CoreDataManager {
    override init(){
        super.init()
    }

    override func fetchMenu(modeID: Int) -> GameMode? {
        return nil
    }

    override func saveContext() {}
}
