//
//  CustomGradientProgressBar.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 15.12.2021.
//

import UIKit

class CustomGradientProgressBar: UIImageView {
    
    // MARK: - Properties
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        image = UIImage(named: "progressImage")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
