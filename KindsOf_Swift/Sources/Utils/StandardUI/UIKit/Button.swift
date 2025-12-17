//
//  Button.swift
//  StandardUI
//
//  Created by 李加建 on 2021/11/17.
//

import UIKit

public extension UIButton {
    func repeatClick(deadline: DispatchTime = .now() + 1) {
        isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.isUserInteractionEnabled = true
        }
    }
}
