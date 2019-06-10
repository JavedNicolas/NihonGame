//
//  LoginFormView.swift
//  NihonGame
//
//  Created by Nicolas on 10/06/2019.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit

public class LoginFormView : UIView {
    // elements
    private var loginAreaLabel: UILabel!
    private var loginLabel : UILabel!
    private var loginTextField : UITextField!
    private var passwordLabel: UILabel!
    private var passwordTextField : UITextField!
    private var loginButton : UIButton!
    // stackViews
    private var loginStackView = UIStackView()
    private var loginFieldStackView = UIStackView()
    private var passwordFieldStackView = UIStackView()

    public func setContent() {
        setElements()
        setStackView()
        addElements()
    }

    private func setElements() {
        // Labels
        loginAreaLabel = setLabel(text: "Login_Area_Text".localize())
        loginLabel = setLabel(text: "Login_Text".localize())
        passwordLabel = setLabel(text: "Password_Text".localize())

        // Textfields
        loginTextField = UITextField();
        passwordTextField = UITextField();
        passwordTextField.isSecureTextEntry = true

        // Buttons
        loginButton = UIButton();
        loginButton.titleLabel?.text = "Login_Button".localize()
    }

    private func setStackView() {
        loginStackView.alignment = .center
        loginStackView.axis = .vertical

        loginFieldStackView.alignment = .center
        loginFieldStackView.axis = .vertical

        passwordFieldStackView.alignment = .center
        passwordFieldStackView.axis = .horizontal
    }


    private func addElements() {
        loginStackView.addSubview(loginAreaLabel)
        loginFieldStackView.addSubview(loginLabel)
        loginFieldStackView.addSubview(loginTextField)
        loginStackView.addSubview(loginFieldStackView)

        passwordFieldStackView.addSubview(passwordLabel)
        passwordFieldStackView.addSubview(passwordTextField)
        loginStackView.addSubview(passwordFieldStackView)

        loginStackView.addSubview(loginButton)
        addSubview(UIButton())
        addSubview(loginStackView)
    }
}
