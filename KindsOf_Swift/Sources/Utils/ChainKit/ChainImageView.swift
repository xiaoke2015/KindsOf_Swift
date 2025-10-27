//
//  File.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UIImageView

public extension ChainView where T: UIImageView {
    func image(_ image: UIImage?) -> Self {
        view.image = image
        return self
    }

    func animationImages(_ images: [UIImage]) -> Self {
        view.animationImages = images
        return self
    }

    func addTarget(_ target: Any?, action: Selector) -> Self {
        let tap = UITapGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        return self
    }
}
