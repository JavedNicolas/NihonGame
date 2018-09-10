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
    internal lazy var text = AppDelegate.delegate.textLanguage
    internal lazy var session = APISession(urlRequest: URLRequest(url: URL(string: KanjiAPI.EndPoint)!))

    override func viewDidLoad() {
        view.backgroundColor = .white
        Text.shared.setCurrentLanguage(lang: Lang.fr)
        getGameData()
        setView()
    }

    func getGameData() {
        let manager = APIManager(session: session)
        manager.launchQuery { (data) in
            guard let kanji = data as? Kanji else {
                print("error")
                return
            }
            print(kanji.kanjistruct.first?.kanji)
        }
    }
}
