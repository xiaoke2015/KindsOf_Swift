//
//  ProfileViewCell.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/10/27.
//

import UIKit

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
