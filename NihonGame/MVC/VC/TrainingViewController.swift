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
    private var trainingSegmentedControl: SegmentedControl?
    private var knowDataToReview : [DataToReview] {
        get {
            return getDataToReview()
        }
    }

    // MARK:- struct
    struct DataToReview {
        var modeID : Int
        var modeName: String
        var datas : [GameData]
    }

    // MARK:- function
    override func viewDidLoad() {
        setVC()
    }

    override func viewDidAppear(_ animated: Bool) {
        guard let trainingSegmentedControl = trainingSegmentedControl else { return }
        trainingSegmentedControl.selectedSegmentIndex = 0
        modeChanged(trainingSegmentedControl)
    }

    private func setVC() {
        self.view.setImageBackground()
        setSegmentedControl()
        setLabel()
        setButton()
    }

    private func setLabel() {
        // Set data To Review Label
        dataToReviewLabel.textColor = .white
        dataToReviewLabel.textAlignment = .center
        self.view.addSubview(dataToReviewLabel)
        guard let trainingSegmentedControl = trainingSegmentedControl else { return }
        dataToReviewLabel.setAnchors(top: trainingSegmentedControl.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,
                                     bottom: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }

    /** Set the training button*/
    private func setButton() {
        reviewButton.setTitle("Training_Button".localize(), for: .normal)
        reviewButton.backgroundColor = DesignConstant.black7Alpha
        reviewButton.layer.cornerRadius = 25
        reviewButton.addTarget(self, action: #selector(launchTraining), for: .touchDown)
        self.view.addSubview(reviewButton)
        reviewButton.setAnchors(top: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor,
                                padding: UIEdgeInsets(top: 0, left: 10, bottom: self.view.frame.height / 10, right: 10))
        reviewButton.setHeight(height: 100)
    }

    /** Set the segmented control */
    private func setSegmentedControl() {
        var segmentedItems = [String]()
        for knowDataMode in knowDataToReview {
            segmentedItems.append(knowDataMode.modeName)
        }

        trainingSegmentedControl = SegmentedControl(items: segmentedItems)
        if let trainingSegmentedControl = trainingSegmentedControl {
            trainingSegmentedControl.set()
            trainingSegmentedControl.setHeight(height: 40)
            trainingSegmentedControl.selectedSegmentIndex = 0
            trainingSegmentedControl.addTarget(self, action: #selector(modeChanged(_:)), for: .valueChanged)
            self.view.addSubview(trainingSegmentedControl)
            trainingSegmentedControl.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,
                                                bottom: nil, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
        }
    }

    /** Get Data to review from all the modes */
    private func getDataToReview() -> [DataToReview] {
        var knowData = [DataToReview]()
        for gameMode in GameModes.shared.getGameModes() {
            guard let name = gameMode.name else { return [] }
            var dataToReview = DataToReview(modeID: gameMode.id.int, modeName: name, datas: [])
            for data in gameMode.getDatas() {
                if 1...GameDataConstant.thirdLearningStep ~= data.learningScore.int {
                    dataToReview.datas.append(data)
                }
            }
            knowData.append(dataToReview)
        }
        return knowData
    }

    @objc func modeChanged(_ sender: UISegmentedControl) {
        dataToReviewLabel.text = String(knowDataToReview[sender.selectedSegmentIndex].datas.count)
    }

    @objc func launchTraining() {
        if let trainingSegmentedControl = trainingSegmentedControl {
            // Get Data need to build the currentPath struct
            let knowDataModeChoosed = knowDataToReview[trainingSegmentedControl.selectedSegmentIndex]
            let gameMode = GameModes.shared.getGameModes()[knowDataModeChoosed.modeID]
            // Get the data for the level
            let levelData = knowDataModeChoosed.datas
            if levelData.count != 0 {
                // Create the level
                let level = TrainingLevel(levelDatas: levelData)
                let currentPath = CurrentMenuPath(gameMode: gameMode, level: level)
                let coordinator = GameCoordinator.init(currentViewController: self, currentPath: currentPath)
                coordinator.start()
            }else {
                errorHandling(error: ErrorList.nothingToTrain)
            }
        }
    }
}
