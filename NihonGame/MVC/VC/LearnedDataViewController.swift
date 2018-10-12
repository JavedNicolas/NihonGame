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
            setEmptyLabel(display: tableViewIsEmpty())
        }
    }

    func setTableView() {
        tableView = LearnedDataTableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        if let tableView = tableView {
            self.view.addSubview(tableView)
            tableView.set(delegate: self, dataSource: self, cellType: LearnedDataTableViewCell.self, identifier: "LearnedDataCell")
            tableView.setAnchors(top: self.view.topAnchor, leading: self.view.leadingAnchor, trailing: self.view.trailingAnchor,
                                 bottom: self.view.bottomAnchor)
        }
    }

    func tableViewIsEmpty() -> Bool {
        guard let tableView = tableView else {return false }
        if tableView.visibleCells.isEmpty {
            return true
        }
        return false
    }

    func setEmptyLabel(display: Bool) {
        guard let tableView = tableView else { return }
        if display {
            let tableViewWidth = tableView.bounds.size.width
            let tableViewHeight = tableView.bounds.size.height
            let rect = CGRect(origin: CGPoint(x: 0, y: 0),size: CGSize(width: tableViewWidth,height: tableViewHeight))
            let emptyListLabel = UILabel(frame: rect)
            tableView.hideSeparator(hide: true)
            emptyListLabel.text = "Empty_LearnedData_Text".localize()
            emptyListLabel.numberOfLines = 0
            emptyListLabel.textAlignment = .center
            tableView.backgroundView = emptyListLabel
        }else {
            tableView.hideSeparator(hide: false)
            tableView.backgroundView = UIView()
        }
    }

    
}
