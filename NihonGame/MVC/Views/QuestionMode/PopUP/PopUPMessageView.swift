//
//  PopUPMessage.swift
//  NihonGame
//
//  Created by Nicolas on 06/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class PopUpMessageView : BandPopUpView {
    private var label = UILabel()
    var message : String = "" {
        didSet {
            setMessage(text: message)
        }
    }

    private func setMessage(text: String) {
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        self.addSubview(label)
    }

}
