//
//  SegmentedControl.swift
//  NihonGame
//
//  Created by Nicolas on 22/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SegmentedControl : UISegmentedControl {
    func set(frame: CGRect) {
        self.frame = frame
        self.layer.cornerRadius = 10
        self.tintColor = DesignConstant.black1Alpha
    }
}
