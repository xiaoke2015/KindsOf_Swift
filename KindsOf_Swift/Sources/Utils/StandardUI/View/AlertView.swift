//
//  AlertView.swift
//  SftDemo4
//
//  Created by 李加建 on 2021/4/25.
//

import Foundation
import UIKit

struct AlertViewOption {
    let backgroundColor = UIColor.black.withAlphaComponent(0.5)
    let titleFont = UIFont.boldSystemFont(ofSize: 18)
    let titleColor = UIColor.black.withAlphaComponent(0.82)
    let messageFont = UIFont.systemFont(ofSize: 16)
    let messageColor = UIColor.black.withAlphaComponent(0.82)

    let leftTitleColor = UIColor(red: 1, green: 0.375, blue: 0.412, alpha: 1)
    let rightTitleColor = UIColor.black.withAlphaComponent(0.82)
    let lineColor = UIColor.black.withAlphaComponent(0.12)
}

public class AlertView: UIView {
    var option = AlertViewOption()
    public init(title: String?, message: String?, doneButtonTitle: String?) {
        super.init(frame: UIScreen.main.bounds)
        setup()
        setup(title: title, message: message, doneButtonTitle: doneButtonTitle)
    }

    public init(title: String?, message: String?, leftButtonTitle: String?, rightButtonTitle: String?) {
        super.init(frame: UIScreen.main.bounds)
        setup()
        setup(title: title, message: message, leftButtonTitle: leftButtonTitle, rightButtonTitle: rightButtonTitle)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var bgView: UIButton = {
        let lazy = UIButton(frame: bounds)
        lazy.backgroundColor = option.backgroundColor
        return lazy
    }()

    private lazy var customView: UIView = {
        let lazy = UIView(frame: CGRect(x: 0, y: 0, width: 298, height: 0))
        lazy.backgroundColor = .white
        lazy.layer.cornerRadius = 20
        return lazy
    }()

    private lazy var titleLabel: UILabel = {
        let lazy = UILabel()
        lazy.font = option.titleFont
        lazy.textColor = option.titleColor
        lazy.textAlignment = .center
        return lazy
    }()

    private lazy var messageLabel: UILabel = {
        let lazy = UILabel()
        lazy.font = option.messageFont
        lazy.textColor = option.messageColor
        lazy.numberOfLines = 0
        lazy.textAlignment = .center
        return lazy
    }()

    private lazy var doneButton: UIButton = {
        let lazy = UIButton(frame: CGRect(x: 0, y: 0, width: customView.frame.width - 64, height: 52))
        lazy.setTitleColor(UIColor.black.withAlphaComponent(0.82), for: .normal)
        lazy.backgroundColor = UIColor(red: 255 / 255.0, green: 217 / 255.0, blue: 84 / 255.0, alpha: 1)
        lazy.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        lazy.clipsToBounds = true
        lazy.layer.cornerRadius = 16
        lazy.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        return lazy
    }()

    private lazy var leftButton: UIButton = {
        let lazy = UIButton(frame: CGRect(x: 0, y: 0, width: customView.frame.width - 64, height: 52))
        lazy.setTitleColor(option.leftTitleColor, for: .normal)
        lazy.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        lazy.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        return lazy
    }()

    private lazy var rightButton: UIButton = {
        let lazy = UIButton(frame: CGRect(x: 0, y: 0, width: customView.frame.width - 64, height: 52))
        lazy.setTitleColor(option.rightTitleColor, for: .normal)
        lazy.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        lazy.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        return lazy
    }()

    private lazy var horizontalLine: UIView = {
        let lazy = UIView()
        lazy.backgroundColor = option.lineColor
        return lazy
    }()

    private lazy var verticalLine: UIView = {
        let lazy = UIView()
        lazy.backgroundColor = option.lineColor
        return lazy
    }()

    open var doneButtonBlock: (() -> Void)?
    open var leftButtonBlock: (() -> Void)?
    open var rightButtonBlock: (() -> Void)?
}

private extension AlertView {
    var messageAttributed: [NSAttributedString.Key: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 5
        let attr: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.82),
            NSAttributedString.Key.font: UIFont(name: "PingFangSC-Regular", size: 16) as Any,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ]
        return attr
    }
}

private extension AlertView {
    func setup() {
        addSubview(bgView)
        addSubview(customView)
    }

    func setup(title: String?, message: String?, doneButtonTitle: String?) {
        var pointY: CGFloat = 32
        if let title = title {
            customView.addSubview(titleLabel)
            titleLabel.frame = CGRect(x: 32, y: pointY, width: customView.frame.width - 64, height: 24)
            titleLabel.text = title
            titleLabel.heightToFit()
            pointY = titleLabel.frame.maxY + 16
        }

        if let message = message {
            customView.addSubview(messageLabel)
            messageLabel.frame = CGRect(x: 32, y: pointY, width: customView.frame.width - 64, height: 24)
            messageLabel.attributedText = NSAttributedString(string: message, attributes: messageAttributed)
            messageLabel.heightToFit()
            pointY = messageLabel.frame.maxY + 32
        }

        if pointY < 88 {
            pointY = 88
        }

        if let doneButtonTitle = doneButtonTitle {
            customView.addSubview(doneButton)
            doneButton.frame = CGRect(x: 32, y: pointY, width: customView.frame.width - 64, height: 52)
            doneButton.setTitle(doneButtonTitle, for: .normal)
            pointY = doneButton.frame.maxY + 32
        } else {
            pointY += 32
        }

        customView.frame = CGRect(x: 0, y: 0, width: 298, height: pointY)
        customView.center = center
    }

    func setup(title: String?, message: String?, leftButtonTitle: String?, rightButtonTitle: String?) {
        var pointY: CGFloat = 32
        if let title = title {
            customView.addSubview(titleLabel)
            titleLabel.frame = CGRect(x: 32, y: pointY, width: customView.frame.width - 64, height: 24)
            titleLabel.text = title
            titleLabel.heightToFit()
            pointY = titleLabel.frame.maxY + 16
        }

        if let message = message {
            customView.addSubview(messageLabel)
            messageLabel.frame = CGRect(x: 32, y: pointY, width: customView.frame.width - 64, height: 24)
            messageLabel.attributedText = NSAttributedString(string: message, attributes: messageAttributed)
            messageLabel.heightToFit()
            pointY = messageLabel.frame.maxY + 32
        }

        if pointY < 88 {
            pointY = 88
        }

        let half: CGFloat = customView.frame.width / 2
        customView.addSubview(leftButton)
        leftButton.frame = CGRect(x: 0, y: pointY, width: half, height: 62)
        leftButton.setTitle(leftButtonTitle, for: .normal)

        customView.addSubview(rightButton)
        rightButton.frame = CGRect(x: half, y: pointY, width: half, height: 62)
        rightButton.setTitle(rightButtonTitle, for: .normal)

        customView.addSubview(horizontalLine)
        horizontalLine.frame = CGRect(x: 0, y: pointY, width: customView.frame.width, height: 0.5)

        customView.addSubview(verticalLine)
        verticalLine.frame = CGRect(x: half - 0.25, y: pointY, width: 0.5, height: 62)

        pointY += 62

        customView.frame = CGRect(x: 0, y: 0, width: 298, height: pointY)
        customView.center = center
    }
}

private extension AlertView {
    @objc
    func doneButtonAction() {
        doneButtonBlock?()
        removeFromSuperview()
    }

    @objc
    func leftButtonAction() {
        leftButtonBlock?()
        removeFromSuperview()
    }

    @objc
    func rightButtonAction() {
        rightButtonBlock?()
        removeFromSuperview()
    }
}

private extension UIView {
    func heightToFit() {
        var rect = frame
        sizeToFit()
        if frame.size.height > rect.size.height {
            rect.size.height = frame.size.height
        }
        frame = rect
    }
}
