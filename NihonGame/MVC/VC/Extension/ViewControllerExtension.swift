//
//  ViewControllerExtension.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension UIViewController {
    /** create an alert */
    func createAlert(title: String, message: String, action: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok_Alert_Text".localize(), style: .default, handler: action)
        alert.addAction(alertAction)
        return alert
    }


    @objc func setLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }
}
