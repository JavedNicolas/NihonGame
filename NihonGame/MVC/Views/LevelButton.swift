//
//  LevelButton.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit
class LevelButton : UIView {
    private var progression : (Int,Int)
    private var title : String

    init(rect : CGRect, progression : (Int,Int), title: String) {
        self.progression = progression
        self.title = title
        super.init(frame: rect)
        style()
        setContent()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func style() {
        self.layer.cornerRadius = 10
        self.contentMode = .left
        self.backgroundColor = .gray
    }

    func setContent() {
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: self.frame.height))
        labelTitle.contentMode = .center
        labelTitle.text = title
        self.addSubview(labelTitle)
        labelTitle.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor)
    }




}
