//
//  Export.swift
//  ContentView
//
//  Created by 李加建 on 2021/9/26.
//

import UIKit

public protocol ContentView: AnyObject {
    func reloadData()
    func refreshHeader(count: Int)
    func refreshFooter(count: Int)
}

public extension ContentView {
    func refreshHeader(count _: Int) {}
    func refreshFooter(count _: Int) {}
}

public protocol ContentViewDataSource: AnyObject {
    func numberOfSections(in contentView: ContentView) -> Int
    func contentView(_ contentView: ContentView, numberOfItemsInSection section: Int) -> Int
    func contentView(_ contentView: ContentView, displayCell view: UIView, indexPath: IndexPath)
}

public extension ContentViewDataSource {
    func numberOfSections(in _: ContentView) -> Int {
        1
    }
}

public protocol ContentViewDelegate: AnyObject {
    func contentView(_ contentView: ContentView, didSelectItemAt indexPath: IndexPath)
    func contentViewHeaderRefresh(_ contentView: ContentView)
    func contentViewFooterRefresh(_ contentView: ContentView)
    func contentView(_ contentView: ContentView, didScroll scrollView: UIScrollView)
}

public extension ContentViewDelegate {
    func contentView(_: ContentView, didSelectItemAt _: IndexPath) {
        //
    }

    func contentViewHeaderRefresh(_: ContentView) {}
    func contentViewFooterRefresh(_: ContentView) {}
    func contentView(_: ContentView, didScroll _: UIScrollView) {}
}
