//
//  File.swift
//  NihonGame
//
//  Created by Nicolas on 10/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class EndLevelViewController : PopUpViewController {
    var level : Level?

    override func viewDidLoad() {
        self.view.backgroundColor = .clear
        self.view.setWhiteAlphaBackgroud()
        setView()
        setContent()
    }

    func setContent() {
        if let level = level {
            if level.score >= 500 {
                setTitle(display: true, text: "Congratulation_Text".localize())
                setLabel(textToDisplay: "Score : \(level.score)")
                setLabel(textToDisplay: "Stars : \(level.stars)")
            }else {
                setTitle(display: true, text: "Try_Again_Text".localize())
                setLabel(textToDisplay: "Score : \(level.score)")
            }
            setBackButton(stackView: stackView)
            setStackView()
        }
    }

    func setLabel(textToDisplay: String) {
        let label = UILabel()
        label.text = textToDisplay
        label.textAlignment = .center
        label.textColor = .white
        stackView.addArrangedSubview(label)
    }

    func setBackButton(stackView : UIStackView) {
        guard let popUpView = popUpView else { return }
        button.setButton(text: "Go_Back_To_Menu_Text".localize(), container: popUpView)
        button.addTarget(self, action: #selector(closeTutorial), for: .touchUpInside)
        self.view.addSubview(button)

    }

    @objc func closeTutorial() {
        self.dismiss(animated: true, completion: {
            if let navController = self.navController {
                navController.popViewController(animated: true)
            }
        })
    }
}
