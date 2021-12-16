//
//  BaseCollectionViewCell.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 09.12.2021.
//

import Foundation
import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
