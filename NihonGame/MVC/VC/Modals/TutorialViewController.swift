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
        self.view.setWhiteAlphaBackgroud()
        setContent()
    }
    
    private func setContent() {
        let popUpEdgeSize = self.view.frame.width * (80 / 100)
        let popUpSize = CGSize(width: popUpEdgeSize , height: popUpEdgeSize)
        let popUpview = SquarePopUpView(parentframe: self.view.frame, size: popUpSize)
        self.view.addSubview(popUpview)
        let stackView = PopUpStackView(frame: popUpview.frame)
        popUpview.addSubview(stackView)
        setTitle(stackView: stackView)
        if let gameData = gameData {
            for content in gameData.dataDictionary{
                setLabel(stackView: stackView, textToDisplay: content)
            }
        }
        setUnderstoodButton(stackView: stackView, popUpView: popUpview)
        setStackView(stackView: stackView, popUpView: popUpview)
    }

    private func setTitle(stackView : UIStackView) {
        let label = UILabel()
        label.text = "New_Game_Data_Text".localize()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: CGFloat(30))
        stackView.addArrangedSubview(label)
    }

    private func setLabel(stackView : UIStackView, textToDisplay: (key: String, value: [Substring])) {
        let label = UILabel()
        label.text = "\(textToDisplay.key) : \(textToDisplay.value.flatenArray(separator: ","))"
        label.textAlignment = .center
        label.textColor = .white
        stackView.addArrangedSubview(label)
    }

    private func setUnderstoodButton(stackView : UIStackView, popUpView : SquarePopUpView) {
        let button = UIButton(type: .custom)
        button.setTitle("Understood_Text".localize(), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "Correct.png"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = popUpView.layer.cornerRadius
        button.addTarget(self, action: #selector(closeTutorial), for: .touchUpInside)
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        stackView.addArrangedSubview(button)
    }

    private func setStackView(stackView: PopUpStackView, popUpView: SquarePopUpView) {
        stackView.set()
        stackView.setAnchors(top: popUpView.topAnchor, leading: popUpView.leadingAnchor, trailing: popUpView.trailingAnchor,
                             bottom: popUpView.bottomAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }

    @objc func closeTutorial() {
        self.dismiss(animated: true, completion: nil)
    }
}
