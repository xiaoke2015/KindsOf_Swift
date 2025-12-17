//
//  ChainTextField.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UITextField

public extension ChainView where T: UITextField {
    func keyboardType(_ type: UIKeyboardType) -> Self {
        view.keyboardType = type
        return self
    }

    func isSecureTextEntry(_ isSecureTextEntry: Bool) -> Self {
        view.isSecureTextEntry = isSecureTextEntry
        return self
    }

    func text(_ text: String?) -> Self {
        view.text = text
        return self
    }

    func textColor(_ textColor: UIColor?) -> Self {
        view.textColor = textColor
        return self
    }

    func font(_ font: UIFont?) -> Self {
        view.font = font
        return self
    }

    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        view.textAlignment = textAlignment
        return self
    }

    func attributedText(_ text: NSAttributedString?) -> Self {
        view.attributedText = text
        return self
    }

    func placeholder(_ placeholder: String?) -> Self {
        view.placeholder = placeholder
        return self
    }

    func attributedPlaceholder(_ placeholder: NSAttributedString?) -> Self {
        view.attributedPlaceholder = placeholder
        return self
    }

    func auto(capitalizationType: UITextAutocapitalizationType = .none, correctionType: UITextAutocorrectionType = .no) -> Self {
        view.autocapitalizationType = capitalizationType
        view.autocorrectionType = correctionType
        return self
    }
    
    func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        view.delegate = delegate
        return self
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event = .editingChanged) -> Self {
        view.addTarget(target, action: action, for: controlEvents)
        return self
    }
}
