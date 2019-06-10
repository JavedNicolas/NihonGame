//
//  LoginViewController.swift
//  NihonGame
//
//  Created by Nicolas on 10/06/2019.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit

public class LoginViewController : UIViewController {
    // MARK:- View Attributs
    private var titleLabel : UILabel!
    private var loginForm : LoginFormView!
    private var registerAreaLabel : UILabel!
    private var registerButton: UIButton!

    private var registerStackView = UIStackView()

    // MARK:- VC Functions
    public override func viewDidLoad() {
        initVC()
    }

    // MARK:- functions
    private func initVC() {
        view.setImageBackground()
        setElements()
        addElements()
        placeElements()
    }

    private func setElements() {
        // Title
        titleLabel = setLabel(text: "Login_Title_Text".localize())
        titleLabel.textAlignment = .center

        // login from
        loginForm = LoginFormView()
        loginForm.setContent()

        // register
        registerAreaLabel = setLabel(text: "Register_Area_Text".localize())
        registerButton = UIButton()
        registerButton.titleLabel?.text = "Register_Button".localize()

        registerStackView.alignment = .center
        registerStackView.axis = .vertical
    }

    private func addElements() {
        view.addSubview(titleLabel)

        // login Area
        view.addSubview(loginForm)

        // register
        registerStackView.addSubview(registerAreaLabel)
        registerStackView.addSubview(registerButton)
        view.addSubview(registerStackView)
    }

    private func placeElements() {
        titleLabel.setAnchors(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil,
                              padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        loginForm.setAnchors(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil)
        loginForm.setSize(size: CGSize(width: 200, height: 200))
        loginForm.layoutIfNeeded()
        registerStackView.setAnchors(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor)
    }
}
