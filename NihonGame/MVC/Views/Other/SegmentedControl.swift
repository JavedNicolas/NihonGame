//
//  SegmentedControl.swift
//  NihonGame
//
//  Created by Nicolas on 22/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SegmentedControl : UISegmentedControl {
    func set() {
        self.layer.cornerRadius = 25
        self.tintColor = DesignConstant.black5Alpha
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
}
