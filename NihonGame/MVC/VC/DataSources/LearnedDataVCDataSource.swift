//
//  LearnedDataVCDataSource.swift
//  NihonGame
//
//  Created by Nicolas on 11/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension LearnedDataViewController : UITableViewDataSource {
    /**
     return an array of the data with progression for a certain mode

     - Parameters:
        - mode : the id of the mode
     */
    func getKnownData() -> [GameData]{
        var knownData = [GameData]()
        guard  let learnedSegmentedControll = learnedDataSegmentedControl,
            let datas = gameModes[learnedSegmentedControll.selectedSegmentIndex].getDatas() else { return knownData }
        for data in datas {
            if data.learningScore != 0 {
                knownData.append(data)
            }
        }
        return knownData
    }

    // MARK:- Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getKnownData().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LearnedDataTableViewCell(style: .default, reuseIdentifier: "LearnedDataCell")
        let knownGameData = getKnownData()
        cell.gameData = knownGameData[indexPath.row]
        return cell
    }
}

