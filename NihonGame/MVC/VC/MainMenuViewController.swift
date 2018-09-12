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
        for kanji  in KanjiData().kanjis {
            print(kanji.kanji)
        }
    }
}
