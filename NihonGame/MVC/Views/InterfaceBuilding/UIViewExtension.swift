//
//  UIViewExtension.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension UIView {
    func setImageBackground(imageName : String = "NihonGameBackground.png") {
        let backgroundImageView = UIImageView(frame: self.frame)
        self.addSubview(backgroundImageView)

        if let image = UIImage(named: imageName) {
            backgroundImageView.image = image
        }
    }

    func setWhiteAlphaBackgroud() {
        let backgroundView = UIView(frame: self.frame)
        backgroundView.backgroundColor = .white
        backgroundView.alpha = 0.8
        self.addSubview(backgroundView)
    }

    func setGrandiantBackground(colors: [CGColor], cornerRadius radius: CGFloat = CGFloat(0)) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.cornerRadius = radius
        gradient.colors = colors
        self.layer.insertSublayer(gradient, at: 0)
    }

    func setAnchors(top : NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?,
                    bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top { topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true }
        if let leading = leading { leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true }
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true }
        if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true }
    }

    func centerView(x: NSLayoutXAxisAnchor?, y: NSLayoutYAxisAnchor?, multiplierX: CGFloat = 0, multiplierY : CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let x = x { centerXAnchor.constraint(equalToSystemSpacingAfter: x, multiplier: multiplierX).isActive = true }
        if let y = y { centerYAnchor.constraint(equalToSystemSpacingBelow: y, multiplier: multiplierY).isActive = true }
    }

    func setSize(size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }

    func setWidth(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func setHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
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
