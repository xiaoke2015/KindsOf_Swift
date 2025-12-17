//
//  File.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UIButton

public extension ChainView where T: UIButton {
    func setImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        view.setImage(image, for: state)
        return self
    }

    func setBackgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        view.setBackgroundImage(image, for: state)
        return self
    }

    func setTitle(_ title: String?, for state: UIControl.State) -> Self {
        view.setTitle(title, for: state)
        return self
    }

    func setTitleColor(_ color: UIColor?, for state: UIControl.State) -> Self {
        view.setTitleColor(color, for: state)
        return self
    }

    func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State) -> Self {
        view.setAttributedTitle(title, for: state)
        return self
    }

    func titleFont(_ font: UIFont?) -> Self {
        view.titleLabel?.font = font
        return self
    }

    func contentVerticalAlignment(_ alignment: UIControl.ContentVerticalAlignment) -> Self {
        view.contentVerticalAlignment = alignment
        return self
    }

    func contentHorizontalAlignment(_ alignment: UIControl.ContentHorizontalAlignment) -> Self {
        view.contentHorizontalAlignment = alignment
        return self
    }

    func titleEdgeInsets(_ edge: UIEdgeInsets) -> Self {
        view.titleEdgeInsets = edge
        return self
    }

    func imageEdgeInsets(_ edge: UIEdgeInsets) -> Self {
        view.imageEdgeInsets = edge
        return self
    }

    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event = .touchUpInside) -> Self {
        view.addTarget(target, action: action, for: controlEvents)
        return self
    }
}
