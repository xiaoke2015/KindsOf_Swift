//
//  Button.swift
//  StandardUI
//
//  Created by 李加建 on 2021/11/17.
//

import UIKit

public extension UIButton {
    func repeatClick() {
        isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isUserInteractionEnabled = true
        }
    }
}
