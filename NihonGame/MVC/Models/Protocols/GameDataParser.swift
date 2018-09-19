//
//  GameData.swift
//  NihonGame
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol GameDataParser {
    var datas : [GameData] { get }
    var groupNames : [String] { get }
    func parseData(for: AnyObject.Type, json: String) -> Data?
}

extension GameDataParser {
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
