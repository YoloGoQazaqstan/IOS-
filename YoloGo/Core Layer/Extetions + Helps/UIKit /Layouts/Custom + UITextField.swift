//
//  CustomTextField.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 12.12.2021.
//

import UIKit

class CustomTextField: UITextField {
    
    let padding: CGFloat
 
    init(padding: CGFloat) {
        self.padding = padding
        super.init(frame: .zero)
        backgroundColor = .white
        setTextFieldShadow()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 16.0
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
     
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: 48.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UITextField {
    
    public func setTextFieldShadow() {
        layer.cornerRadius = self.frame.size.height / 2
        clipsToBounds = false
        layer.shadowOpacity = 0.4
        layer.shadowColor = UIColor.green.withAlphaComponent(0.4).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    public func setLeftTextFieldImage(name image: String) {
        let imageView = UIImageView(frame: CGRect(x: 8.0,
                                                  y: 8.0,
                                                  width: 24.0,
                                                  height: 24.0))
        let image = UIImage(named: image)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit

        let view = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: 40,
                                        height: 40))
        view.addSubview(imageView)
        leftViewMode = .always
        leftView = view
    }
}
