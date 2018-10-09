//
//  TutorialViewController.swift
//  NihonGame
//
//  Created by Nicolas on 09/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class TutorialViewController : UIViewController {
    var gameData : GameData?

    override func viewDidLoad() {
        self.view.backgroundColor = .clear
        setContent()
    }

    func setContent() {
        let popUpEdgeSize = self.view.frame.width * (80 / 100)
        let popUpSize = CGSize(width: popUpEdgeSize , height: popUpEdgeSize)
        let popUpview = SquarePopUpView(parentframe: self.view.frame, size: popUpSize)
        self.view.addSubview(popUpview)
        let stackView = UIStackView(frame: popUpview.frame)
        popUpview.addSubview(stackView)
    }
}
