//
//  OnboardingCell.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 15.12.2021.
//

import UIKit

struct OnboadingItems {
    var imageName: String
    var text: String
}

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properites
    
    private var onboardingImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    private var onboardingLabel: CustomSubTitleLabel = {
        let lb = CustomSubTitleLabel()
        lb.numberOfLines = 0
        lb.font = Fonts.regular(size: 26.0)
        return lb
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UI

extension OnboardingCollectionViewCell: ConfigureView {
    
    func setLayouts() {
        
        [onboardingImage, onboardingLabel].forEach {
            contentView.addSubview($0)
        }
        
        onboardingImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80.0)
            $0.leading.trailing.equalToSuperview().inset(28.0)
            $0.height.equalTo(UIScreen.main.bounds.size.height / 2.2)
        }
        
        onboardingLabel.snp.makeConstraints {
            $0.top.equalTo(onboardingImage.safeAreaLayoutGuide.snp.bottom).offset(32.0)
            $0.centerX.equalToSuperview()
        }
        
        configureView()
    }
    
    func configureView() {
        
    }
    
    func configure(data: OnboadingItems) {
        onboardingImage.image = UIImage(named: data.imageName)
        onboardingLabel.text = data.text
    }
    
}
