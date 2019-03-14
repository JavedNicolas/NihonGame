//
//  MainMenuViewController.swift
//  NihonGame
//
//  Created by Nicolas on 17/01/2019.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit


class MainMenuViewController : UIViewController {
    // MARK:- UI Variables
    private var standardModeButton : UIButton!
    private var nihonGameModeButton: UIButton!
    private var menuTitleLabel : UILabel!
    private var buttonStackView : PopUpStackView!
    var loadingView : UIView!

    // MARK:- variables
    private lazy var stackViewWidth = CGFloat(self.view.frame.width / 1.3)
    private lazy var stackViewHeight = CGFloat(self.view.frame.height / 3)

    // MARK:- VC Functions
    override func viewDidLoad() {
        self.view.setImageBackground()
        initVC()
    }

    // MARK:- functions
    func initVC() {
        menuTitleLabel = setLabel(text: "Main_Menu_Title".localize())
        standardModeButton = setButton(title: "Standard_Mode".localize(), locked: false)
        nihonGameModeButton  = setButton(title: "Nihon_Game_Mode".localize(), locked: true)
        buttonStackView = PopUpStackView(arrangedSubviews: [standardModeButton, nihonGameModeButton])

        standardModeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loadStandardMode)))

        buttonStackView.addSubview(standardModeButton)
        buttonStackView.addSubview(nihonGameModeButton)

        self.view.addSubview(menuTitleLabel)
        self.view.addSubview(buttonStackView)

        if let buttonStackView = buttonStackView {
            menuTitleLabel.setAnchors(top: self.view.topAnchor, leading: self.view.leadingAnchor, trailing: self.view.trailingAnchor, bottom: nil, padding:
            UIEdgeInsets(top: 75, left: 20, bottom: 0, right: 20))
            buttonStackView.centerView(x: self.view.centerXAnchor, y: self.view.centerYAnchor)
            buttonStackView.setSize(size: CGSize(width: stackViewWidth, height: stackViewHeight))
            buttonStackView.layoutIfNeeded()
            buttonStackView.spacing = CGFloat(buttonStackView.frame.height / 4)
        }
    }

    func setButton(title : String, locked : Bool) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        if locked {
            button.setLockedStyle()
        }else {
            button.setUnlockStyle()
        }
        return button
    }

    func setLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }

    @objc func loadStandardMode() {
        loadingView = LoadingView(frame: self.view.frame)

        if let loadingView = loadingView {
            self.view.addSubview(loadingView)
        }
        let coordinator = StandardModeMainCoordinator(currentVC: self)
        coordinator.start()
    }
}
