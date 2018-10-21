//
//  popUpStackView.swift
//  NihonGame
//
//  Created by Nicolas on 10/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class PopUpStackView : UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        set()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /** Set the stackView */
    func set() {
        self.distribution = .fillEqually
        self.axis = .vertical
        self.spacing = 1
        self.alignment = .fill
    }
}
