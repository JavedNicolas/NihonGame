//
//  LearnedDataTableView.swift
//  NihonGame
//
//  Created by Nicolas on 11/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class TableView: UITableView {
    // MARK:- setters
    func set(delegate: UITableViewDelegate?, dataSource : UITableViewDataSource?, cellType: UITableViewCell.Type,
             identifier: String) {
        self.delegate = delegate
        self.dataSource = dataSource
        self.rowHeight = 70
        self.register(cellType, forCellReuseIdentifier: identifier)
        self.backgroundColor = .clear
        self.tableFooterView = UIView()
    }

    /**
     Set a label into a tableView
     */
    func setEmptyLabel(display: Bool, text: String) {
        if display {
            let tableViewWidth = self.bounds.size.width
            let tableViewHeight = self.bounds.size.height
            let rect = CGRect(origin: CGPoint(x: 0, y: 0),size: CGSize(width: tableViewWidth,height: tableViewHeight))
            let emptyListLabel = UILabel(frame: rect)
            emptyListLabel.text = text
            emptyListLabel.numberOfLines = 0
            emptyListLabel.textColor = .white
            emptyListLabel.textAlignment = .center
            self.backgroundView = emptyListLabel
        }else {
            self.backgroundView = UIView()
        }
    }
}
