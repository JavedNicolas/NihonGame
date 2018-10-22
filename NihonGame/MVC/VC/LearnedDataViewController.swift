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
            tableView.tableFooterView = UIView()
            gameModes = GameModes.shared.getGameModes()
        }
    }

    /** set learned data tableView */
    func setTableView() {
        setSegementedControl()
        tableView = LearnedDataTableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0))
        if let tableView = tableView, let learnedDataSegmentedControl = learnedDataSegmentedControl {
            self.view.addSubview(learnedDataSegmentedControl)
            self.view.addSubview(tableView)
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
            let segementedControlFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
            learnedDataSegmentedControl.set(frame: segementedControlFrame)
            learnedDataSegmentedControl.selectedSegmentIndex = 0
            learnedDataSegmentedControl.addTarget(self, action: #selector(ModeChanged(_:)), for: .valueChanged)
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

    // MARK:- Segemented Controller Handling
    @objc func ModeChanged(_ sender: UISegmentedControl) {
        if let tableview = tableView {
            tableview.reloadData()
            setEmptyLabel(display: tableViewIsEmpty())
        }
    }
}
