//
//  SingleDigitField .swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 15.12.2021.
//

import UIKit

class SingleDigitField: UITextField {
    
    var pressedDelete = false
    
    override func willMove(toSuperview newSuperview: UIView?) {
        keyboardType = .numberPad
        textAlignment = .center
        isUserInteractionEnabled = false
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect { .zero }
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] { [] }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool { false }
    override func deleteBackward() {
        pressedDelete = true
        sendActions(for: .editingChanged)
    }
}
