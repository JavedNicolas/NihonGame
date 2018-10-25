//
//  TrainingVCDataSource.swift
//  NihonGame
//
//  Created by Nicolas on 25/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

// MARK:- dataSource
extension TrainingViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentModeDataByLearningLevel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TrainingCell(style: .default, reuseIdentifier: "LearningLevelCell")
        let currentData = currentModeDataByLearningLevel[indexPath.row]
        cell.learningLevel = currentData
        return cell
    }
}
