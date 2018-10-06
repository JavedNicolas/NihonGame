//
//  PopUPMessage.swift
//  NihonGame
//
//  Created by Nicolas on 06/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class PopUpMessage : PopUpView {
    private var label = UILabel()
    var message : String = "" {
        didSet {
            setMessage(text: message)
        }
    }

    private func setMessage(text: String) {
        label.frame = CGRect(x: 0, y: 0, width: popUpView.frame.width, height: popUpView.frame.height)
        label.text = text
        label.contentMode = .center
        label.textColor = .white
        popUpView.addSubview(label)
    }

}
