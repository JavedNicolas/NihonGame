//
//  APIProtocole.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

protocol APIProtocole {
    var urlRequest : URLRequest { get }

    func request(completionHandler: @escaping (Success) -> ())
}

