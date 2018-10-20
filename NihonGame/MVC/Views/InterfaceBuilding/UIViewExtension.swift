//
//  UIViewExtension.swift
//  NihonGame
//
//  Created by Nicolas on 05/09/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension UIView {
    /**
        Set A Background Image. Default background image is app default background image

        - Parameters:
            - imageName : Name of the image to put in background
    */
    func setImageBackground(imageName : String = "NihonGameBackground.png") {
        let backgroundImageView = UIImageView(frame: self.frame)
        self.addSubview(backgroundImageView)

        if let image = UIImage(named: imageName) {
            backgroundImageView.image = image
        }
    }

    /** set a white and slightly transparent background */
    func setWhiteAlphaBackgroud() {
        let backgroundView = UIView(frame: self.frame)
        backgroundView.backgroundColor = .white
        backgroundView.alpha = 0.8
        self.addSubview(backgroundView)
    }

    /**
     Set Anchors for the vue

     - Parameters:
         - top : The top anchor
         - leading : the leading anchor
         - trailling : the trailling anchor
         - bottom : the bottom anchor
         - padding : padding for the anchors
     */
    func setAnchors(top : NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?,
                    bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top { topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true }
        if let leading = leading { leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true }
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true }
        if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true }
    }

    /**
     Set Anchors to center the vue

     - Parameters:
         - x : The centerX anchor
         - y : the centerY anchor
         - multiplierX : the multiplier for X
         - multiplierY : the multiplier for Y
     */
    func centerView(x: NSLayoutXAxisAnchor?, y: NSLayoutYAxisAnchor?, multiplierX: CGFloat = 0, multiplierY : CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let x = x { centerXAnchor.constraint(equalToSystemSpacingAfter: x, multiplier: multiplierX).isActive = true }
        if let y = y { centerYAnchor.constraint(equalToSystemSpacingBelow: y, multiplier: multiplierY).isActive = true }
    }

    /**
        Set size of the view

        - Parameters:
            - size : Size for the view
    */
    func setSize(size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }

    /**
     Set width of the view

     - Parameters:
        - width : width for the view
     */
    func setWidth(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    /**
     Set height of the view

     - Parameters:
     - height : height for the view
     */
    func setHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    /** set the view with a sqaure size (width = height) */
    func squareSize() {
        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
    }

    /** return safe view anchor */
    var safeTopAnchor : NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }

    /** return safe view anchor */
    var safeBottomAnchor : NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }

    /** return safe view anchor */
    var safeTrailingAnchor : NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.trailingAnchor
        }
        return trailingAnchor
    }

    /** return safe view anchor */
    var safeLeadingAnchor : NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.leadingAnchor
        }
        return leadingAnchor
    }
}
