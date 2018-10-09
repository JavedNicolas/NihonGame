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
    var image : UIImage = UIImage() {
        didSet {
            setImage(image: image)
        }
    }

    private func setImage(image: UIImage) {
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        imageView.image = image
        imageView.contentMode = .center
        self.addSubview(imageView)

    }
}
