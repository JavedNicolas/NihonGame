//
//  LearnedDataViewController.swift
//  NihonGame
//
//  Created by Nicolas on 08/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LearnedDataViewController : UIViewController {
    private var tableView : LearnedDataTableView?
    internal let gameModes = GameModes.shared.getGameModes()

    override func viewDidLoad() {
        self.title = "Learned_Data_VC".localize()
        self.view.setNihonGameBackground()
        setTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        if let tableView = tableView {
            tableView.reloadData()
        }
    }

    func setTableView() {
        tableView = LearnedDataTableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        if let tableView = tableView {
            self.view.addSubview(tableView)
            tableView.set(delegate: nil, dataSource: self, cellType: LearnedDataTableViewCell.self, identifier: "LearnedDataCell")
            tableView.setAnchors(top: self.view.topAnchor, leading: self.view.leadingAnchor, trailing: self.view.trailingAnchor,
                                 bottom: self.view.bottomAnchor)
        }
    }

    
}
