//
//  TabbarViewController.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/10/27.
//

import UIKit
import UserNotifications

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let home = HomeViewController()
        home.title = "home"
        let homeNav = UINavigationController(rootViewController: home)
        
        let square = SquareViewController()
        square.title = "square"
        let squareNav = UINavigationController(rootViewController: square)
        
        let message = MessageViewController()
        message.title = "message"
        let messageNav = UINavigationController(rootViewController: message)
        
        let profile = ProfileViewController()
        profile.title = "profile"
        let profileNav = UINavigationController(rootViewController: profile)
        
        viewControllers = [homeNav, squareNav, messageNav, profileNav]
        
    }
    
    func ad() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .criticalAlert, .sound]) { granted, error in
            
        }
        
        
        UNUserNotificationCenter.current().delegate = self
    }
}

extension TabbarViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 允许在前台显示推送（带声音、横幅等）
        completionHandler([.banner, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
