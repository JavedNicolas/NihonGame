//
//  MainMenuVCDataSource.swift
//  NihonGame
//
//  Created by Nicolas on 08/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension MainMenuViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ModeMenuTableViewCell(style: .default, reuseIdentifier: "ModeMenuCell")
        cell.gameMode = menuItems[indexPath.row]

        return cell
    }
}
