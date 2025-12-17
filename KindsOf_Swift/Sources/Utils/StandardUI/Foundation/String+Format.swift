//
//  String+Format.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/12/1.
//

import Foundation

public extension String {
    func toFormat(_ format: String) -> String {
        String(format: format, self)
    }
}

public extension String {
    func attributed(_ attrs: [NSAttributedString.Key : Any]? = nil) -> NSAttributedString {
        NSAttributedString(string: self, attributes: attrs)
    }
    
    func mutableAttributed(_ attrs: [NSAttributedString.Key : Any]? = nil) -> NSMutableAttributedString {
        NSMutableAttributedString(string: self, attributes: attrs)
    }
}
