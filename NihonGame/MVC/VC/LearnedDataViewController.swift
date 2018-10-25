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
    private var tableView : TableView?
    internal var gameModes = GameModes.shared.getGameModes()
    internal var learnedDataSegmentedControl : SegmentedControl?

    override func viewDidLoad() {
        self.view.setImageBackground()
        setSegementedControl()
        setTableView()
    }

    // MARK:- functions
    override func viewDidAppear(_ animated: Bool) {
        if let tableView = tableView {
            tableView.reloadData()
            gameModes = GameModes.shared.getGameModes()
            tableView.setEmptyLabel(display: tableViewIsEmpty(), text: "Empty_LearnedData_Text".localize())
        }
    }

    /** set learned data tableView */
    func setTableView() {
        setSegementedControl()
        tableView = TableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
        if let tableView = tableView, let learnedDataSegmentedControl = learnedDataSegmentedControl {
            self.view.addSubview(learnedDataSegmentedControl)
            self.view.addSubview(tableView)
            learnedDataSegmentedControl.setWidth(width: self.view.frame.width)
            learnedDataSegmentedControl.setHeight(height: 40)
            learnedDataSegmentedControl.setAnchors(top:self.view.safeTopAnchor, leading: self.view.leadingAnchor,
                                                   trailing: self.view.trailingAnchor, bottom: nil,
                                                   padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
            tableView.set(delegate: self, dataSource: self, cellType: LearnedDataTableViewCell.self, identifier: "LearnedDataCell")
            tableView.setAnchors(top: learnedDataSegmentedControl.bottomAnchor, leading: self.view.leadingAnchor, trailing: self.view.trailingAnchor,
                                 bottom: self.view.bottomAnchor)
        }
    }

    /** Set the segmented Controll which handle learned Data array switch*/
    func setSegementedControl() {
        var segmentedItems = [String]()
        for gameMode in GameModes.shared.getGameModes() {
            if let name = gameMode.name {
                segmentedItems.append(name)
            }
        }

        learnedDataSegmentedControl = SegmentedControl(items: segmentedItems)
        if let learnedDataSegmentedControl = learnedDataSegmentedControl {
            learnedDataSegmentedControl.set()
            learnedDataSegmentedControl.selectedSegmentIndex = 0
            learnedDataSegmentedControl.addTarget(self, action: #selector(modeChanged(_:)), for: .valueChanged)
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

    // MARK:- Segemented Controller Handling
    @objc func modeChanged(_ sender: UISegmentedControl) {
        if let tableview = tableView {
            tableview.reloadData()
            tableview.setEmptyLabel(display: tableViewIsEmpty(), text: "Empty_LearnedData_Text".localize())
        }
    }
}
