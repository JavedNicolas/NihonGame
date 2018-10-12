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
    }

    // MARK:- Attributs
    internal var settingsList = [SettingsElement]()
    internal var tableView : SettingsTableView?

    //MARK:- VC function
    override func viewDidLoad() {
        self.title = "Settings_VC".localize()
        self.view.setNihonGameBackground()
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

    private func setResetCell() {
        let resetProgressionCell = SettingsTableViewCell(style: .default, reuseIdentifier: "SettingsCell")
        resetProgressionCell.message = "Reset_Text".localize()
        resetProgressionCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(resetProgression)))

        let resetSettingsElement = SettingsElement(sectionId: 0, sectionName: "Progression_Settings_Text".localize(), cell: resetProgressionCell)
        settingsList.append(resetSettingsElement)
    }

    @objc func resetProgression() {
        let alert = createAlert(title: "Sure_Title".localize(), message: "Sure_Text".localize(), action: { _ in
            for mode in GameModes.shared.getGameModes() {
                CoreDataManager.shared.deleteMode(modeID: mode.id.int)
            }
            GameModes.shared.createModesList()
        })
        let alertAction = UIAlertAction(title: "Cancel_Alert_Text".localize(), style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)

        //TO DO Loading
    }
}
