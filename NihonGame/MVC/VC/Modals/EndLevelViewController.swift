//
//  File.swift
//  NihonGame
//
//  Created by Nicolas on 10/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class EndLevelViewController : UIViewController {
    var level : Level?
    var navController : UINavigationController?

    override func viewDidLoad() {
        self.view.backgroundColor = .clear
        self.view.setWhiteAlphaBackgroud()
        setContent()
    }

    func setContent() {
        let popUpEdgeSize = self.view.frame.width * (80 / 100)
        let popUpSize = CGSize(width: popUpEdgeSize , height: popUpEdgeSize)
        let popUpview = SquarePopUpView(parentframe: self.view.frame, size: popUpSize)
        self.view.addSubview(popUpview)
        let stackView = PopUpStackView(frame: popUpview.frame)
        popUpview.addSubview(stackView)

        if let level = level {
            if level.score >= 500 {
                setTitle(stackView: stackView, text: "Congratulation_Text".localize())
                setLabel(stackView: stackView, textToDisplay: "Score : \(level.score)")
                setLabel(stackView: stackView, textToDisplay: "Stars : \(level.stars)")
            }else {
                setTitle(stackView: stackView, text: "Try_Again_Text".localize())
                setLabel(stackView: stackView, textToDisplay: "Score : \(level.score)")
            }
            setBackButton(stackView: stackView, popUpView: popUpview)
        }
        setStackView(stackView: stackView, popUpView: popUpview)
    }

    func setTitle(stackView : UIStackView, text: String) {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: CGFloat(30))
        stackView.addArrangedSubview(label)
    }

    func setLabel(stackView : UIStackView, textToDisplay: String) {
        let label = UILabel()
        label.text = textToDisplay
        label.textAlignment = .center
        label.textColor = .white
        stackView.addArrangedSubview(label)
    }

    func setBackButton(stackView : UIStackView, popUpView : SquarePopUpView) {
        let button = UIButton(type: .custom)
        button.setTitle("Go_Back_To_Menu_Text".localize(), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = popUpView.layer.cornerRadius
        button.addTarget(self, action: #selector(closeTutorial), for: .touchUpInside)
        button.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        stackView.addArrangedSubview(button)
    }

    func setStackView(stackView: PopUpStackView, popUpView: SquarePopUpView) {
        stackView.set()
        stackView.setAnchors(top: popUpView.topAnchor, leading: popUpView.leadingAnchor, trailing: popUpView.trailingAnchor,
                             bottom: popUpView.bottomAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }

    @objc func closeTutorial() {
        self.dismiss(animated: true, completion: {
            if let navController = self.navController {
                navController.popViewController(animated: true)
            }
        })
    }
}
