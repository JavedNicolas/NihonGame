//
//  GroupsParsing.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

struct GroupsParsing : Decodable {
    let id : Int
    let startRange : Int
    let endRange : Int
    let levels : [LevelsParsing]
}

struct LevelsParsing : Decodable {
    let id : Int
    let startRange: Int
    let endRange : Int
}
