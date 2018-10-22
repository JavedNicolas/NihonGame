//
//  SettingsViewController.swift
//  NihonGame
//
//  Created by Nicolas on 08/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController {
    //MARK:- Struct
    struct SettingsElement {
        var sectionId : Int
        var sectionName : String
        var cell : SettingsTableViewCell
        var function: (SettingsTableViewCell) -> ()
    }

    // MARK:- Attributs
    internal var settingsList = [SettingsElement]()
    internal var tableView : SettingsTableView?

    //MARK:- VC function
    override func viewDidLoad() {
        self.view.setImageBackground()
        setCells()
        setTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let tableView = tableView else { return }
        tableView.reloadData()
    }

    //MARK:- set function
    func setTableView() {
        tableView = SettingsTableView(frame: self.view.frame)
        guard let tableView = tableView else { return }
        tableView.set(delegate: self, dataSource: self, cellType: SettingsTableViewCell.self, identifier: "SettingsCells")
        self.view.addSubview(tableView)
    }

    private func setCells() {
        setResetCell()
    }
}
