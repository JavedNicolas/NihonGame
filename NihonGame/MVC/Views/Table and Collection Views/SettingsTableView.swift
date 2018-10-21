//
//  SettingsTableView.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SettingsTableView : UITableView {
    // MARK:- setters
    func set(delegate: UITableViewDelegate?, dataSource: UITableViewDataSource?, cellType: SettingsTableViewCell.Type, identifier: String) {
        self.delegate = delegate
        self.dataSource = dataSource
        self.register(cellType, forCellReuseIdentifier: identifier)
        self.rowHeight = 100
        self.backgroundColor = .clear
    }
}
