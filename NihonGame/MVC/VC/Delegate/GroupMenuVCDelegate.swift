//
//  GroupMenuVCDelegate.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension GroupMenuViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? GroupMenuTableViewCell, let isLocked = cell.islocked(),
        !isLocked else {
            return
        }

        if let groupItems = groupItems {
            let levelMenuCoordinator = LevelMenuCoordinator(currentViewController: self, group: groupItems[indexPath.row])
            levelMenuCoordinator.start()
        }
    }
}
