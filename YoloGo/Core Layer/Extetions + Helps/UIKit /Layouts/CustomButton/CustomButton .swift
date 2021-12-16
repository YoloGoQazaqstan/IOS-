//
//  CustomButton .swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 16.12.2021.
//

import UIKit

class CustomButton: UIImageView {
    
    // MARK: - Properties
    
    var imageName: String
    var text: String
    var textColor: UIColor
    
    public lazy var buttonTitle: UILabel = {
        let lb = UILabel()
        lb.text = text
        lb.textColor = textColor
        lb.font = Fonts.medium(size: 16.0)
        lb.textAlignment = .center
        return lb
    }()
    
    // MARK: - Init
    
    init(imageName: String,
         text: String,
         textColor: UIColor) {
        self.imageName = imageName
        self.text = text
        self.textColor = textColor
        super.init(frame: .zero)
        
        self.image = UIImage(named: imageName)
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UI

extension CustomButton: ConfigureView {
    
    func setLayouts() {
        [buttonTitle].forEach {
            addSubview($0)
        }
        
        buttonTitle.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
    func configureView() {
        
    }
}
