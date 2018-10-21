//
//  LocalizableExtension.swift
//  NihonGame
//
//  Created by Nicolas on 14/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

extension String {
    /** return a localized version of self. Self must be a key in the localizable File */
    func localize() -> String{
        var localizableString = Bundle.main.localizedString(forKey: self, value: nil, table: nil)
        guard let firstLetter = localizableString.first else { return "" }
        let firstLetterAsString = String(firstLetter)
        let firstLetterCapitalized = firstLetterAsString.capitalized
        localizableString.remove(at: .init(encodedOffset: 0))
        localizableString = firstLetterCapitalized + localizableString

        if localizableString == self {
            return "Failed to localize"
        }
        return localizableString
    }
}
