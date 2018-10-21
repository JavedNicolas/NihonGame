//
//  PopUpViewController.swift
//  NihonGame
//
//  Created by Nicolas on 15/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

class PopUpViewController : UIViewController {
    //MARK:- Attributs
    internal var popUpView : SquarePopUpView?
    internal var stackView = PopUpStackView()
    internal let button = PopUpButton(type: .custom)
    var navController : UINavigationController?

    // MARK:- functions
    /** set the pop View */
    internal func setView() {
        let popUpEdgeSize = self.view.frame.width * (90 / 100)
        let popUpSize = CGSize(width: popUpEdgeSize , height: popUpEdgeSize)
        popUpView = SquarePopUpView(parentframe: self.view.frame, size: popUpSize)
        if let popUpView = popUpView {
            self.view.addSubview(popUpView)
            popUpView.centerView(x: self.view.centerXAnchor, y: self.view.centerYAnchor)
            stackView = PopUpStackView(frame: popUpView.frame)
            popUpView.addSubview(stackView)
        }
    }

    /** Set the title of the view
     */
    internal func setTitle(display: Bool, text: String) {
        if display {
            let label = UILabel()
            label.text = text
            label.textAlignment = .center
            label.textColor = DesignConstant.blue1Alpha
            label.font = UIFont(name: "Arial", size: CGFloat(30))
            stackView.addArrangedSubview(label)
        }
    }

    /** set the view title which will containt the pop text*/
    internal func setStackView() {
        guard let popUpView = popUpView else {
            self.errorHandling(error: ErrorList.unknowError)
            self.dismiss(animated: true, completion: {
                if let navController = self.navController {
                    navController.popViewController(animated: true)
                }
            })
            return
        }
        stackView.set()
        stackView.setAnchors(top: popUpView.topAnchor, leading: popUpView.leadingAnchor, trailing: popUpView.trailingAnchor,
                             bottom: button.topAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        button.setAnchors(top: stackView.bottomAnchor, leading: popUpView.leadingAnchor, trailing: popUpView.trailingAnchor,
                          bottom: popUpView.bottomAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        button.setHeight(height: 50)

    }
}
