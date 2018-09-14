//
//  MainMenuInterFaceBuildingExtension.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import Foundation
import UIKit

extension MainMenuViewController {
    //MARK: - Set View Elements
    func setView() {
        createOutlets()
        setConstraint()
    }

    func createOutlets() {
        // MARK: - Menu Title
            menuName = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
            guard let menuName = menuName else {
                return
            }
            menuName.text = "Menu Principale"
            menuName.textAlignment = .center
            view.addSubview(menuName)

        // MARK: - MenuButton
            createGameButton()


    }

    func createGameButton() {
        gameButtonTV = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        if let gameButtonTV = gameButtonTV {
            gameButtonTV.dataSource = self
            gameButtonTV.separatorStyle = .none
            gameButtonTV.register(GameButtonTableViewCell.self, forCellReuseIdentifier: "gameButtonCell")
            gameButtonTV.rowHeight = 100
            view.addSubview(gameButtonTV)
        }
    }

    func setConstraint() {
        let tableViewleftPadding = UIScreen.main.bounds.width * (1/3)

        guard let menuName = menuName, let gameButtonTV = gameButtonTV else {
            return
        }

        menuName.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor,
                             trailing: view.trailingAnchor, bottom: nil, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        gameButtonTV.setAnchors(top: menuName.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor,
                                padding: UIEdgeInsets(top: 50, left: tableViewleftPadding, bottom: 0, right: 0))

    }

}
