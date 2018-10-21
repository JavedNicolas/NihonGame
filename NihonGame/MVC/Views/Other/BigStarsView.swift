//
//  BigStarsView.swift
//  NihonGame
//
//  Created by Nicolas on 16/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class BigStarsView : UIImageView {
    // MARK:- attributs
    var stars : Int = 1 {
        didSet {
            if 1...3 ~= stars {
                image = UIImage(named:"\(stars)BigStar")
            }
        }
    }

    // MARK:- init
    init(stars: Int) {
        let image = UIImage(named: "1BigStar.png")
        super.init(image: image)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
