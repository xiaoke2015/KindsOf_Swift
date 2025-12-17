//
//  File.swift
//
//
//  Created by 李加建 on 2021/12/29.
//

import UIKit.UITableView

public extension ChainView where T: UITableView {
    func delegate(_ delegate: UITableViewDelegate?) -> Self {
        view.delegate = delegate
        return self
    }

    func dataSource(_ dataSource: UITableViewDataSource?) -> Self {
        view.dataSource = dataSource
        return self
    }

    func separatorStyle(_ separatorStyle: UITableViewCell.SeparatorStyle = .singleLine) -> Self {
        view.separatorStyle = separatorStyle
        return self
    }

    func separatorInset(_ separatorInset: UIEdgeInsets) -> Self {
        view.separatorInset = separatorInset
        return self
    }

    func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) -> Self {
        view.register(cellClass, forCellReuseIdentifier: identifier)
        return self
    }

    func register(_ itemClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) -> Self {
        view.register(itemClass, forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }

    func estimatedHeight(_ rowHeight: CGFloat = 0,
                         _ sectionHeaderHeight: CGFloat = 0,
                         _ SectionFooterHeight: CGFloat = 0) -> Self
    {
        view.estimatedRowHeight = rowHeight
        view.estimatedSectionHeaderHeight = sectionHeaderHeight
        view.estimatedSectionFooterHeight = SectionFooterHeight
        return self
    }

    func disableContentInset(_: Bool) -> Self {
        if #available(iOS 11, *) {
            view.contentInsetAdjustmentBehavior = .never
        }
        return self
    }

    func tableHeaderView(_ tableHeaderView: UIView?) -> Self {
        view.tableHeaderView = tableHeaderView
        return self
    }

    func tableFooterView(_ tableFooterView: UIView?) -> Self {
        view.tableFooterView = tableFooterView
        return self
    }
}
