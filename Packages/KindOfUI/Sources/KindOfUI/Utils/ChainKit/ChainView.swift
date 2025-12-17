//
//  ChainView.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UIView

@MainActor extension UIView: Compatible {}

public extension ChainView where T: UIView {
    func backgroundColor(_ color: UIColor?) -> Self {
        view.backgroundColor = color
        return self
    }

    func frame(_ frame: CGRect) -> Self {
        view.frame = frame
        return self
    }

    func isUserInteractionEnabled(_ enabled: Bool) -> Self {
        view.isUserInteractionEnabled = enabled
        return self
    }

    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        view.clipsToBounds = clipsToBounds
        return self
    }

    func border(color: UIColor?, width: CGFloat) -> Self {
        view.layer.borderColor = color?.cgColor
        view.layer.borderWidth = width
        return self
    }

    func contentMode(_ mode: UIView.ContentMode) -> Self {
        view.contentMode = mode
        return self
    }

    func isHidden(_ isHidden: Bool) -> Self {
        view.isHidden = isHidden
        return self
    }

    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        view.layer.cornerRadius = cornerRadius
        return self
    }
}
