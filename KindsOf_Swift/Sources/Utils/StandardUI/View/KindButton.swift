//
//  KindButton.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/7.
//

import UIKit
import SnapKit

public class KindButton: UIButton {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        creatUIs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var textLabel: UILabel = {
        let lazy = UILabel(frame: .zero)
        lazy.textAlignment = .center
        return lazy
    }()
    
    func creatUIs() {
        addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
            $0.centerY.equalToSuperview()
            $0.width.greaterThanOrEqualTo(64)
        }
    }
}
