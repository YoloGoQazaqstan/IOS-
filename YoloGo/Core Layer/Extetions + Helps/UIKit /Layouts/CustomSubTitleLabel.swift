//
//  CustomSubTitleLabel.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 12.12.2021.
//

import UIKit

class CustomSubTitleLabel: UILabel {
    
    // MARK: - Properties
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.textColor = .black
        self.textAlignment = .center
        self.numberOfLines = 0 
        self.font = Fonts.regular(size: 16.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
