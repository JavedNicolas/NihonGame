//
//  TrainingViewController.swift
//  NihonGame
//
//  Created by Nicolas on 24/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class TrainingViewController : UIViewController {
    // MARK:- attributs
    private var dataToReviewLabel = UILabel()
    private var reviewButton = UIButton()
    private var knowDataToReview : [DataToReview] {
        get {
            return getDataToReview()
        }
    }

    // MARK:- struct
    struct DataToReview {
        var mode : Int
        var datas : [GameData]
    }

    // MARK:- function
    override func viewDidLoad() {
        setVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        dataToReviewLabel.text = String(countDataToReview())
    }

    private func setVC() {
        self.view.setImageBackground()

        // Set data To Review Label
        dataToReviewLabel.text = String(countDataToReview())
        dataToReviewLabel.textColor = .white
        dataToReviewLabel.textAlignment = .center
        self.view.addSubview(dataToReviewLabel)
        dataToReviewLabel.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,
                                     bottom: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))

        // Set Review Button
        reviewButton.setTitle("Training_Button".localize(), for: .normal)
        reviewButton.backgroundColor = DesignConstant.black7Alpha
        reviewButton.layer.cornerRadius = 25
        self.view.addSubview(reviewButton)
        reviewButton.setAnchors(top: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor,
                                padding: UIEdgeInsets(top: 0, left: 10, bottom: self.view.frame.height / 10, right: 10))
        reviewButton.setHeight(height: 100)
    }

    private func countDataToReview() -> Int {
        var numberOfDataToReview = 0
        for dataByMode in knowDataToReview {
            numberOfDataToReview += dataByMode.datas.count
        }
        return numberOfDataToReview
    }

    /** Get Data to review from all the modes */
    private func getDataToReview() -> [DataToReview] {
        var knowData = [DataToReview]()
        for gameMode in GameModes.shared.getGameModes() {
            var dataToReview = DataToReview(mode: gameMode.id.int, datas: [])
            for data in gameMode.getDatas() {
                if 1...GameDataConstant.thirdLearningStep ~= data.learningScore.int {
                    dataToReview.datas.append(data)
                }
            }
            knowData.append(dataToReview)
        }
        return knowData
    }
}
