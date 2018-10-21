//
//  LearnedDataViewController.swift
//  NihonGame
//
//  Created by Nicolas on 08/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class LearnedDataViewController : UIViewController {
    // MARK:- attributs
    private var tableView : LearnedDataTableView?
    internal var gameModes = GameModes.shared.getGameModes()

    override func viewDidLoad() {
        self.view.setImageBackground()
        setTableView()
    }

    // MARK:- functions
    override func viewDidAppear(_ animated: Bool) {
        if let tableView = tableView {
            tableView.reloadData()
            gameModes = GameModes.shared.getGameModes()
            setEmptyLabel(display: tableViewIsEmpty())
        }
    }

    /** set learned data tableView */
    func setTableView() {
        tableView = LearnedDataTableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        if let tableView = tableView {
            self.view.addSubview(tableView)
            tableView.set(delegate: self, dataSource: self, cellType: LearnedDataTableViewCell.self, identifier: "LearnedDataCell")
            tableView.setAnchors(top: self.view.topAnchor, leading: self.view.leadingAnchor, trailing: self.view.trailingAnchor,
                                 bottom: self.view.bottomAnchor)
        }
    }

    /** Return a Boolean describing if the tableView is empty*/
    func tableViewIsEmpty() -> Bool {
        guard let tableView = tableView else {
            self.errorHandling(error: ErrorList.unknowError)
            return false
        }
        if tableView.visibleCells.isEmpty {
            return true
        }
        return false
    }

    /**
     Set a label into a tableView
     */
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
            emptyListLabel.textColor = .white
            emptyListLabel.textAlignment = .center
            tableView.backgroundView = emptyListLabel
        }else {
            tableView.hideSeparator(hide: false)
            tableView.backgroundView = UIView()
        }
    }
}
