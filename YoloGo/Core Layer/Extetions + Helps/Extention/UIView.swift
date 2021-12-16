//
//  UIView.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 16.12.2021.
//

import UIKit

extension UIView {
    
    func setShadow() {
        clipsToBounds = false
        layer.shadowOpacity = 0.4
        layer.shadowColor = UIColor.green.withAlphaComponent(0.4).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
