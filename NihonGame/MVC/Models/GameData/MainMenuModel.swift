//
//  MainMenuModel.swift
//  NihonGame
//
//  Created by Nicolas on 13/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation

class MainMenuModel {
    private var menuItems : [GameMode] = []

    init(completionHandler: @escaping ([GameMode]) -> ()) {
        menuItems.append(KanjiData())
        menuItems.append(KanjiData())

        completionHandler(menuItems)
    }

}
