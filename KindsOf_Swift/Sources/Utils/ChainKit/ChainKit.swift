//
//  ChainKit.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

public protocol Compatible {
    associatedtype CompatibleType
    var abc: CompatibleType { get }
    static var abc: CompatibleType.Type { get }
}

public extension Compatible {
    var abc: ChainView<Self> {
        ChainView(view: self)
    }

    static var abc: ChainView<Self>.Type {
        ChainView.self
    }
}

public struct ChainView<T> {
    public let view: T

    public init(view: T) {
        self.view = view
    }
}

public extension ChainView {
    var xyz: T {
        view
    }
}
