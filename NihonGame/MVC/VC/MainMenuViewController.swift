//
//  MainMenuViewController.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    internal var menuName : UILabel?
    internal var gameButtons : [LevelButton]?
    internal var backButton : UIButton?

    override func viewDidLoad() {
        view.backgroundColor = .white
        getGameData()
        setView()
    }

    func getGameData() {
        let kanjis = KanjiData()
        for kanji  in kanjis.kanjis {
            print("Kanji: \(kanji.value), level: \(kanji.groupName)")
        }

        for group  in kanjis.groups {
            print("Group lvl : \(group.groupName), Kanji from : \(group.groupElementRange.0) to \(group.groupElementRange.1)")
        }
    }
}
