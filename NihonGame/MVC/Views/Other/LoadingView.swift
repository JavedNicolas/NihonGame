//
//  LoadingView.swift
//  NihonGame
//
//  Created by Nicolas on 18/01/2019.
//  Copyright © 2019 Nicolas. All rights reserved.
//

import UIKit

class LoadingView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setVC()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setVC() {
        setImageBackground()
        let bandHeight = 70
        let loadingBlackBand = UIView()
        let loadingLabel = setLabel()
        loadingBlackBand.backgroundColor = DesignConstant.black7Alpha
        addSubview(loadingBlackBand)
        loadingBlackBand.addSubview(loadingLabel)

        loadingBlackBand.centerView(x: centerXAnchor, y: centerYAnchor)
        loadingBlackBand.setSize(size: CGSize(width: frame.width, height: CGFloat(bandHeight)))
        loadingLabel.setAnchors(top: loadingBlackBand.topAnchor, leading: loadingBlackBand.leadingAnchor,
                                trailing: loadingBlackBand.trailingAnchor, bottom: loadingBlackBand.bottomAnchor)
    }

    func setLabel() -> UILabel{
        let label = UILabel()
        label.text = "Loading_Text".localize()
        label.textColor = .white
        label.textAlignment = .center

        return label
    }
}
