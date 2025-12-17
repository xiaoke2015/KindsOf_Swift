//
//  ChainLabel.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UILabel

public extension ChainView where T: UILabel {
    func font(_ font: UIFont?) -> Self {
        view.font = font
        return self
    }

    func textColor(_ textColor: UIColor?) -> Self {
        view.textColor = textColor
        return self
    }

    func text(_ text: String?) -> Self {
        view.text = text
        return self
    }

    func attributedText(_ text: NSAttributedString?) -> Self {
        view.attributedText = text
        return self
    }

    func lineBreakMode(_ mode: NSLineBreakMode) -> Self {
        view.lineBreakMode = mode
        return self
    }

    func numberOfLines(_ lines: Int) -> Self {
        view.numberOfLines = lines
        return self
    }

    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        view.textAlignment = textAlignment
        return self
    }
}
