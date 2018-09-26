//
//  IntExtension.swift
//  NihonGame
//
//  Created by Nicolas on 26/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

extension Int {
    var int16 : Int16 { return Int16(self)}
    var int32 : Int32 { return Int32(self) }
    var int64 : Int64 { return Int64(self) }
}

extension Int16 {
    var int : Int { return Int(self)}
}

extension Int64 {
    var int : Int { return Int(self)}
}
