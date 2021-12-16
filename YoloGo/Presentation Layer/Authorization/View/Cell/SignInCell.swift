//
//  SignInCell.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 09.12.2021.
//

import Foundation
import UIKit

final class SignInCell: BaseCollectionViewCell {
    
    // MARK: - Properties
    
    private var titleLabel: CustomTitleLabel = {
        let lb = CustomTitleLabel(title: "Добро пожаловать")
        return lb
    }()
    
    private var subTitleLabel: CustomSubTitleLabel = {
        let lb = CustomSubTitleLabel()
        lb.text = "Заполните все поля, чтобы заказать\n такси:)"
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
    
    private var userNameTextField: CustomTextField = {
        let tf = CustomTextField(padding: 38.0)
        tf.placeholder = "Имя пользователя"
        return tf
    }()
    
    private lazy var phoneNumberTextField: CustomTextField = {
        let tf = CustomTextField(padding: 38.0)
        tf.keyboardType = .numberPad
        tf.placeholder = "Номер телефона"
        return tf
    }()
    
    private lazy var stackTextField: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            userNameTextField,
            phoneNumberTextField
        ])
        
        sv.spacing = 12.0
        sv.axis = .vertical
        
        return sv
    }()
    
    lazy var signInButton: ActualGradientButton = {
        let btn = ActualGradientButton(type: .system)
        btn.setButtonTitle(title: "Отправить sms", color: .white)
        return btn
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setLayouts()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userNameTextField.setLeftTextFieldImage(name: "user")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UI
extension SignInCell: ConfigureView {
    
    func setLayouts() {
        [stackLabel, stackTextField, signInButton].forEach {
            contentView.addSubview($0)
        }
        
        stackLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32.0)
            $0.centerX.equalToSuperview()
        }
        
        stackTextField.snp.makeConstraints {
            $0.top.equalTo(stackLabel.safeAreaLayoutGuide.snp.bottom).offset(28.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        signInButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.bottom.equalToSuperview().offset(-16.0)
            $0.height.equalTo(48.0)
        }
    }
    
    func configureView() {
        
    }
    
    // MARK: - Objective methods
    @objc
    private func showOnboardingFlow() {
        
    }
}

