//
//  NavigationController.swift
//  iSignal
//
//  Created by 李加建 on 2021/4/30.
//

import UIKit

open class View: UIView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
