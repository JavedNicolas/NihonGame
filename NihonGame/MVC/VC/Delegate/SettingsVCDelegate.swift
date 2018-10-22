//
//  SettingsVCDelegate.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension SettingsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let settingElement = self.settingsList[indexPath.row]
        let cell = settingElement.cell
        cell.isSelected = false
        settingElement.function(cell)
    }
}
