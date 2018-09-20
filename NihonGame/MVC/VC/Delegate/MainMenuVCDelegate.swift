//
//  MainMenuVC.swift
//  NihonGame
//
//  Created by Nicolas on 14/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension MainMenuViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menuItems = menuItems {
            let coordinator = GroupMenuCoordinator(currentViewController: self, gameMode: menuItems[indexPath.row])
            coordinator.start()
        }
    }
}
