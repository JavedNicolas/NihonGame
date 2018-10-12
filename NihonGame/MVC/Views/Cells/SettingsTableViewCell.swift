//
//  SettingsTableViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SettingsTableViewCell : UITableViewCell {
    var message : String = "" {
        didSet {
            setLabel(text: message)
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLabel(text: String) {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(label)
        label.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor)
    }
}
