//
//  CustomGradientButton.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 13.12.2021.
//

import UIKit
import Foundation

class ActualGradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.yoloOrange.cgColor, UIColor.yoloRed.cgColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 16
        layer.insertSublayer(l, at: 0)
        return l
    }()
}

extension UIButton {
    
    public func setButtonTitle(title: String,
                               color: UIColor) {
        
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
    }
}
