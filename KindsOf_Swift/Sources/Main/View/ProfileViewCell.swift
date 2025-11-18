//
//  ProfileViewCell.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/10/27.
//

import UIKit
import SnapKit

class ProfileViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var roundingCorners: UIRectCorner = .allCorners
    
    var cornerRadii: CGSize = .zero
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let fieldPath = UIBezierPath.init(roundedRect:bounds,byRoundingCorners: roundingCorners,cornerRadii:cornerRadii );

        let fieldLayer = CAShapeLayer();

        fieldLayer.frame = bounds;

        fieldLayer.path = fieldPath.cgPath;

        self.layer.mask = fieldLayer;
    }

    //MARK: - 设置cell左右边距
    override var frame: CGRect {

        didSet {

            var newFrame = frame

            newFrame.origin.x += 16.0

            newFrame.size.width -= 32.0

            super.frame = newFrame

        }

    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUIs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let lazy = UILabel(frame: .zero)
        return lazy
    }()
    
    lazy var lineView: UIView = {
        let lazy = UIView(frame: .zero)
        lazy.backgroundColor = UIColor(named: "ColorE5E5E5")
        return lazy
    }()
    
    func creatUIs() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(lineView)
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.centerY.equalToSuperview()
        }
        
        lineView.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
}


extension UITableViewCell {
    //   - cornerRadii: 圆角幅度

    //   - roundingCorners: UIRectCorner(rawValue: (UIRectCorner.topRight.rawValue) | (UIRectCorner.bottomRight.rawValue))

    public func createCorner(_ cornerRadii:CGSize, _ roundingCorners:UIRectCorner) {

        let cell2 = self as? ProfileViewCell
        cell2?.cornerRadii = cornerRadii
        cell2?.roundingCorners = roundingCorners
    }
}
