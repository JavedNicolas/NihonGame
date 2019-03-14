//
//  Button.swift
//  NihonGame
//
//  Created by Nicolas on 17/01/2019.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit

extension UIButton {
    func setUnlockStyle() {
        self.backgroundColor = DesignConstant.black7Alpha
        setStyle()
    }

    func setLockedStyle() {
        let lockImage = UIImage(named: "lock.png")
        let lockImageView = UIImageView(image: lockImage)
        lockImageView.contentMode = .scaleAspectFit
        self.addSubview(lockImageView)
        lockImageView.setSize(size: CGSize(width: 50, height: 50))
        lockImageView.setAnchors(top: self.topAnchor, leading: nil, trailing: self.trailingAnchor, bottom: nil,
                                 padding: UIEdgeInsets(top: -15, left: 0, bottom: 0, right:-15))

        self.backgroundColor = DesignConstant.gray5Alpha
        setStyle()
    }

    func setStyle() {
        self.layer.cornerRadius = 25
        self.contentMode = .center
    }
}
