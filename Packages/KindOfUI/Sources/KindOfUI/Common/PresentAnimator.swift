//
// PresentAnimator.swift
//
// Copyright 2023 SwifterSwift
//

import UIKit

public protocol PresentAnimatorDelegate: AnyObject {
    func presentAnimateStateShow()
    func presentAnimateStateHide()
}

public class PresentAnimator: NSObject {
    var isPresented: Bool = false

    var duration: TimeInterval = 0.2

    weak var delegate: PresentAnimatorDelegate?

    public init(_ delegate: PresentAnimatorDelegate? = nil, duration: TimeInterval = 0.2) {
        self.delegate = delegate
        self.duration = duration
    }
}

extension PresentAnimator: UIViewControllerTransitioningDelegate {
    public func animationController(
        forPresented _: UIViewController,
        presenting _: UIViewController,
        source _: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        return self
    }

    public func animationController(forDismissed _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        return self
    }
}

extension PresentAnimator: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using _: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("safeAreaInsets = \(transitionContext.containerView.safeAreaInsets)")
        if isPresented {
            guard let toViewController = transitionContext.viewController(forKey: .to) else {
                return
            }
            transitionContext.containerView.addSubview(toViewController.view)
            delegate?.presentAnimateStateHide()
            UIView.animate(withDuration: duration, animations: {
                self.delegate?.presentAnimateStateShow()
            }) { finish in
                transitionContext.completeTransition(finish)
            }
        } else {
            guard let fromViewController = transitionContext.viewController(forKey: .from) else {
                return
            }
            transitionContext.containerView.addSubview(fromViewController.view)
            delegate?.presentAnimateStateShow()
            UIView.animate(withDuration: duration, animations: {
                self.delegate?.presentAnimateStateHide()
            }) { finish in
                transitionContext.completeTransition(finish)
            }
        }
    }
}
