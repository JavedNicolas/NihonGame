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

    func launchQuery() {
        apiSession.request(completionHandler: { (success) in self.handleAnswer(queryStatus: success)})
    }

    func handleAnswer(queryStatus : Success) {
        switch queryStatus {
        case .success(let data):
            print(String(data: data!, encoding: .utf8))
        case .failed(let httpResponse):
            print(String("HTTP ERROR : \(httpResponse.statusCode)"))
        case .error(let error):
            print(error.localizedDescription)
        }
    }
}

