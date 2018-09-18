//
//  MainMenuVC.swift
//  NihonGame
//
//  Created by Nicolas on 14/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension MainMenuViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let menuItems = menuItems else {
            return 0
        }

        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let menuItems = menuItems else {
            return UITableViewCell()
        }

        let cell = GameButtonTableViewCell(style: .default, reuseIdentifier: "gameButtonCell", gameData: menuItems[indexPath.row])

        return cell
    }

    
}
