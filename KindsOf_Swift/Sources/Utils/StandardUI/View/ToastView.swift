//
//  Toast.swift
//  Base
//
//  Created by 李加建 on 2021/4/25.
//

import Foundation
import UIKit

struct ToastManager {
    static var fadeDuration: TimeInterval {
        0.2
    }
}

class ToastView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title _: String?, message _: String?, image _: UIImage?) {
        super.init(frame: .zero)
    }

    init(message: String?) {
        super.init(frame: .zero)
        setupMessage(message: message)
    }

    init(activity frame: CGRect) {
        super.init(frame: frame)
        setupActivity()
    }

    private lazy var bgView: UIButton = {
        let lazy = UIButton(frame: bounds)
        lazy.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return lazy
    }()

    private lazy var customView: UIView = {
        let lazy = UIView(frame: CGRect(x: 0, y: 0, width: 298, height: 0))
        lazy.backgroundColor = .white
        lazy.layer.cornerRadius = 20
        return lazy
    }()

    private lazy var titleLabel: UILabel = {
        let lazy = UILabel()
        lazy.font = UIFont.boldSystemFont(ofSize: 18)
        lazy.textColor = UIColor.black.withAlphaComponent(0.82)
        lazy.textAlignment = .center
        return lazy
    }()

    private lazy var messageLabel: UILabel = {
        let lazy = UILabel(frame: CGRect(x: 16, y: 16, width: 298, height: 16))
        lazy.font = UIFont.systemFont(ofSize: 16)
        lazy.textColor = .white
        lazy.numberOfLines = 0
        return lazy
    }()
    
    private var showAnimate: Bool = false
}

extension ToastView {
    func setupMessage(message: String?) {
        messageLabel.text = message
        addSubview(messageLabel)
        messageLabel.sizeToFit()
        let size: CGSize = messageLabel.frame.size
        let origin = messageLabel.frame.origin
        frame = CGRect(x: 0, y: 0, width: size.width + origin.x * 2, height: size.height + origin.y * 2)
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        layer.cornerRadius = 10
    }

    func setupActivity() {
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        layer.cornerRadius = 10
        let activityIndicatorView: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            activityIndicatorView = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        }
        activityIndicatorView.center = CGPoint(x: bounds.size.width / 2.0, y: bounds.size.height / 2.0)
        addSubview(activityIndicatorView)
        activityIndicatorView.color = .white
        activityIndicatorView.startAnimating()

//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 8
//        layer.shadowRadius = 6
//        layer.shadowOffset = CGSize(width: 4, height: 4)
    }
}

public extension UIView {
    private enum ToastKeys {
        static var timer = "ToastKeys.timer"
        static var duration = "ToastKeys.duration"
        static var point = "ToastKeys.point"
        static var completion = "ToastKeys.completion"
        static var activeToasts = "ToastKeys.activeToasts"
        static var activityView = "ToastKeys.activityView"
        static var queue = "ToastKeys.queue"
    }

    private func showToast(_ toast: UIView, duration: TimeInterval, point _: CGPoint) {
        addSubview(toast)
        UIView.animate(withDuration: ToastManager.fadeDuration, delay: 0.0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            toast.alpha = 1.0
        }) { _ in

            let timer = Timer(timeInterval: duration, target: self, selector: #selector(UIView.toastTimerDidFinish(_:)), userInfo: nil, repeats: false)
            RunLoop.main.add(timer, forMode: .common)
            objc_setAssociatedObject(self, ToastKeys.timer, timer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

//    func makeToast(_ message: String?, offset: CGPoint = .zero, completion: (() -> Void)? = nil) {
////        timerStop()
//        let toast = ToastView(message: message)
//        objc_setAssociatedObject(self, ToastKeys.activeToasts, toast, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        addSubview(toast)
//        toast.center = CGPoint(x: bounds.width / 2 + offset.x, y: bounds.height / 2 + offset.y)
//        toast.show(duration: 1.5, completion: completion)
//    }

    func hideToast() {
        if let toast = objc_getAssociatedObject(self, ToastKeys.activeToasts) as? UIView {
            UIView.animate(withDuration: ToastManager.fadeDuration, delay: 0.0, options: [.curveEaseIn, .beginFromCurrentState], animations: {
                toast.alpha = 0.0
            }) { _ in
                toast.removeFromSuperview()
                objc_setAssociatedObject(self, ToastKeys.activeToasts, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    func makeToastActivity(_ size: CGSize = CGSize(width: 100, height: 100), offset: CGPoint = .zero) {
        var toast = objc_getAssociatedObject(self, ToastKeys.activityView) as? ToastView
        if toast == nil {
            toast = ToastView(activity: CGRect(origin: .zero, size: size))
            objc_setAssociatedObject(self, ToastKeys.activityView, toast, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

        if let toastView = toast {
            addSubview(toastView)
            toastView.center = CGPoint(x: bounds.width / 2 + offset.x, y: bounds.height / 2 + offset.y)
            toastView.animateShow()
        }
    }

    func hideToastActivity() {
        if let toast = objc_getAssociatedObject(self, ToastKeys.activityView) as? UIView {
            UIView.animate(withDuration: ToastManager.fadeDuration, delay: 0.0, options: [.curveEaseIn, .beginFromCurrentState], animations: {
                toast.alpha = 0.0
            }) { _ in
                toast.removeFromSuperview()
                objc_setAssociatedObject(self, ToastKeys.activityView, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    func makeToastLoading(_ offset: CGPoint = .zero) {
        isUserInteractionEnabled = false
        makeToastActivity(CGSize(width: 100, height: 100), offset: offset)
    }

    func hideToastLoading() {
        isUserInteractionEnabled = true
        hideToastActivity()
    }
}

extension ToastView {
    func show(duration: TimeInterval = 1.5, completion: (() -> Void)? = nil) {
        alpha = 0.0
        UIView.animate(withDuration: ToastManager.fadeDuration, delay: 0.0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.alpha = 1.0
        }) { success in
            if success {
                self.hide(duration: duration - ToastManager.fadeDuration, completion: completion)
            }
        }
    }

    func hide(duration: TimeInterval, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: ToastManager.fadeDuration, delay: duration - ToastManager.fadeDuration, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.alpha = 0.0
        }) { success in
            if success {
                completion?()
                self.showAnimate = false
                self.removeFromSuperview()
            }
        }
    }
}

extension UIView {
    @objc
    private func toastTimerDidFinish(_ timer: Timer) {
        timer.invalidate()
        hideToast()
    }

    private func timerStop() {
        if let toast = objc_getAssociatedObject(self, ToastKeys.activeToasts) as? UIView {
            toast.removeFromSuperview()
        }

        if let timer = objc_getAssociatedObject(self, ToastKeys.timer) as? Timer {
            timer.invalidate()
        }
    }
}

extension ToastView {
    func animateShow() {
        if !showAnimate {
            showAnimate = true
            alpha = 0.0
            UIView.animate(withDuration: ToastManager.fadeDuration, delay: 0.0, options: .curveEaseOut, animations: {
                self.alpha = 1.0
            })
        }
    }

    func animateShow(completion: ((Bool) -> Void)? = nil) {
        alpha = 0.0
        UIView.animate(withDuration: ToastManager.fadeDuration, delay: 0.0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
}
