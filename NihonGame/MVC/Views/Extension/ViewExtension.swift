//
//  ViewExtension.swift
//  NihonGame
//
//  Created by Nicolas on 10/06/2019.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit

extension UIView {

    @objc func setLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }
}
