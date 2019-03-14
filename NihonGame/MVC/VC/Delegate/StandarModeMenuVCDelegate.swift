//
//  MainMenuVCDelegate.swift
//  NihonGame
//
//  Created by Nicolas on 08/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension StandarModeMainMenuVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coordinator = GroupMenuCoordinator(currentViewController: self, gameMode: menuItems[indexPath.row])
        coordinator.start()
    }
}
