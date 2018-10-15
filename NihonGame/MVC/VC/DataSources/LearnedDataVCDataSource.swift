//
//  LearnedDataVCDataSource.swift
//  NihonGame
//
//  Created by Nicolas on 11/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension LearnedDataViewController : UITableViewDataSource {
    func getKnownData(mode: Int) -> [GameData]{
        var knownData = [GameData]()
        guard let datas = gameModes[mode].getDatas() else { return knownData }
        for data in datas {
            if data.learningScore != 0 {
                knownData.append(data)
            }
        }
        return knownData
    }

    // MARK:- Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getKnownData(mode: section).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LearnedDataTableViewCell(style: .default, reuseIdentifier: "LearnedDataCell")
        let knownGameData = getKnownData(mode: indexPath.section)
        cell.gameData = knownGameData[indexPath.row]
        
        return cell
    }

    //MARK:- Indexes
    func numberOfSections(in tableView: UITableView) -> Int {
        return GameModes.shared.getGameModes().count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let name = gameModes[section].name, getKnownData(mode: section).count != 0{
            return name
        }
        return ""
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = (view as? UITableViewHeaderFooterView), let background = header.backgroundView,
            let textlabel = header.textLabel else {
                return
        }
        background.backgroundColor = DesignConstant.black5Alpha
        textlabel.textColor = .white
    }

}
