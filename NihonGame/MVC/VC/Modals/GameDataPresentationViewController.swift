//
//  TutorialViewController.swift
//  NihonGame
//
//  Created by Nicolas on 09/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameDataPresentationViewController : PopUpViewController {
    //MARK:- Attributs
    private var buttonImage = UIImage(named: "Correct.png")
    private var buttonText = "Understood_Text".localize()

    var gameData : GameData?

    //MARK:- VC Functions
    override func viewDidLoad() {
        self.view.backgroundColor = .clear
        self.view.setWhiteAlphaBackgroud()
        setView()
        setContent()
    }

    // MARK:- Content Settings
    private func setContent() {
        guard let gameData = gameData else { return }
        setTitle(gameData: gameData)

        for content in gameData.data {
            for data in content {
                setLabel(textTitle: "\(data.name) :", text : "\(data.value.flatenArray(separator: ","))")
            }
        }
        if gameData.learningScore != 0 {
            setLabel(textTitle: "score : ", text: "\(gameData.learningScore)")
        }
        setButton()
        setStackView()
    }

    /** set the title if the game data is a new one */
    private func setTitle(gameData: GameData) {
        if gameData.learningScore == 0 {
            super.setTitle(display: true, text: "New_Game_Data_Text".localize())
        }
    }

    /** set game data title and text*/
    private func setLabel(textTitle: String, text: String) {
        let labelTitle = UILabel()
        labelTitle.text = textTitle
        labelTitle.font = UIFont.boldSystemFont(ofSize: 20)
        labelTitle.textAlignment = .center
        labelTitle.textColor = .white
        stackView.addArrangedSubview(labelTitle)

        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        stackView.addArrangedSubview(label)
    }

    /** set the dismiss button */
    private func setButton() {
        guard let popUpView = popUpView, let gameData = gameData else {
            self.errorHandling(error: ErrorList.unknowError)
            return
        }

        if gameData.learningScore != 0 {
            buttonImage = nil
            buttonText = "Close_Text".localize()
        }
        button.setButton(text: buttonText, image: buttonImage, container: popUpView)
        popUpView.addSubview(button)
        button.addTarget(self, action: #selector(closeTutorial), for: .touchUpInside)
    }

    @objc func closeTutorial() {
        self.dismiss(animated: true, completion: nil)
    }
}
