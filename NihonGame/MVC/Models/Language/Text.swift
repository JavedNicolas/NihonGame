//
//  Text.swift
//  NihonGame
//
//  Created by Nicolas on 10/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
enum Lang {
    case fr
    case en
}

class Text {
    static var shared = Text()
    private var fr : FR_fr
    private var en : EN_en

    func setCurrentLanguage(lang : Lang)  {
        switch lang {
        case .fr:
            AppDelegate.delegate.textLanguage = fr
        case .en:
            AppDelegate.delegate.textLanguage = en
        }
    }

    init() {
        fr = FR_fr()
        en = EN_en()
    }
}
