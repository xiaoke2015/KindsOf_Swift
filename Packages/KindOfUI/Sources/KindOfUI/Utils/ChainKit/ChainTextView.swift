//
//  ChainTextView.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UITextView

public extension ChainView where T: UITextView {
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
    
    func delegate(_ delegate: UITextViewDelegate?) -> Self {
        view.delegate = delegate
        return self
    }
}
