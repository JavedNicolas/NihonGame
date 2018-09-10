//
//  APIManager.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class APIManager {
    private var apiSession : APISession

    init(session: APISession) {
        apiSession = session
    }

    func launchQuery(completionHandler: @escaping (GameData?) -> ()) {
        apiSession.request(completionHandler: { (success) in
            completionHandler(self.handleAnswer(queryStatus: success))
        })
    }

    func handleAnswer(queryStatus : Success) -> GameData?{
        switch queryStatus {
        case .success(let data):
            do {
                let parsedData = try JSONDecoder().decode([KanjiStruct].self, from: data)
                return Kanji(parsedData: parsedData)
            }catch {
                return nil
            }
        case .failed(let httpResponse):
            print(String("HTTP ERROR : \(httpResponse.statusCode)"))
        case .error(let error):
            print(error.localizedDescription)
        }
        return nil
    }
}

