//
//  SettingsVCExtension.swift
//  NihonGame
//
//  Created by Nicolas on 22/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

/** Handle settings cells and functions */
extension SettingsViewController {
    // MARK:- ResetCell
    /** reset Data cell */
    private func setResetCell() {
        let resetProgressionCell = SettingsTableViewCell(style: .default, reuseIdentifier: "SettingsCell")
        resetProgressionCell.message = "Reset_Text".localize()
        let resetSettingsElement = SettingsElement(sectionId: 0, sectionName: "Progression_Settings_Text".localize(),
                                                   cell: resetProgressionCell, function: resetProgressionAction)
        settingsList.append(resetSettingsElement)
    }

    func resetProgressionAction(_ sender: SettingsTableViewCell) {
        let alert = createAlert(title: "Sure_Title".localize(), message: "Sure_Text".localize(), action: { _ in
            sender.isloading(isloading: true)
            DispatchQueue.main.async {
                for mode in GameModes.shared.getGameModes() {
                    CoreDataManager.shared.deleteMode(modeID: mode.id.int)
                }
                GameModes.shared.creatModes()
                sender.isloading(isloading: false)
            }
        })
        let alertAction = UIAlertAction(title: "Cancel_Alert_Text".localize(), style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}
