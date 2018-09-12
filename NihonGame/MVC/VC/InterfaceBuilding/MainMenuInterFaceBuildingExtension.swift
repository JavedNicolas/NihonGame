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
    func setView() {
        createOutlets()
        setConstraint()
    }

    func createOutlets() {
        // --------- Creation of Elements
        // Menu Titel
        menuName = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        guard let menuName = menuName else {
            return
        }
        menuName.text = "Menu Principale"
        menuName.textAlignment = .center

        // Game Choice Buttons
        //Kanji

        // --------- Add To SubView
        view.addSubview(menuName)
    }

    func setConstraint() {
        menuName?.setAnchors(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                             trailing: view.trailingAnchor, bottom: nil, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))

    }

}