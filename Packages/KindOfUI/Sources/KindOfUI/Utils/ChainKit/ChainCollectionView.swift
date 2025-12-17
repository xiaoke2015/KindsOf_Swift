//
//  ChainCollectionView.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UICollectionView

public extension ChainView where T: UICollectionView {
    func collectionViewLayout(_ collectionViewLayout: UICollectionViewLayout = UICollectionViewFlowLayout()) -> Self {
        view.collectionViewLayout = collectionViewLayout
        return self
    }

    func prefetchDataSource(_ prefetchDataSource: UICollectionViewDataSourcePrefetching?) -> Self {
        view.prefetchDataSource = prefetchDataSource
        return self
    }

    func isPrefetchingEnabled(_ isPrefetchingEnabled: Bool) -> Self {
        view.isPrefetchingEnabled = isPrefetchingEnabled
        return self
    }

    @available(iOS 11.0, *)
    func dragDelegate(_ dragDelegate: UICollectionViewDragDelegate?) -> Self {
        view.dragDelegate = dragDelegate
        return self
    }

    @available(iOS 11.0, *)
    func dropDelegate(_ dropDelegate: UICollectionViewDropDelegate?) -> Self {
        view.dropDelegate = dropDelegate
        return self
    }

    @available(iOS 11.0, *)
    func dragInteractionEnabled(_ dragInteractionEnabled: Bool) -> Self {
        view.dragInteractionEnabled = dragInteractionEnabled
        return self
    }

    @available(iOS 11.0, *)
    func reorderingCadence(_ reorderingCadence: UICollectionView.ReorderingCadence) -> Self {
        view.reorderingCadence = reorderingCadence
        return self
    }

    func backgroundView(_ backgroundView: UIView?) -> Self {
        view.backgroundView = backgroundView
        return self
    }

    func allowsSelection(_ allowsSelection: Bool) -> Self {
        view.allowsSelection = allowsSelection
        return self
    }

    func allowsMultipleSelection(_ allowsMultipleSelection: Bool) -> Self {
        view.allowsMultipleSelection = allowsMultipleSelection
        return self
    }

    func delegate(_ delegate: UICollectionViewDelegate?) -> Self {
        view.delegate = delegate
        return self
    }

    func dataSource(_ dataSource: UICollectionViewDataSource?) -> Self {
        view.dataSource = dataSource
        return self
    }

    func register(_ cellClass: AnyClass?, _ identifier: String) -> Self {
        view.register(cellClass, forCellWithReuseIdentifier: identifier)
        return self
    }

    func registerSupplementary(_ itemClass: AnyClass?, _ elementKind: String, _ identifier: String) -> Self {
        view.register(itemClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
        return self
    }

    func disableContentInset(_: Bool = true) -> Self {
        if #available(iOS 11, *) {
            view.contentInsetAdjustmentBehavior = .never
        }
        return self
    }
}
