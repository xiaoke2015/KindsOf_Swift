//
//  File.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UIScrollView

public extension ChainView where T: UIScrollView {
    func contentOffset(_ contentOffset: CGPoint) -> Self {
        view.contentOffset = contentOffset
        return self
    }

    func contentSize(_ contentSize: CGSize) -> Self {
        view.contentSize = contentSize
        return self
    }

    func contentInset(_ contentInset: UIEdgeInsets) -> Self {
        view.contentInset = contentInset
        return self
    }

    @available(iOS 11.0, *)
    func contentInsetAdjustmentBehavior(_ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior) -> Self {
        view.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }

    @available(iOS 13.0, *)
    func automaticallyAdjustsScrollIndicatorInsets(_ automaticallyAdjustsScrollIndicatorInsets: Bool) -> Self {
        view.automaticallyAdjustsScrollIndicatorInsets = automaticallyAdjustsScrollIndicatorInsets
        return self
    }

    func delegate(_ delegate: UIScrollViewDelegate?) -> Self {
        view.delegate = delegate
        return self
    }

    func isDirectionalLockEnabled(_ isDirectionalLockEnabled: Bool) -> Self {
        view.isDirectionalLockEnabled = isDirectionalLockEnabled
        return self
    }

    func bounces(_ bounces: Bool) -> Self {
        view.bounces = bounces
        return self
    }

    func alwaysBounceVertical(_ alwaysBounceVertical: Bool) -> Self {
        view.alwaysBounceVertical = alwaysBounceVertical
        return self
    }

    func alwaysBounceHorizontal(_ alwaysBounceHorizontal: Bool) -> Self {
        view.alwaysBounceHorizontal = alwaysBounceHorizontal
        return self
    }

    func isPagingEnabled(_ isPagingEnabled: Bool) -> Self {
        view.isPagingEnabled = isPagingEnabled
        return self
    }

    func isScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        view.isScrollEnabled = isScrollEnabled
        return self
    }

    func showsVerticalScrollIndicator(_ showsVerticalScrollIndicator: Bool) -> Self {
        view.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        return self
    }

    func showsHorizontalScrollIndicator(_ showsHorizontalScrollIndicator: Bool) -> Self {
        view.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        return self
    }

    func indicatorStyle(_ indicatorStyle: UIScrollView.IndicatorStyle) -> Self {
        view.indicatorStyle = indicatorStyle
        return self
    }

    @available(iOS 11.1, *)
    func verticalScrollIndicatorInsets(_ verticalScrollIndicatorInsets: UIEdgeInsets) -> Self {
        view.verticalScrollIndicatorInsets = verticalScrollIndicatorInsets
        return self
    }

    @available(iOS 11.1, *)
    func horizontalScrollIndicatorInsets(_ horizontalScrollIndicatorInsets: UIEdgeInsets) -> Self {
        view.horizontalScrollIndicatorInsets = horizontalScrollIndicatorInsets
        return self
    }

    func scrollIndicatorInsets(_ scrollIndicatorInsets: UIEdgeInsets) -> Self {
        view.scrollIndicatorInsets = scrollIndicatorInsets
        return self
    }

    func decelerationRate(_ decelerationRate: UIScrollView.DecelerationRate) -> Self {
        view.decelerationRate = decelerationRate
        return self
    }

    func setContentOffset(_ contentOffset: CGPoint, animated: Bool) -> Self {
        view.setContentOffset(contentOffset, animated: animated)
        return self
    }

    func scrollRectToVisible(_ rect: CGRect, animated: Bool) -> Self {
        view.scrollRectToVisible(rect, animated: animated)
        return self
    }

    func flashScrollIndicators() -> Self {
        view.flashScrollIndicators()
        return self
    }

    func delaysContentTouches(_ delaysContentTouches: Bool) -> Self {
        view.delaysContentTouches = delaysContentTouches
        return self
    }

    func canCancelContentTouches(_ canCancelContentTouches: Bool) -> Self {
        view.canCancelContentTouches = canCancelContentTouches
        return self
    }

    func minimumZoomScale(_ minimumZoomScale: CGFloat) -> Self {
        view.minimumZoomScale = minimumZoomScale
        return self
    }

    func maximumZoomScale(_ maximumZoomScale: CGFloat) -> Self {
        view.maximumZoomScale = maximumZoomScale
        return self
    }

    func zoomScale(_ zoomScale: CGFloat) -> Self {
        view.zoomScale = zoomScale
        return self
    }

    func setZoomScale(_ scale: CGFloat, animated: Bool) -> Self {
        view.setZoomScale(scale, animated: animated)
        return self
    }

    func zoom(to rect: CGRect, animated: Bool) -> Self {
        view.zoom(to: rect, animated: animated)
        return self
    }

    func bouncesZoom(_ bouncesZoom: Bool) -> Self {
        view.bouncesZoom = bouncesZoom
        return self
    }

    func scrollsToTop(_ scrollsToTop: Bool) -> Self {
        view.scrollsToTop = scrollsToTop
        return self
    }

    func keyboardDismissMode(_ keyboardDismissMode: UIScrollView.KeyboardDismissMode) -> Self {
        view.keyboardDismissMode = keyboardDismissMode
        return self
    }

    @available(iOS 10.0, *)
    func refreshControl(_ refreshControl: UIRefreshControl?) -> Self {
        view.refreshControl = refreshControl
        return self
    }
}
