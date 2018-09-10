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
    internal var text = AppDelegate.delegate.textLanguage

    override func viewDidLoad() {
        view.backgroundColor = .white
        Text.shared.setCurrentLanguage(lang: Lang.fr)
        
        setView()
    }
}
