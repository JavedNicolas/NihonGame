//
//  TutorialViewController.swift
//  NihonGame
//
//  Created by Nicolas on 09/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class GameDataPresentationViewController : UIViewController {
    //MARK:- Attributs
    private var popUpView : SquarePopUpView?
    private var stackView = PopUpStackView()
    private let button = PopUpButton(type: .custom)
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

    private func setView() {
        let popUpEdgeSize = self.view.frame.width * (90 / 100)
        let popUpSize = CGSize(width: popUpEdgeSize , height: popUpEdgeSize)
        popUpView = SquarePopUpView(parentframe: self.view.frame, size: popUpSize)
        if let popUpView = popUpView {
            self.view.addSubview(popUpView)
            stackView = PopUpStackView(frame: popUpView.frame)
            popUpView.addSubview(stackView)
        }
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

    private func setTitle(gameData: GameData) {
        if gameData.learningScore == 0 {
            let label = UILabel()
            label.text = "New_Game_Data_Text".localize()
            label.textAlignment = .center
            label.textColor = .white
            label.font = UIFont(name: "Arial", size: CGFloat(30))
            stackView.addArrangedSubview(label)
        }
    }

    private func setLabel(textTitle: String, text: String) {
        let labelTitle = UILabel()
        labelTitle.text = textTitle
        labelTitle.font = UIFont(name: "Arial", size: 20)
        labelTitle.textAlignment = .center
        labelTitle.textColor = .white
        stackView.addArrangedSubview(labelTitle)

        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        stackView.addArrangedSubview(label)
    }

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
        button.addTarget(self, action: #selector(closeTutorial), for: .touchUpInside)
        popUpView.addSubview(button)
    }

    private func setStackView() {
        guard let popUpView = popUpView else {
            self.errorHandling(error: ErrorList.unknowError)
            return
        }
        stackView.set()
        stackView.setAnchors(top: popUpView.topAnchor, leading: popUpView.leadingAnchor, trailing: popUpView.trailingAnchor,
                             bottom: button.topAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        button.setAnchors(top: stackView.bottomAnchor, leading: popUpView.leadingAnchor, trailing: popUpView.trailingAnchor,
                          bottom: popUpView.bottomAnchor)
    }

    @objc func closeTutorial() {
        self.dismiss(animated: true, completion: nil)
    }
}
