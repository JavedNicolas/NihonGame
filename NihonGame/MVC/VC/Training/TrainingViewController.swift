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
    private var dataToReviewTableView = TableView()
    private var reviewButton = UIButton()
    internal var trainingSegmentedControl: SegmentedControl?
    internal var currentModeDataByLearningLevel = [DataToReviewWithLevel]()
    internal var knowDataToReview : [DataToReview] {
        get {
            return getDataToReview()
        }
    }

    // MARK:- function
    override func viewDidLoad() {
        setVC()
        guard let trainingSegmentedControl = trainingSegmentedControl else { return }
        trainingSegmentedControl.selectedSegmentIndex = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        guard let trainingSegmentedControl = trainingSegmentedControl else { return }
        modeChanged(trainingSegmentedControl)
    }

    private func setVC() {
        self.view.setImageBackground()
        setSegmentedControl()
        setButton()
        setTableView()
    }

    private func setTableView() {
        // Set data To Review tableView
        dataToReviewTableView.set(delegate: nil, dataSource: self, cellType: TrainingCell.self, identifier: "LearningLevelCell")
        self.view.addSubview(dataToReviewTableView)
        guard let trainingSegmentedControl = trainingSegmentedControl else { return }
        dataToReviewTableView.setAnchors(top: trainingSegmentedControl.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,
                                     bottom: reviewButton.topAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
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
        reviewButton.setHeight(height: 70)
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

    /**
     Random value for training if there is too much data to train
     - Parameters:
        - trainingLevelData: Data for to train

     - returns: New Data for this training
     */
    func setDataForTraining(trainingLevelData: [GameData]) -> [GameData] {
        var dataForThisTraining = [GameData]()
        if trainingLevelData.count > TrainingConstant.numberOfDataByTraining {
            repeat {
                if let randomData = trainingLevelData.randomElement(), !dataForThisTraining.contains(randomData) {
                    dataForThisTraining.append(randomData)
                }
            } while( dataForThisTraining.count < TrainingConstant.numberOfDataByTraining)
        } else {
            dataForThisTraining = trainingLevelData
        }
        return dataForThisTraining
    }

    // MARK:- objc func
    @objc func modeChanged(_ sender: UISegmentedControl) {
        currentModeDataByLearningLevel = getDataByLearningLevel(dataToReview: knowDataToReview[sender.selectedSegmentIndex])
        dataToReviewTableView.reloadData()
    }

    @objc func launchTraining() {
        if let trainingSegmentedControl = trainingSegmentedControl {
            // Get Data need to build the currentPath struct
            let knowDataModeChoosed = knowDataToReview[trainingSegmentedControl.selectedSegmentIndex]
            let gameMode = GameModes.shared.getGameModes()[knowDataModeChoosed.modeID]
            // Get the data for the level
            let trainingLevelData = knowDataModeChoosed.datas
            if trainingLevelData.count != 0 {
                // Create the level
                let dataForLevelTraining = setDataForTraining(trainingLevelData: trainingLevelData)
                let level = TrainingLevel(levelDatas: dataForLevelTraining)
                let currentPath = CurrentMenuPath(gameMode: gameMode, level: level)
                let coordinator = GameCoordinator.init(currentViewController: self, currentPath: currentPath)
                coordinator.start()
            }else {
                errorHandling(error: ErrorList.nothingToTrain)
            }
        }
    }
}
