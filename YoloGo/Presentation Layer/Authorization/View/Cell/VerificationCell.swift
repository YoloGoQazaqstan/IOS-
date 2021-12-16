//
//  VerificationCell.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 15.12.2021.
//

import UIKit

class VerificationCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private var titleLabel: CustomTitleLabel = {
        let lb = CustomTitleLabel(title: "Добро пожаловать")
        return lb
    }()
    
    private(set) lazy var subTitleLabel: CustomSubTitleLabel = {
        let lb = CustomSubTitleLabel()
        lb.text = "Код выслан на +77000000000"
        return lb
    }()
    
    private lazy var stackLabel: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            titleLabel,
            subTitleLabel
        ])
        
        sv.axis = .vertical
        sv.spacing = 10.0
        
        return sv
    }()
    
    private let otpView = CustomOTPView()
    
    public var resendLabel: CustomSubTitleLabel = {
        let lb = CustomSubTitleLabel()
        lb.text = "Получить новый код можно через 01:59"
        return lb
    }()
    
    lazy var verifyButton: ActualGradientButton = {
        let btn = ActualGradientButton(type: .system)
        btn.setButtonTitle(title: "Подтвердить", color: .white)
        return btn
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

extension VerificationCell: ConfigureView {
    
    func setLayouts() { 
        [stackLabel,
         otpView,
         resendLabel,
         verifyButton].forEach {
            contentView.addSubview($0)
        }
        
        stackLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32.0)
            $0.centerX.equalToSuperview()
        }
        
        otpView.snp.makeConstraints {
            $0.top.equalTo(stackLabel.safeAreaLayoutGuide.snp.bottom).offset(28.0)
            $0.height.equalTo(58.0)
            $0.leading.trailing.equalToSuperview().inset(12.0)
        }
        
        resendLabel.snp.makeConstraints {
            $0.top.equalTo(otpView.safeAreaLayoutGuide.snp.bottom).offset(16.0)
            $0.centerX.equalToSuperview()
        }
        
        verifyButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.bottom.equalToSuperview().offset(-16.0)
            $0.height.equalTo(48.0)
        }
    }
    
    func configureView() {}
}
