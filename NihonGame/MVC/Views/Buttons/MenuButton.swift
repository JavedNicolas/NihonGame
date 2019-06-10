//
//  GameButton.swift
//  NihonGame
//
//  Created by Nicolas on 24/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class MenuButton : UIView {
    // MARK:- Attributs
    private let arrowImage = UIImage(named: "arrow.png")
    internal var locked : Bool = false {
        didSet {
            style(locked: locked)
        }
    }

    // MARK:- init
    init(rect : CGRect) {
        super.init(frame: rect)
        style(locked: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /** return true if the level / group is locked*/
    func islocked() -> Bool {
        return locked
    }

    /** handle style based on the locked value */
    internal func style(locked: Bool) {
        self.layer.cornerRadius = 10
        self.contentMode = .left
        if locked {
            self.backgroundColor = DesignConstant.gray5Alpha
        }else {
            self.backgroundColor = DesignConstant.black5Alpha
        }
    }

    // MARK:- setters
    /** set menu title */
    internal func setContent(text: String) {
        let labelTitle = setLabel(text: text)
        self.addSubview(labelTitle)
        labelTitle.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: nil, bottom: self.bottomAnchor,
                              padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
    }

    /** set menu progression */
    internal func setProgression(text: String) {
        let labelProgression = setLabel(text: text)
        self.addSubview(labelProgression)
        labelProgression.centerView(x: self.centerXAnchor, y: self.centerYAnchor)
    }

    /** set a label and return it */
    override internal func setLabel(text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width / 3, height: self.frame.height))
        label.textAlignment = .center
        label.text = text
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }

    internal func setArrow() {
        let imageView = UIImageView(image: arrowImage)
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        imageView.setAnchors(top: self.topAnchor, leading: nil, trailing: self.trailingAnchor, bottom: self.bottomAnchor,
                              padding: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 25))
        imageView.setWidth(width: self.frame.width / 4)
    }
}
