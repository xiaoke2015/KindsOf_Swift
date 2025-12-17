//
//  ToastView.swift
//  KindOfUI
//
//  Created by i-sens on 2025/12/17.
//

import UIKit

class ToastView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        createUIs()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var titleLabel: UILabel = {
        let lazy = UILabel(frame: .zero)
        lazy.textColor = .white
        lazy.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lazy.translatesAutoresizingMaskIntoConstraints = false
        return lazy
    }()
    
    let duration: TimeInterval = 0.25
    
    func createUIs() {
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 8
        clipsToBounds = true
        addSubview(titleLabel)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
        ])
    }
    
    func show() {
        alpha = 0
        UIView.animate(withDuration: duration) { [weak self] in
            self?.alpha = 1
        }
    }
    
    func hide(completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.alpha = 0
        } completion: { [weak self] success in
            if success { self?.removeFromSuperview() }
            completion?()
        }
    }
}

public extension UIView {
    func makeToast(_ message: String?, offset: CGPoint = .zero, completion: (() -> Void)? = nil) {
        guard let message = message, !message.isEmpty else { return }
        
        let toastView = ToastView(frame: .zero)
        toastView.titleLabel.text = message
        addSubview(toastView)
        
        NSLayoutConstraint.activate([            toastView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: offset.x),
            toastView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: offset.y)
        ])
        
        toastView.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            toastView.hide(completion: completion)
        }
    }
}
