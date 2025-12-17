//
//  File.swift
//
//
//  Created by 李加建 on 2023/6/13.
//

import Foundation

public extension AppConst {
    /// 是否需要更新版本
    /// - Parameter version: server version
    /// - Returns: needUpdate
    static func needUpdate(_ version: String?) -> Bool {
        guard let version = version else { return false }
        let appVersion = AppConst.version
        let result = appVersion.compare(version, options: .numeric, range: nil, locale: nil)
        if result == .orderedAscending {
            return true
        } else {
            return false
        }
    }
}
