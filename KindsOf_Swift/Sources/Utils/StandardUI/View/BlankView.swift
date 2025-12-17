//
//  BlankView.swift
//  FoundationUI
//
//  Created by 李加建 on 2021/4/26.
//

import UIKit

public class BlankView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public init(image: UIImage?, title: String?, message: String?) {
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 234, height: 234)))
        setup(image: image, title: title, message: message)
    }

    public init(image: UIImage?, message: String?) {
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 234, height: 234)))
        setup(image: image, message: message)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var imageView: UIImageView = {
        let lazy = UIImageView(frame: CGRect(x: 0, y: 0, width: 298, height: 0))
        lazy.backgroundColor = .white
        lazy.layer.cornerRadius = 20
        return lazy
    }()

    private lazy var titleLabel: UILabel = {
        let lazy = UILabel()
        lazy.font = UIFont.systemFont(ofSize: 16)
        lazy.textColor = UIColor(red: 191 / 255.0, green: 191 / 255.0, blue: 191 / 255.0, alpha: 1)
        lazy.textAlignment = .center
        return lazy
    }()

    private lazy var messageLabel: UILabel = {
        let lazy = UILabel()
        lazy.font = UIFont.systemFont(ofSize: 12)
        lazy.textColor = UIColor(red: 191 / 255.0, green: 191 / 255.0, blue: 191 / 255.0, alpha: 1)
        lazy.numberOfLines = 0
        lazy.textAlignment = .center
        return lazy
    }()
}

extension BlankView {
    private func setup(image: UIImage?, title: String?, message: String?) {
        if let image = image {
            imageView.image = image
            addSubview(imageView)
            imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 160)
        }

        if let title = title {
            titleLabel.text = title
            addSubview(titleLabel)
            titleLabel.frame = CGRect(x: 0, y: 170, width: frame.width, height: 20)
            titleLabel.sizeToFit()
            titleLabel.frame.size.width = frame.width
        }

        if let message = message {
            messageLabel.text = message
            addSubview(messageLabel)
            messageLabel.frame = CGRect(x: 0, y: 190, width: frame.width, height: 20)
            messageLabel.sizeToFit()
            messageLabel.frame.size.width = frame.width
        }
    }

    private func setup(image: UIImage?, message: String?) {
        if let image = image {
            imageView.image = image
            addSubview(imageView)
            imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 160)
        }

        if let message = message {
            messageLabel.text = message
            addSubview(messageLabel)
            messageLabel.frame = CGRect(x: 0, y: 192, width: frame.width, height: 22)
            messageLabel.sizeToFit()
            messageLabel.frame.size.width = frame.width
        }
    }
}

public extension BlankView {
    convenience init(custom image: UIImage?, message: String?) {
        self.init(frame: CGRect(origin: .zero, size: CGSize(width: 234, height: 234)))
        setup(custom: image, message: message)
    }
}

private extension BlankView {
    func setup(custom image: UIImage?, message: String?) {
        
    }
}

public extension UIView {
    private enum Keys {
        static var blankView = "Keys.blankView"
    }

    var blankView: UIView? {
        get {
            objc_getAssociatedObject(self, Keys.blankView) as? UIView
        }
        set {
            objc_setAssociatedObject(self, Keys.blankView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
