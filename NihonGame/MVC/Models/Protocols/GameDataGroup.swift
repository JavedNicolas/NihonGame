//
//  GameDataGroup.swift
//  NihonGame
//
//  Created by Nicolas on 18/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol GameDataGroup {
    var groupName : String { get }
    var groupElementRange : (Int, Int) { get }
}
