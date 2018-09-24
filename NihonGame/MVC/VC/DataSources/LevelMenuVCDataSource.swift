//
//  LevelMenuVCDataSource.swift
//  NihonGame
//
//  Created by Nicolas on 20/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension LevelMenuViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let levels = levels else {
            return 0
        }

        return levels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as? LevelMenuCollectionviewCell,
        let levels = levels else {
            return UICollectionViewCell()
        }
        
        cell.level = levels[indexPath.row]

        return cell
    }
}
