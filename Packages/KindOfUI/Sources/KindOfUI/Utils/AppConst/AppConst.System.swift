// SystemConfig.swift - Copyright 2023 SwifterSwift

import CoreTelephony
import Foundation
import SystemConfiguration.CaptiveNetwork

public extension AppConst {
    static func currentWifiInfo() -> NSDictionary? {
        /*

         Asscess WIFI info
         "NSLocationAlwaysUsageDescription"
         "NSLocationAlwaysAndWhenInUseUsageDescription"
         "NSLocationWhenInUseUsageDescription"
         在iOS 13之前，只要能够连接上WiFi就可以获取到WiFi信息。
         在iOS 13之后，需要为应用授权获取WiFi信息的能力，还要授权获取位置，才能获取到WiFi信息。

         */

        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    return interfaceInfo
                }
            }
        }
        return nil
    }

    /// 获取手机信息
    /// - Returns: []
    static func currentTelephony() -> [String: Any] {
        let info = CTTelephonyNetworkInfo()
        let carrier = info.subscriberCellularProvider
        let currentRadioTech = info.currentRadioAccessTechnology

        var interfaceInfo: [String: Any] = [:]

        var accessTechnology: [String: String] = [:]
        accessTechnology[CTRadioAccessTechnologyGPRS] = "2G"
        accessTechnology[CTRadioAccessTechnologyEdge] = "2G"
        accessTechnology[CTRadioAccessTechnologyCDMA1x] = "2G"
        accessTechnology[CTRadioAccessTechnologyWCDMA] = "3G"
        accessTechnology[CTRadioAccessTechnologyWCDMA] = "3G"
        accessTechnology[CTRadioAccessTechnologyHSUPA] = "3G"
        accessTechnology[CTRadioAccessTechnologyCDMAEVDORev0] = "3G"
        accessTechnology[CTRadioAccessTechnologyCDMAEVDORevA] = "3G"
        accessTechnology[CTRadioAccessTechnologyCDMAEVDORevB] = "3G"
        accessTechnology[CTRadioAccessTechnologyLTE] = "4G"

        if #available(iOS 14.1, *) {
            accessTechnology[CTRadioAccessTechnologyNRNSA] = "5G"
            accessTechnology[CTRadioAccessTechnologyNR] = "5G"
        }

        interfaceInfo["accessTechnology"] = accessTechnology[currentRadioTech ?? ""]
        interfaceInfo["currentRadio"] = currentRadioTech
        interfaceInfo["carrierName"] = carrier?.carrierName
        interfaceInfo["mobileCountryCode"] = carrier?.mobileCountryCode
        interfaceInfo["mobileNetworkCode"] = carrier?.mobileNetworkCode
        interfaceInfo["isoCountryCode"] = carrier?.isoCountryCode
        interfaceInfo["allowsVOIP"] = carrier?.allowsVOIP

        return interfaceInfo
    }
}
