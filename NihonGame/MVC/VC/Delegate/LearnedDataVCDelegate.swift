//
//  LearnedDataVCDelegate.swift
//  NihonGame
//
//  Created by Nicolas on 11/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//


import UIKit

extension LearnedDataViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? LearnedDataTableViewCell, let gameData = cell.gameData else {
                return
        }

        let tutorialView = GameDataPresentationViewController()
        tutorialView.gameData = gameData
        tutorialView.modalTransitionStyle = .crossDissolve
        tutorialView.modalPresentationStyle = .overCurrentContext
        self.present(tutorialView, animated: true, completion: nil)
    }
}
