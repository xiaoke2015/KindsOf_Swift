//
//  NavigationController.swift
//  iSensAir
//
//  Created by 李加建 on 2025/11/11.
//

import UIKit

public class NavigationController: UINavigationController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        interactivePopGestureRecognizer?.delegate = self
    }
    

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(true, animated: animated)
    }

}

extension NavigationController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}

public extension NavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        topViewController?.preferredStatusBarStyle ?? super.preferredStatusBarStyle
    }
    
    override var prefersStatusBarHidden: Bool {
        topViewController?.prefersStatusBarHidden ?? super.prefersStatusBarHidden
    }
}
