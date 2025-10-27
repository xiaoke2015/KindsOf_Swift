//
//  NavigationController.swift
//  iSignal
//
//  Created by 李加建 on 2021/4/30.
//

import UIKit

extension UIImage {
    static func creatImage(color: UIColor?, size: CGSize) -> UIImage? {
        guard let color = color else { return nil }
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

public class NavigationController: UINavigationController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        let bundle = Bundle(for: NavigationController.self)
        let image = UIImage.creatImage(color: .clear, size: .init(width: 44, height: 44))
        navigationBar.setBackgroundImage(image, for: .default)
        interactivePopGestureRecognizer?.delegate = self
        interactivePopGestureRecognizer?.isEnabled = true
    }
    
    public var index: Int = 0
}

extension NavigationController: UINavigationControllerDelegate {}

extension NavigationController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool { viewControllers.count > 1 }
}

public extension NavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        topViewController?.preferredStatusBarStyle ?? super.preferredStatusBarStyle
    }
    
    override var prefersStatusBarHidden: Bool {
        topViewController?.prefersStatusBarHidden ?? super.prefersStatusBarHidden
    }
}
