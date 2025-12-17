//
//  Router.swift
//  RouterDemo
//
//  Created by 李加建 on 2021/6/4.
//

import UIKit

extension UIApplication {
    /// 获取当前活跃的 key window（支持多场景）
    var currentKeyWindow: UIWindow? {
        // iOS 13+ 支持多场景，需要从连接的场景中获取
        if #available(iOS 13.0, *) {
            return connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        } else {
            // iOS 13 之前使用旧的 keyWindow
            return keyWindow
        }
    }
}


@MainActor public class Router {
    /// 路由管理单例
    public static var shared = Router()

    /// 根 window
    public static var window: UIWindow?

    /// 路由的根控制器
    public var rootViewController: UIViewController? {
        UIApplication.shared.currentKeyWindow?.rootViewController
    }

    /// 注册路由可跳转的 Controllers
    var viewControllers: [String: RouterDelegate.Type] = [:]
    
    var viewControllers2: [String: (URLNode) -> UIViewController] = [:]
    
    private let delegates = NSHashTable<UITableViewDataSource>.weakObjects()
    
    public func register(_ url: String, node: @escaping (URLNode) -> UIViewController) {
        viewControllers2[url] = node
    }

}

public extension Router {
    /// push 跳转 url传参 例 path?name=111
    func push(url: String, animated: Bool = true) {
        let urlComponents = URLComponents(string: "")
        let decoder = URLDecoder(urlString: url)
        push(url: decoder.url, params: decoder.params, animated: animated)
    }

    /// push 跳转 复杂参数跳转
    func push(url: String, data: Data?, animated: Bool = true) {
        let decoder = URLDecoder(urlString: url)
        decoder.append(data: data)
        push(url: decoder.url, params: decoder.params, animated: animated)
    }

    func push(url: String, params: [String: Any], animated: Bool = true) {
        guard let type = viewControllers[url] else { return }
        guard let next = type.initialize(params: params) else { return }
        navigationController?.pushViewController(next, animated: animated)
    }
    
    func push2(url: String?, params: [String: Any]? = nil, data: Data? = nil, animated: Bool = true, dismiss: (() -> Void)? = nil) {
        let node = URLNode(string: url)
        node.data = data
        node.object = params
        node.dismiss = dismiss
        guard let host = node.host else { return }
        guard let next = viewControllers2[host]?(node) else { return }
        navigationController?.pushViewController(next, animated: animated)
    }

    func register(routers: [String: RouterDelegate.Type]) {
        _ = routers.map { key, value in
            self.viewControllers[key] = value
        }
    }
}

public extension Router {
    /// present 跳转 url传参 例 path?name=111
    func present(url: String, animated: Bool = true) {
        let decoder = URLDecoder(urlString: url)
        present(url: decoder.url, params: decoder.params, animated: animated)
    }

    /// present 跳转 复杂参数跳转
    func present(url: String, data: Data?, animated: Bool = true) {
        let decoder = URLDecoder(urlString: url)
        decoder.append(data: data)
        present(url: decoder.url, params: decoder.params, animated: animated)
    }

    func present(url: String, params: [String: Any], animated: Bool = true) {
        guard let type = viewControllers[url] else { return }
        guard let next = type.initialize(params: params) else { return }
        navigationController?.topViewController?.present(next, animated: animated, completion: nil)
    }
}

public extension Router {
    static func pushViewController(_ viewController: UIViewController, animated: Bool) {
        Router.shared.navigationController?.pushViewController(viewController, animated: animated)
    }
}

public extension Router {
    static func open(_ urlString: String?) {
        if let string = urlString, let url = URL(string: string) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    static func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        Router.shared.rootViewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}

public extension Router {
    /// present 跳转 url传参 例 path?name=111
    func rootPresent(url: String, animated: Bool = true) {
        let decoder = URLDecoder(urlString: url)
        rootPresent(url: decoder.url, params: decoder.params, animated: animated)
    }

    /// present 跳转 复杂参数跳转
    func rootPresent(url: String, data: Data?, animated: Bool = true) {
        let decoder = URLDecoder(urlString: url)
        decoder.append(data: data)
        rootPresent(url: decoder.url, params: decoder.params, animated: animated)
    }
    
    /// 跟视图 present
    /// - Parameters:
    ///   - url: 路由
    ///   - params: 参数
    ///   - animated: 是否有动画
    func rootPresent(url: String, params: [String: Any], animated: Bool = true) {
        guard let type = viewControllers[url] else { return }
        guard let next = type.initialize(params: params) else { return }
        Router.shared.rootViewController?.present(next, animated: animated, completion: nil)
    }
}

extension Router {
    /// 根据当前的 rootViewController 获取 navigationController
    private var navigationController: UINavigationController? {
        var navi: UINavigationController?
        if rootViewController is UINavigationController {
            navi = rootViewController as? UINavigationController
        } else if rootViewController is UITabBarController {
            let tabbar = rootViewController as? UITabBarController
            if let presentNavi = tabbar?.presentedViewController as? UINavigationController {
                navi = presentNavi
            } else {
                navi = tabbar?.selectedViewController as? UINavigationController
            }
        }
        return navi
    }
}
