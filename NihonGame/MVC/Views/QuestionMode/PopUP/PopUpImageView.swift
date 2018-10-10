//
//  PopUPImpage.swift
//  NihonGame
//
//  Created by Nicolas on 06/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class PopUpImageView : BandPopUpView {
    private var imageView = UIImageView()
    private var label = UILabel()

    func setContent(image: UIImage, text : String ) {
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: self.barView.frame.height / 2)
        imageView.image = image
        imageView.contentMode = .center
        label.frame = CGRect(x: 0, y: 25, width: frame.width, height: self.barView.frame.height / 2)
        label.text = text
        label.font = UIFont(name: "Arial", size: 25)
        label.textAlignment = .center
        label.textColor = .white

        self.barView.addSubview(imageView)
        self.barView.addSubview(label)

        label.setAnchors(top: barView.topAnchor, leading: barView.leadingAnchor, trailing: barView.trailingAnchor,
                         bottom: imageView.topAnchor)
        imageView.setAnchors(top: label.topAnchor, leading: barView.leadingAnchor, trailing: barView.trailingAnchor,
                             bottom: label.topAnchor)
    }
}
