//
//  ArrayExtension.swift
//  NihonGame
//
//  Created by Nicolas on 28/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation


extension Array where Element == GameData {
    func dataAt(id: Int) -> GameData? {
        for element in self {
            if element.id == id {
                return element
            }
        }
        return nil
    }
}
