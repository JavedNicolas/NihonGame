//
//  APISession.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

enum Success {
    case success(Data?)
    case failed(HTTPURLResponse)
    case error(Error)
}

class APISession : APIProtocole {
    private var task : URLSessionDataTask?
    private var session : URLSession
    internal var urlRequest : URLRequest

    init(urlRequest : URLRequest, session: URLSession) {
        self.urlRequest = urlRequest
        self.session = session
    }

    func request(completionHandler: @escaping (Success) -> ()) {
        task?.cancel()
        task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else{
                completionHandler(.error(error!))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                if let response = response as? HTTPURLResponse {
                    completionHandler(.failed(response))
                    return
                }
                return
            }
            
            completionHandler(.success(data))
        })
        task?.resume()
    }
}
