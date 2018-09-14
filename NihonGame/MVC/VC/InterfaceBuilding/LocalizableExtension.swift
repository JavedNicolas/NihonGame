//
//  LocalizableExtension.swift
//  NihonGame
//
//  Created by Nicolas on 14/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

extension String {
    func localize() -> String{
        let localizableString = Bundle.main.localizedString(forKey: self, value: nil, table: nil)
        if localizableString == self {
            return " "
        }
        return localizableString
    }
}
