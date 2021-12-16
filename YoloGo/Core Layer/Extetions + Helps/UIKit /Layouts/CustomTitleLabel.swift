//
//  CustomTitleLabel.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 12.12.2021.
//

import UIKit

class CustomTitleLabel: UILabel {
    
    // MARK: - Properties
    
    
    // MARK: - Init
    
    init(title: String) {
        super.init(frame: .zero)
        self.text = title
        self.textColor = .black
        self.textAlignment = .center
        self.font = Fonts.bold(size: 26.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
