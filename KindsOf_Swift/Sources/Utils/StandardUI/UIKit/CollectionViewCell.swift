//
//  CollectionViewCell.swift
//  StandardUI
//
//  Created by 李加建 on 2021/10/25.
//

import UIKit

open class CollectionViewCell: UICollectionViewCell {
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CollectionViewCell {
    func setup() {
        //
    }
}
