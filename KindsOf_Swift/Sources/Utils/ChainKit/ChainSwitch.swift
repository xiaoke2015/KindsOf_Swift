//
//  ChainSwitch.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UISwitch

public extension ChainView where T: UISwitch {
    func onTintColor(_ onTintColor: UIColor?) -> Self {
        view.onTintColor = onTintColor
        return self
    }
    
    func thumbTintColor(_ thumbTintColor: UIColor?) -> Self {
        view.thumbTintColor = thumbTintColor
        return self
    }
    
    func onImage(_ onImage: UIImage?) -> Self {
        view.onImage = onImage
        return self
    }
    
    func offImage(_ offImage: UIImage?) -> Self {
        view.offImage = offImage
        return self
    }
    
    func isOn(_ isOn: Bool) -> Self {
        view.isOn = isOn
        return self
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event = .touchUpInside) -> Self {
        view.addTarget(target, action: action, for: controlEvents)
        return self
    }
}
