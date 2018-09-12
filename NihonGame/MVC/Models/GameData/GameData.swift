//
//  GameData.swift
//  NihonGame
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol GameData {
    func parseData(for: AnyObject.Type, json: String) -> Data?
}


extension GameData {
    func parseData(for type: AnyObject.Type, json: String) -> Data?{
        guard let url = Bundle(for: type).url(forResource: json, withExtension: "json") else {
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        }catch {
            return nil
        }
    }
}
