//
//  LearnedDataTableView.swift
//  NihonGame
//
//  Created by Nicolas on 11/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LearnedDataTableView: UITableView {
    func set(delegate: UITableViewDelegate?, dataSource : UITableViewDataSource?, cellType: LearnedDataTableViewCell.Type,
             identifier: String) {
        self.delegate = delegate
        self.dataSource = dataSource
//        self.separatorStyle = .none
        self.rowHeight = 50
        self.register(cellType, forCellReuseIdentifier: identifier)
        self.backgroundColor = .white
    }
}
