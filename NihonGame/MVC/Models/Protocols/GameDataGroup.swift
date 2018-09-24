//
//  GameDataGroup.swift
//  NihonGame
//
//  Created by Nicolas on 18/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol GameDataGroup {
    var name : String { get }
    var elementRange : (Int, Int) { get }
    var done : Bool { get }
    var locked : Bool { get }
}
