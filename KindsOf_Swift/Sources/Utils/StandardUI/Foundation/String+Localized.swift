//
//  String+Localized.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/12/1.
//

import Foundation

public extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
    
    func localized(_ arguments: any CVarArg...) -> String {
        String(format: NSLocalizedString(self, comment: ""), arguments)
    }
}
