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
            style(locked: locked)
        }
    }

    init(rect : CGRect) {
        super.init(frame: rect)
        style(locked: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func islocked() -> Bool {
        return locked
    }

    internal func style(locked: Bool) {
        self.layer.cornerRadius = 10
        self.contentMode = .left
        if locked {
            self.backgroundColor = DesignConstant.gray5Alpha
        }else {
            self.backgroundColor = DesignConstant.black5Alpha
        }
    }

    internal func setContent(title: String) {
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width / 3, height: self.frame.height))
        labelTitle.textAlignment = .center
        labelTitle.text = title
        labelTitle.lineBreakMode = .byWordWrapping
        labelTitle.numberOfLines = 0
        labelTitle.textColor = .white
        self.addSubview(labelTitle)
        labelTitle.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: nil, bottom: self.bottomAnchor,
                              padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }
}
