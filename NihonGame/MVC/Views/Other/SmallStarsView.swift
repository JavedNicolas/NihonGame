//
//  StarsView.swift
//  NihonGame
//
//  Created by Nicolas on 16/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SmallStarsView : UIImageView {
    var stars : Int = 0 {
        didSet {
            if 0...3 ~= stars {
                image = UIImage(named:"\(stars)SmallStar")
            }
        }
    }

    init(stars: Int) {
        let image = UIImage(named: "0SmallStar.png")
        super.init(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
