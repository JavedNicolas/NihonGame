//
//  GroupLevelVCDataSource.swift
//  NihonGame
//
//  Created by Nicolas on 19/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension GroupLevelViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let groupItems = groupItems else {
            return 0
        }

        return groupItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let groupItems = groupItems else {
            return UITableViewCell()
        }

        let cell = GameButtonTableViewCell(style: .default, reuseIdentifier: "gameButtonCell", gameData: groupItems[indexPath.row].groupName)

        return cell
    }
}
