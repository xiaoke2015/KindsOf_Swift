//
//  Then.swift
//  iSensAir
//
//  Created by 李加建 on 2025/11/14.
//

import Foundation
import CoreGraphics

public protocol Then {}

public extension Then where Self: Any {
    @discardableResult
    func then(_ block: (inout Self) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }
}

public extension Then where Self: AnyObject {
    @discardableResult
    func then(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Then {}
extension DateComponents: Then {}
extension CGPoint: Then {}
extension CGRect: Then {}
extension CGSize: Then {}
extension CGVector: Then {}
