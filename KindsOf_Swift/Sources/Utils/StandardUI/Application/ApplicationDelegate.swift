//
//  ApplicationDelegate.swift
//  StandardUI
//
//  Created by 李加建 on 2021/10/11.
//

import UIKit

public protocol ApplicationDelegate: AnyObject {
    // 创建主window
    func applicationMainWindow() -> UIWindow

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error)

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)

    // universal link 唤起 App
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool

    // URL scheme 唤起 App
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool

    func applicationDidEnterBackground(_ application: UIApplication)

    func applicationWillEnterForeground(_ application: UIApplication)
}

public extension ApplicationDelegate {
    func applicationMainWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        return window
    }
}
