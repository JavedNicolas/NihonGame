//
//  SettingsTableViewCell.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SettingsTableViewCell : UITableViewCell {
    // MARK:- Attributs
    private let loadingView = UIActivityIndicatorView(style: .whiteLarge)
    private let label = UILabel()
    var message : String = "" {
        didSet {
            setLabel(text: message)
        }
    }

    // MARK:- init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- setters
    /** Set setting label */
    private func setLabel(text: String) {
        setloadingView()
        label.text = text
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(label)
        label.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor)
    }

    /** set loading view for settings which need loading */
    private func setloadingView() {
        loadingView.frame = self.frame
        loadingView.backgroundColor = DesignConstant.gray5Alpha
        loadingView.isHidden = true
        self.addSubview(loadingView)
        loadingView.setAnchors(top: self.topAnchor, leading: self.leadingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor)
    }

    /** display the loading */
    func isloading(isloading: Bool) {
        loadingView.isHidden = !isloading
        label.isHidden = isloading
        if isloading {
            loadingView.startAnimating()
        }else {
            loadingView.stopAnimating()
        }
    }
}
