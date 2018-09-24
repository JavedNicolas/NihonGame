//
//  GameButton.swift
//  NihonGame
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class MenuButton : UIView {
    internal var locked : Bool = false {
        didSet {
            if locked {
                self.backgroundColor = .gray
            } else {
                self.backgroundColor = .white
            }
        }
    }

    init(rect : CGRect) {
        super.init(frame: rect)
        style()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func islocked() -> Bool {
        return locked
    }

    internal func style() {
        self.layer.cornerRadius = 10
        self.contentMode = .left
        self.backgroundColor = .white
    }

    internal func setContent(title: String) {
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: self.frame.height))
        labelTitle.contentMode = .center
        labelTitle.text = title
        self.addSubview(labelTitle)
        labelTitle.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor)
    }
}
