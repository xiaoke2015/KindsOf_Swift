//
//  HomeTestViewCell.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/7.
//

import UIKit
import SnapKit

class HomeTestViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        creatUI()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackView: UIStackView = {
        let lazy = UIStackView(arrangedSubviews: [])
        lazy.axis = .horizontal
        lazy.spacing = 12
        return lazy
    }()
    
    lazy var cancelButton: KindButton = {
        let lazy = KindButton(frame: .zero)
        lazy.backgroundColor = .orange
        lazy.textLabel.text = "取消报名"
        lazy.layer.cornerRadius = 20
//        lazy.titleEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
        lazy.addTarget(self, action: #selector(cancelButtonClick), for: .touchUpInside)
        return lazy
    }()
    
    lazy var submitButton: KindButton = {
        let lazy = KindButton(frame: .zero)
        lazy.backgroundColor = .purple
        lazy.textLabel.text = "点击加通告主"
        lazy.layer.cornerRadius = 20
        lazy.addTarget(self, action: #selector(submitButtonClick), for: .touchUpInside)
        return lazy
    }()
    
    lazy var doneButton: KindButton = {
        let lazy = KindButton(frame: .zero)
        lazy.backgroundColor = .purple
        lazy.textLabel.text = "完成"
        lazy.layer.cornerRadius = 20
        lazy.addTarget(self, action: #selector(doneButtonClick), for: .touchUpInside)
        return lazy
    }()
    
    func creatUI() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.right.equalTo(-16)
            $0.height.equalTo(40)
            $0.bottom.equalTo(-16).priority(.low)
            $0.top.equalTo(80)
        }
        stackView.backgroundColor = .lightGray
        stackView.addArrangedSubview(cancelButton)
        stackView.addArrangedSubview(submitButton)
        stackView.addArrangedSubview(doneButton)
    }
    
    @objc func cancelButtonClick() {
        print("cancelButtonClick")
    }
    
    @objc func submitButtonClick() {
        print("submitButtonClick")
    }
    
    @objc func doneButtonClick() {
        print("doneButtonClick")
    }
}
