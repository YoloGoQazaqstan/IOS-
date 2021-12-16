//
//  CustomOTPView.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 15.12.2021.
//

import UIKit

class CustomOTPView: UIView {
    
    // MARK: - Properties
    
    private var firstDigitField: SingleDigitField = {
        let tf = SingleDigitField()
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = .white
        return tf
    }()
    
    private var secondDigitField: SingleDigitField = {
        let tf = SingleDigitField()
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = .white
        return tf
    }()
    
    private var thirdDigitField: SingleDigitField = {
        let tf = SingleDigitField()
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = .white
        return tf
    }()
    
    private var fourthDigitField: SingleDigitField = {
        let tf = SingleDigitField()
        tf.layer.borderColor = UIColor.white.cgColor
        tf.backgroundColor = .white
        return tf
    }()
    
    private lazy var stackTextField: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            firstDigitField,
            secondDigitField,
            thirdDigitField,
            fourthDigitField
        ])
        
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 16.0
        
        return sv
    }()
    
    // MARK: - Init
   
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setLayouts()
        
        [firstDigitField, secondDigitField, thirdDigitField, fourthDigitField].forEach {
            $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        }
        
        firstDigitField.isUserInteractionEnabled = true
        firstDigitField.becomeFirstResponder()
    }
    
    @objc func editingChanged(_ textField: SingleDigitField) {
        if textField.pressedDelete {
            textField.pressedDelete = false
            if textField.hasText {
                textField.text = ""
            } else {
                switch textField {
                case secondDigitField, thirdDigitField, fourthDigitField:
                    textField.resignFirstResponder()
                    textField.isUserInteractionEnabled = false
                    switch textField {
                    case secondDigitField:
                        firstDigitField.isUserInteractionEnabled = true
                        firstDigitField.becomeFirstResponder()
                        firstDigitField.text = ""
                    case thirdDigitField:
                        secondDigitField.isUserInteractionEnabled = true
                        secondDigitField.becomeFirstResponder()
                        secondDigitField.text = ""
                    case fourthDigitField:
                        thirdDigitField.isUserInteractionEnabled = true
                        thirdDigitField.becomeFirstResponder()
                        thirdDigitField.text = ""
                    default:
                        break
                    }
                default: break
                }
            }
        }

        guard textField.text?.count == 1, textField.text?.last?.isWholeNumber == true else {
            textField.text = ""
            return
        }
        
        switch textField {
            
        case firstDigitField, secondDigitField, thirdDigitField:
            textField.resignFirstResponder()
            textField.isUserInteractionEnabled = false
            
            switch textField {
            case firstDigitField:
                secondDigitField.isUserInteractionEnabled = true
                secondDigitField.becomeFirstResponder()
            case secondDigitField:
                thirdDigitField.isUserInteractionEnabled = true
                thirdDigitField.becomeFirstResponder()
            case thirdDigitField:
                fourthDigitField.isUserInteractionEnabled = true
                fourthDigitField.becomeFirstResponder()
            default: break
            }
        case fourthDigitField:
            fourthDigitField.resignFirstResponder()
        default: break
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomOTPView: ConfigureView {
    
    func setLayouts() {
        [stackTextField].forEach {
            addSubview($0)
        }
        
        [firstDigitField, secondDigitField, thirdDigitField, fourthDigitField].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(58.0)
            }
            
            $0.layer.cornerRadius = 16.0
        }
        
        stackTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(32.0)
        }
    }
    
    func configureView() {
        
    }
}

