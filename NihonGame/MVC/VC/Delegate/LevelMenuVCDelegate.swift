//
//  LevelMenuVCDelegate.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension LevelMenuViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? LevelMenuCollectionviewCell, let isLocked = cell.islocked(),
            !isLocked else {
                return
        }

        if let levels = levels {
            let level = levels[indexPath.row]
            let gameCoordinator = GameCoordinator(currentViewController: self, level: level)
            gameCoordinator.start()
        }

    }
}
