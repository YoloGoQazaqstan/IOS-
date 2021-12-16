//
//  YoloTextField.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 16.12.2021.
//

import UIKit

class YoloCustomView: UIView {
    
    // MARK: - Properties
    
    var address: String
    var icon: String
    
    public lazy var addressLabel: UILabel = {
        let lb = UILabel()
        lb.text = address
        lb.textColor = .black
        lb.font = Fonts.medium(size: 16.0)
        lb.numberOfLines = 0
        lb.textAlignment = .natural
        return lb
    }()
    
    public lazy var addressImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: icon)
        return img
    }()
    
    init(icon: String, address: String) {
        self.address = address
        self.icon = icon
        super.init(frame: .zero)
        setLayouts()
    }
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure View

extension YoloCustomView: ConfigureView {
    
    func setLayouts() {
        
        [addressImage, addressLabel].forEach {
            addSubview($0)
        }
        
        addressImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10.0)
            $0.height.width.equalTo(28.0)
            $0.centerY.equalToSuperview()
        }
        
        addressLabel.snp.makeConstraints {
            $0.leading.equalTo(addressImage.safeAreaLayoutGuide.snp.trailing).offset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.centerY.equalTo(addressImage.snp.centerY)
        }
        
        configureView()
    }
    
    func configureView() {
        backgroundColor = .yoloGray
        layer.cornerRadius = 16.0
        
        snp.makeConstraints { make in
            make.height.equalTo(48.0)
        }
    }
}
