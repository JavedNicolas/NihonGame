//
//  UIViewExtension.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension UIView {
    func setNihonGameBackground() {
        let backgroundImageView = UIImageView(frame: self.frame)
        self.addSubview(backgroundImageView)

        if let image = UIImage(named: "NihonGameBackground.png") {
            backgroundImageView.image = image
        }
    }

    func setAnchors(top : NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?,
                    bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top { topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true }
        if let leading = leading { leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true }
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true }
        if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true }
    }

    func setSize(size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }

    func squareSize() {
        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

    var safeTopAnchor : NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }

    var safeBottomAnchor : NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }

    var safeTrailingAnchor : NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.trailingAnchor
        }
        return trailingAnchor
    }

    var safeLeadingAnchor : NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.leadingAnchor
        }
        return leadingAnchor
    }
}
