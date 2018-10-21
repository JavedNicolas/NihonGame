//
//  Parser.swift
//  NihonGame
//
//  Created by Nicolas on 25/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class JSONParser {
    // MARK:- Attributs
    var data: Data?

    // MARK:- init
    init(json: String, withExtension: String) {
        self.data = getDataFromJson(jsonFile: json, withExtension: withExtension)
    }

    // MARK:- functions
    /**
     Get data from a JSON file

     - Parameters:
         - jsonFile: the name of the json file to parse
         - withExtension: file extension
     */
    private func getDataFromJson(jsonFile json: String, withExtension: String) -> Data?{
        guard let url = Bundle(for: JSONParser.self).url(forResource: json, withExtension: withExtension) else {
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
