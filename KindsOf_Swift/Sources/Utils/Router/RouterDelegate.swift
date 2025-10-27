//
//  RouterDelegate.swift
//  RouterDemo
//
//  Created by 李加建 on 2021/6/4.
//

import UIKit

public protocol RouterDelegate: AnyObject {
    static func initialize(params: [String: Any]) -> UIViewController?
}

extension RouterDelegate {
    static func initialize(params _: [String: Any]) -> UIViewController? {
        nil
    }

    static var isAnimated: Bool {
        true
    }
}
