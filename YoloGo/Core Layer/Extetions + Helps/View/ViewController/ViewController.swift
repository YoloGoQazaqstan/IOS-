//
//  ViewController.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 09.12.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setGradientBackground() {
        let colorTop    = UIColor.yoloOrange.cgColor
        let colorBottom = UIColor.yoloRed.cgColor
                    
        let gradientLayer       = CAGradientLayer()
        gradientLayer.colors    = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame     = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
}

extension UIView {
    
    func setGradientBackground() {
        let colorTop    = UIColor.yoloOrange.cgColor
        let colorBottom = UIColor.yoloRed.cgColor
                    
        let gradientLayer       = CAGradientLayer()
        gradientLayer.colors    = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame     = self.bounds
                
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}
