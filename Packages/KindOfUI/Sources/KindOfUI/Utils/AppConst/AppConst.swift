//
//  AppConst.swift
//
//  Created by 李加建 on 2021/9/29
//

import Foundation
import UIKit

@MainActor public class AppConst {
    init() {}

    /// bundleId
    public static var bundleId: String {
        Bundle.main.bundleIdentifier ?? ""
    }

    /// app 显示名称
    public static var displayName: String {
        Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }

    /// app 版本
    public static var version: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    /// app build 版本
    public static var build: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }

    /// app icon
    public static var primaryIcon: String? {
        let info: [String: Any]? = Bundle.main.infoDictionary
        let bundleIcons: [String: Any]? = info?["CFBundleIcons"] as? [String: Any]
        let bundlePrimaryIcon: [String: Any]? = bundleIcons?["CFBundlePrimaryIcon"] as? [String: Any]
        let bundleIconFiles: [Any]? = bundlePrimaryIcon?["CFBundleIconFiles"] as? [Any]
        return bundleIconFiles?.last as? String
    }

    /// e.g. @"iPhone", @"iPod touch"
    @MainActor public static var deviceModel: String {
        UIDevice.current.model
    }

    /// 设备系统版本  e.g. "4.0"
    @MainActor public static var systemVersion: String {
        UIDevice.current.systemVersion
    }

    /// e.g. @"iPhone", @"iPod touch"
    @MainActor public static var systemName: String {
        UIDevice.current.name
    }

    /// 设备唯一标识符
    @MainActor public static var deviceUUID: String {
        UIDevice.current.identifierForVendor?.uuidString ?? ""
    }

    /// 时间戳
    public static var timestamp: String {
        "\(Date().timeIntervalSince1970)"
    }

    /// e.g.  "zh".
    public static var localLanguage: String {
        Locale.current.languageCode ?? ""
    }

    /// e.g.  "iPhone12,1".
    public static var systemInfo: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }

    /// 随机六位数
    public static var nonce: String {
        String(format: "%06d", Int.random(in: 0 ... 999_999))
    }
}
