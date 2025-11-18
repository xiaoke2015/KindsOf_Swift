//
//  Then.swift
//  TestKinds
//
//  Created by i-sens on 2025/11/18.
//

import Foundation

protocol Then {}

extension Then where Self: Any {
    @discardableResult
    func then(_ block: (inout Self) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }
}

extension Then where Self: AnyObject {
    @discardableResult
    func then(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}


extension NSObject: Then {}
