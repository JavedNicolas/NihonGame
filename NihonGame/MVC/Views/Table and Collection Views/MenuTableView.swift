//
//  MainMenuInterFaceBuildingExtension.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import UIKit

class MenuTableView : UITableView {
    //MARK: - Set View Elements

    func set(delegate: UITableViewDelegate?, datasource: UITableViewDataSource?, cellType: MenuTableViewCell.Type, identifier: String) {
        self.dataSource = datasource
        self.delegate = delegate
        self.separatorStyle = .none
        self.register(cellType, forCellReuseIdentifier: identifier)
        self.rowHeight = 100
        self.backgroundColor = .clear
    }

    func setMenuConstraints(view: UIView, topElementAnchor: NSLayoutYAxisAnchor, bottomElementAnchor: NSLayoutYAxisAnchor){
        let tableViewleftPadding = UIScreen.main.bounds.width * (1/3)
        self.setAnchors(top: topElementAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,
                        bottom: bottomElementAnchor,
                        padding: UIEdgeInsets(top: 0, left: tableViewleftPadding, bottom: 0, right: 0))
    }
}
